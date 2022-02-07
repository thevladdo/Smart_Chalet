package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Service.BeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;

@RestController
@RequestMapping(path = "smartchalet/beach")
public class BeachController {

    @Autowired
    private BeachService service;

    @GetMapping("/status")
    public ArrayList<Umbrella> getStatus(){
        return service.getBeachStatus(1);
    }

    @PostMapping("/add/umbrella")
    public Umbrella addUmbrella (Umbrella toAdd){
        return service.addUmbrella(toAdd);
    }

    @DeleteMapping("/delete/umbrella")
    public boolean deleteUmbrella (Umbrella toRemove){
        return service.removeUmbrella(toRemove);
    }

    @PutMapping("/update/umbrella")
    public Umbrella updateUmbrella (Umbrella toUpdate){
        return service.updateUmbrella(toUpdate);
    }
}
