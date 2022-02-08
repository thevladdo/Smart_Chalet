package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Service.BeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;

@RestController
@RequestMapping(path = "smartchalet/beach")
public class BeachController {

    @Autowired
    private BeachService service;

    @GetMapping("/public/status")
    public ArrayList<Umbrella> getStatus(){
        return service.getBeachStatus(1);
    }

    @PostMapping("/add/umbrella")
    //TODO same as ActivityController
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella addUmbrella (Umbrella toAdd){
        return service.addUmbrella(toAdd);
    }

    @DeleteMapping("/delete/umbrella")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public boolean deleteUmbrella (Umbrella toRemove){
        return service.removeUmbrella(toRemove);
    }

    @PutMapping("/update/umbrella")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella updateUmbrella (Umbrella toUpdate){
        return service.updateUmbrella(toUpdate);
    }

    @PutMapping("/update/lounger/add")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella addLounger (Umbrella umbrella){
        return service.addOneLounger(umbrella);
    }

    @PutMapping("/update/lounger/remove")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella removeLounger (Umbrella umbrella){
        return service.removeOneLounger(umbrella);
    }
}
