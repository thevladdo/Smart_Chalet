package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Beach;
import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Repository.BeachRepository;
import it.unicam.cs.ids.smartchalet.Repository.UmbrellaRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;

@Service
public class BeachService {

    @Autowired
    private BeachRepository repository;

    @Autowired
    private UmbrellaRepository umbrellaRepository;

    private Beach getBeach(int id){
        if(repository.findById(id).isEmpty()) repository.insert(Beach.singletonBeach());
        return repository.findById(id).get();
    }

    public ArrayList<ArrayList<Umbrella>> getBeachStatus(int id){
        if (getBeach(id).getBeach().size() == 0)
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No umbrella on the beach");
        return getBeach(id).getBeach();
    }

    public Umbrella addUmbrella (int x, int y, @NonNull Umbrella toAdd){
        if(!umbrellaRepository.existsById(toAdd.getId())){
            Beach.singletonBeach().getBeach().get(y).add(x,toAdd);
            repository.save(Beach.singletonBeach());
            return umbrellaRepository.insert(toAdd);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to add existing umbrella");
    }

    public boolean removeUmbrella (int y, @NonNull Umbrella toRemove){
        if (umbrellaRepository.existsById(toRemove.getId())){
            Beach.singletonBeach().getBeach().get(y).removeIf(Umbrella -> Umbrella.getId().equals(toRemove.getId()));
            repository.save(Beach.singletonBeach());
            umbrellaRepository.delete(toRemove);
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to remove not existing umbrella");
    }

    public Umbrella updateUmbrella (int x, int y, @NonNull Umbrella toUpdate){
        if(umbrellaRepository.existsById(toUpdate.getId())){
            if(Beach.singletonBeach().getBeach().get(y).get(x).getId().equals(toUpdate.getId())){
                Beach.singletonBeach().getBeach().get(y).set(x,toUpdate);
                repository.save(Beach.singletonBeach());
                return umbrellaRepository.save(toUpdate);
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot update umbrella id");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to update not existing umbrella");
    }
}
