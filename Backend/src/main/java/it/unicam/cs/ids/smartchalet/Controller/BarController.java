package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Service.BarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;

@RestController
@RequestMapping(path = "smartchalet/bar")
public class BarController {

    @Autowired
    private BarService barService;

    @PostMapping("/addItem")
    //TODO same as ActivityController
    @PreAuthorize("hasAuthority('MANAGER')")
    public BarItem addItem(BarItem item){
        return barService.addItem(item);
    }

    @DeleteMapping("/deleteItem")
    @PreAuthorize("hasAuthority('MANAGER')")
    public BarItem deleteItem(BarItem item){
        return barService.removeItem(item);
    }

    @PutMapping("/updateItem")
    @PreAuthorize("hasAuthority('MANAGER')")
    public BarItem updateItem(BarItem newItem){
        return barService.updateItem(newItem);
    }

    //GenericUser: Ricerca prodotto bar
    @GetMapping("/public/search/barProduct")
    public BarItem searchBarItem(String name){
        return barService.getItem(name,1);
    }

    //GenericUser: Visualizza prodotti bar disponibili
    @GetMapping("/public/available")
    public ArrayList<BarItem> getAvailableProducts(){
        return barService.getAvailableItems(1);
    }

    @GetMapping("/public/barProducts")
    public ArrayList<BarItem> getAllProducts(){
        return barService.getAllItems();
    }


}
