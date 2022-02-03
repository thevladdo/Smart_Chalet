package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Repository.UmbrellaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class UmbrellaService {

    @Autowired
    private UmbrellaRepository repository;

    public Umbrella addLounger(Umbrella umbrella){
        if(umbrella.getQntLounger() < 2){
            umbrella.setQntLounger(umbrella.getQntLounger()+1);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Umbrella has already 2 Loungers");
        return repository.save(umbrella);
    }

}
