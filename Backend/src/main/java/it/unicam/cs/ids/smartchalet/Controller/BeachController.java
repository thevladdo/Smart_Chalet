package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Service.BeachService;
import it.unicam.cs.ids.smartchalet.Security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping(path = "smartchalet/beach")
public class BeachController {

    @Autowired
    private BeachService service;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @GetMapping("/public/status")
    @PreAuthorize("permitAll()")
    public List<Umbrella> getStatus(){
        return service.getBeachStatus(1);
    }

    @PostMapping("/add/umbrella")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella addUmbrella (@RequestBody @Param("toAdd") Umbrella toAdd){
        return service.addUmbrella(toAdd);
    }

    @DeleteMapping("/delete/umbrella")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public boolean deleteUmbrella (@RequestBody @Param("toRemove")Umbrella toRemove){
        return service.removeUmbrella(toRemove);
    }

    @PutMapping("/update/umbrella")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella updateUmbrella (@RequestBody @Param("toUpdate")Umbrella toUpdate){
        return service.updateUmbrella(toUpdate);
    }

    @PutMapping("/update/lounger/add")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella addLounger (@RequestBody @Param("umbrella")Umbrella umbrella){
        return service.addOneLounger(umbrella);
    }

    @PutMapping("/update/lounger/remove")
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public Umbrella removeLounger (@RequestBody @Param("umbrella")Umbrella umbrella){
        return service.removeOneLounger(umbrella);
    }
}
