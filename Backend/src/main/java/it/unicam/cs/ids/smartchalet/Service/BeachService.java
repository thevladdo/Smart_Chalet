package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Repository.UmbrellaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import lombok.NonNull;
import java.util.List;
import java.util.UUID;

@Service
public class BeachService {

    @Autowired
    private UmbrellaRepository umbrellaRepository;

    public List<Umbrella> getBeachStatus(){
        if (umbrellaRepository.findAll().size() == 0)
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No umbrella on the beach");
        return umbrellaRepository.findAll();
    }

    public Umbrella addUmbrella (@NonNull Umbrella toAdd){
        if(toAdd.getQtyLounger() > 2 || toAdd.getQtyLounger() < 0)
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "The umbrella can have only 0, 1 or 2 Loungers");
        if(toAdd.getId() == null) toAdd.setId(UUID.randomUUID());
        if(!umbrellaRepository.existsById(toAdd.getId())){
            List<Umbrella> beach = umbrellaRepository.findAll();
            for (Umbrella u: beach) {
                if(toAdd.getX() == u.getX() && toAdd.getY() == u.getY())
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "There already exist an umbrella in this place");
            } umbrellaRepository.insert(toAdd);
            return toAdd;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to add existing umbrella");
    }

    public boolean removeUmbrella (@NonNull Umbrella toRemove){
        if (umbrellaRepository.existsById(toRemove.getId())){
            umbrellaRepository.delete(toRemove);
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to remove not existing umbrella");
    }

    public Umbrella updateUmbrella (@NonNull Umbrella toUpdate){
        if(umbrellaRepository.existsById(toUpdate.getId())){
            umbrellaRepository.save(toUpdate);
            return toUpdate;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to update not existing umbrella");
    }

    public Umbrella addOneLounger(@NonNull Umbrella umbrella){
        if(umbrella.getQtyLounger() < 2){
            umbrella.setQtyLounger(umbrella.getQtyLounger()+1);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella has already 2 Loungers");
        umbrellaRepository.save(umbrella);
        return umbrella;
    }

    public Umbrella removeOneLounger(@NonNull Umbrella umbrella){
        if(umbrella.getQtyLounger() > 0){
            umbrella.setQtyLounger(umbrella.getQtyLounger()-1);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella has already 2 Loungers");
        umbrellaRepository.save(umbrella);
        return umbrella;
    }
}