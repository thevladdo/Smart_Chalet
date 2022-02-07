package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Service.BarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;

@RestController
@RequestMapping(path = "smartchalet/bar")
public class BarController {

    @Autowired
    private BarService barService;

    public BarController(BarService service){
        barService=service;
    }

    @PostMapping("/addItem")
    public BarItem addItem(BarItem item){
        return barService.addItem(item);
    }

    @DeleteMapping("/deleteItem")
    public BarItem deleteItem(BarItem item){
        return barService.removeItem(item);
    }

    @PutMapping("/updateItem")
    public BarItem updateItem(BarItem newItem){
        return barService.updateItem(newItem);
    }

    //GenericUser: Ricerca prodotto bar
    @GetMapping("/search/barProduct")
    public BarItem searchBarItem(String name){
        return barService.getItem(name,1);
    }

    //GenericUser: Visualizza prodotti bar disponibili
    @GetMapping("/available")
    public ArrayList<BarItem> getAvailableProducts(){
        return barService.getAvailableItems(1);
    }

    @GetMapping("/barProducts")
    public ArrayList<BarItem> getAllProducts(){
        return barService.getAllItems();
    }


}
