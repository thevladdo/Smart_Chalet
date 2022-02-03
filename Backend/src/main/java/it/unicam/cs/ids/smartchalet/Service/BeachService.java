package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Beach;
import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Repository.BeachRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;

@Service
public class BeachService {

    @Autowired
    private BeachRepository repository;

    private Beach getBeach(int id){
        if(repository.findById(id).isEmpty()) repository.insert(Beach.singletonBeach());
        return repository.findById(id).get();
    }

    public ArrayList<ArrayList<Umbrella>> getBeachStatus(int id){
        if (getBeach(id).getBeach().size() == 0)
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No umbrella on the beach");
        return getBeach(id).getBeach();
    }
}
