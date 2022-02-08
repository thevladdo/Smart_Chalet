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
import java.util.UUID;

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

    public ArrayList<Umbrella> getBeachStatus(int id){
        if (getBeach(id).getBeach().size() == 0)
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No umbrella on the beach");
        return getBeach(id).getBeach();
    }

    public Umbrella addUmbrella (@NonNull Umbrella toAdd){
        if(toAdd.getQtyLounger() > 2 || toAdd.getQtyLounger() < 0)
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "One umbrella can have only 0, 1 or 2 Loungers");
        if(toAdd.getId() == null) toAdd.setId(UUID.randomUUID());
        if(!umbrellaRepository.existsById(toAdd.getId())){
            for (Umbrella u: Beach.singletonBeach().getBeach()) {
                if(toAdd.getX() == u.getX() && toAdd.getY() == u.getY())
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "There already exist an umbrella in this place");
            }
            Beach.singletonBeach().getBeach().add(toAdd);
            repository.save(Beach.singletonBeach());
            return umbrellaRepository.insert(toAdd);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to add existing umbrella");
    }

    public boolean removeUmbrella (@NonNull Umbrella toRemove){
        if (umbrellaRepository.existsById(toRemove.getId())){
            Beach.singletonBeach().getBeach().removeIf(Umbrella -> Umbrella.getId().equals(toRemove.getId()));
            repository.save(Beach.singletonBeach());
            umbrellaRepository.delete(toRemove);
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to remove not existing umbrella");
    }

    public Umbrella updateUmbrella (@NonNull Umbrella toUpdate){
        if(umbrellaRepository.existsById(toUpdate.getId())){
            for (Umbrella u : Beach.singletonBeach().getBeach()) {
                if(u.getId().equals(toUpdate.getId())) {
                    Beach.singletonBeach().getBeach().set(Beach.singletonBeach().getBeach().indexOf(u), toUpdate);
                    repository.save(Beach.singletonBeach());
                    return umbrellaRepository.save(toUpdate);
                }
            } throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot update umbrella id");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to update not existing umbrella");
    }

    public Umbrella addOneLounger(@NonNull Umbrella umbrella){
        if(umbrella.getQtyLounger() < 2){
            umbrella.setQtyLounger(umbrella.getQtyLounger()+1);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella has already 2 Loungers");
        Beach.singletonBeach().getBeach().set(Beach.singletonBeach().getBeach().indexOf(umbrella),umbrella);
        repository.save(Beach.singletonBeach());
        return umbrellaRepository.save(umbrella);
    }

    public Umbrella removeOneLounger(@NonNull Umbrella umbrella){
        if(umbrella.getQtyLounger() > 0){
            umbrella.setQtyLounger(umbrella.getQtyLounger()-1);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella has already 2 Loungers");
        Beach.singletonBeach().getBeach().set(Beach.singletonBeach().getBeach().indexOf(umbrella),umbrella);
        repository.save(Beach.singletonBeach());
        return umbrellaRepository.save(umbrella);
    }
}