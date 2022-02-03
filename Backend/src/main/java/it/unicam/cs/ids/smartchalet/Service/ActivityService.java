package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Activity;
import it.unicam.cs.ids.smartchalet.Repository.ActivityRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class ActivityService {

    @Autowired
    private ActivityRepository repository;

    public Activity addActiviy(@NonNull Activity activity){
        if(existById(activity.getName())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid user: this user already exists");
        } else return repository.insert(activity);
    }

    public boolean deleteActivity(@NonNull String name){
        if (existById(name)) {
            repository.deleteById(name);
            return true;
        } else return false;
    }

    public Activity updateActivity(@NonNull Activity updated){
        if (repository.findById(updated.getName()).isPresent()) {
            return repository.save(updated);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Activity don't already exist. Try to add it");
    }

    public Activity getByName(@NonNull String name){
        if(repository.findById(name).isEmpty())
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No activity found");
        return repository.findById(name).get();
    }

    public void removeSpot(@NonNull String activityName, int toRemove){
        Activity activity = repository.findById(activityName).get();
        if(repository.findById(activityName).isPresent()){
            if(activity.getFreeSpots()>=toRemove){
                activity.setFreeSpots(activity.getFreeSpots()-toRemove);
                updateActivity(activity);
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Can't remove. Required spots are more than available");
        }else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Activity not found");
    }

    private boolean existById(@NonNull String name){
        return repository.existsById(name);
    }
}
