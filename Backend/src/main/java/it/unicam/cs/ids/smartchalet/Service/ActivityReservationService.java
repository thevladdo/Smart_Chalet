package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import it.unicam.cs.ids.smartchalet.Repository.ActivityReservationRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.Date;
import java.util.UUID;

@Service
public class ActivityReservationService {

    @Autowired
    private ActivityReservationRepository repository;

    @Autowired
    private ActivityService activityService;

    public ActivityReservation createNew(@NonNull ActivityReservation reservation){
        if(reservation.getId() == null) reservation.setId(UUID.randomUUID());
        if(reservation.getDate().before(new Date()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not possible to reserve in this date");
        if(repository.existsById(reservation.getId())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation already exist");
        } else activityService.removeSpot(reservation.getActivityName(),reservation.getCapacity());
        return repository.insert(reservation);
    }

    public ActivityReservation getReservation(@NonNull UUID id){
        if(!repository.existsById(id)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation do not exist");
        } else return repository.findById(id).get();
    }

    public boolean deleteReservation(@NonNull ActivityReservation reservation){
        if(repository.existsById(reservation.getId())){
            activityService.reinsertSpots(reservation.getActivityName(),reservation.getCapacity());
            repository.delete(reservation);
            return true;
        } else return false;
    }

    public ActivityReservation updateReservation(@NonNull ActivityReservation updated){
        ActivityReservation old = repository.findById(updated.getId()).get();
        if (!updated.getDate().before(new Date()) && !old.getDate().before(new Date()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not possible to reserve in this date");
        if (repository.findById(updated.getId()).isPresent()) {
            if(old.getCapacity() > updated.getCapacity()){
                activityService.reinsertSpots(updated.getActivityName(),(old.getCapacity()-updated.getCapacity()));
            } else activityService.removeSpot(updated.getActivityName(),(updated.getCapacity()-old.getCapacity()));
            return repository.save(updated);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Activity don't already exist. Try to add it");
    }
}
