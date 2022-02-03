package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import it.unicam.cs.ids.smartchalet.Repository.ActivityReservationRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class ActivityReservationService {

    @Autowired
    private ActivityReservationRepository repository;

    private ActivityService activityService;

    public ActivityReservation createNew(@NonNull ActivityReservation reservation){
        if(repository.existsById(reservation.getId())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation already exist");
        } else activityService.removeSpot(reservation.getActivity().getName(),reservation.getCapacity());
        return repository.insert(new ActivityReservation());
    }

    public ActivityReservation getReservation(String userMail){
        if(!repository.existsByUserId(userMail)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation do not exist");
        } else return repository.findByUserId(userMail);
    }

    public boolean deleteReservation(ActivityReservation reservation){
        if(repository.existsById(reservation.getId())){
            repository.delete(reservation);
            return true;
        } else return false;
    }

    public ActivityReservation updateReservation(ActivityReservation updated){
        if (repository.findById(updated.getId()).isPresent()) {
            repository.save(updated);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Activity don't already exist. Try to add it");
        return updated;
    }
}
