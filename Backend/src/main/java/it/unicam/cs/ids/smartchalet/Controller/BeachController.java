package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Service.BeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;

@RestController
@RequestMapping("smartchalet/beach")
public class BeachController {

    @Autowired
    private BeachService service;

    @GetMapping("/status")
    public ArrayList<ArrayList<Umbrella>> getStatus(){
        return service.getBeachStatus(1);
    }

    @PostMapping("/add/umbrella")
    public Umbrella addUmbrella (int x, int y, Umbrella toAdd){
        return service.addUmbrella(x, y, toAdd);
    }

    @DeleteMapping("/delete/umbrella")
    public boolean deleteUmbrella (int y, Umbrella toRemove){
        return service.removeUmbrella(y, toRemove);
    }

    @PutMapping("/update/umbrella")
    public Umbrella updateUmbrella (int x, int y, Umbrella toUpdate){
        return service.updateUmbrella(x, y, toUpdate);
    }
}
