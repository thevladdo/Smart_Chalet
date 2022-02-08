package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Reservation;
import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Repository.ReservationRepository;
import it.unicam.cs.ids.smartchalet.Repository.UmbrellaRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.Date;
import java.util.UUID;

@Service
public class ReservationService {

    @Autowired
    private ReservationRepository repository;

    @Autowired
    private UmbrellaRepository umbrellaRepository;

    public Reservation createReservation(@NonNull Reservation reservation){
        if(reservation.getId() == null) reservation.setId(UUID.randomUUID());
        if(reservation.getDate().before(new Date()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not possible to reserve in this date");
        if (repository.existsById(reservation.getId()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "This reservation already exist");
        for (Umbrella u : reservation.getUmbrellas()) {
            reserve(u);
            umbrellaRepository.save(u);
        } return repository.insert(reservation);
    }

    public Reservation getReservation(@NonNull UUID id){
        if(!repository.existsById(id)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation do not exist");
        } else return repository.findById(id).get();
    }

    public Reservation updateReservation(@NonNull Reservation updated){
        Reservation old = repository.findById(updated.getId()).get();
        if (!updated.getDate().before(new Date()) && !old.getDate().before(new Date()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not possible to reserve in this date");
        if (repository.findById(updated.getId()).isPresent()) {

            return repository.save(updated);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Activity don't already exist. Try to add it");
    }

    public boolean deleteReservation(@NonNull Reservation reservation){
        if(repository.existsById(reservation.getId())){
            for (Umbrella u : repository.findById(reservation.getId()).get().getUmbrellas()){
                umbrellaRepository.findById(u.getId()).get().setDisponibility(true);
                umbrellaRepository.save(u);
            } repository.delete(reservation);
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to delete non existing reservation");
    }

    private void reserve(@NonNull Umbrella toReserve){
        if (!umbrellaRepository.findById(toReserve.getId()).get().getDisponibility())
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella is already reserved");
        umbrellaRepository.findById(toReserve.getId()).get().setDisponibility(false);
        umbrellaRepository.save(toReserve);
    }
}
