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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ReservationService {

    @Autowired
    private ReservationRepository repository;

    @Autowired
    private UmbrellaRepository umbrellaRepository;

    public Reservation createReservation(@NonNull Reservation reservation){
        if(reservation.getId() == null) reservation.setId(UUID.randomUUID());
        if(reservation.getDate().before(new Date(System.currentTimeMillis())))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not possible to reserve in this date");
        checkDuplacates(reservation);
        if (repository.existsById(reservation.getId()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "This reservation already exist");
        for (Umbrella u : reservation.getUmbrellas()) {
            reserve(u);
        } return repository.insert(reservation);
    }

    public Reservation getReservation(@NonNull UUID id){
        if(!repository.existsById(id)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation do not exist");
        } else return repository.findById(id).get();
    }

    public Reservation updateReservation(@NonNull Reservation updated){
        Reservation old = repository.findById(updated.getId()).get();
        if (updated.getDate().before(new Date(System.currentTimeMillis()))
                && old.getDate().before(new Date(System.currentTimeMillis())))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not possible to reserve in this date");
        checkDuplacates(updated);
        if (repository.findById(updated.getId()).isPresent()) {
            return repository.save(updated);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Activity don't already exist. Try to add it");
    }

    public boolean deleteReservation(@NonNull Reservation reservation){
        if(repository.existsById(reservation.getId())){
            for (Umbrella u : repository.findById(reservation.getId()).get().getUmbrellas()){
                u.setDisponibility(true);
                umbrellaRepository.save(u);
            } repository.delete(reservation);
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to delete non existing reservation");
    }

    public List<Reservation> getStatus(){
        if (repository.findAll().size() != 0){
            return repository.findAll()
                    .parallelStream()
                    .filter(Reservation -> Reservation.getDate().after(new Date(System.currentTimeMillis())))
                    .collect(Collectors.toCollection(ArrayList::new));
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "No new orders");
    }

    private void reserve(@NonNull Umbrella toReserve){
        if (!umbrellaRepository.findById(toReserve.getId()).get().getDisponibility())
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella is already reserved");
        toReserve.setDisponibility(false);
        umbrellaRepository.save(toReserve);
    }

    private void checkDuplacates(Reservation reservation){
        for (Reservation r : repository.findAll()){
            if (r.getDate().equals(reservation.getDate())){
                for (Umbrella u : r.getUmbrellas()){
                    for (Umbrella myU : reservation.getUmbrellas())
                        if (u.getId() == (myU.getId()))
                            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"The selected umbrellas are already reserved");
                }
            }
        }
    }
}
