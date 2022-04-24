package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Service.BarService;
import it.unicam.cs.ids.smartchalet.Security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(path = "smartchalet/bar")
public class BarController {

    @Autowired
    private BarService barService;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/addItem")
    @PreAuthorize("hasAuthority('MANAGER')")
    public BarItem addItem(@RequestBody @Param("item") BarItem item){
        return barService.addItem(item);
    }

    @DeleteMapping("/deleteItem")
    @PreAuthorize("hasAuthority('MANAGER')")
    public BarItem deleteItem(@RequestBody @Param("item") BarItem item){
        return barService.removeItem(item);
    }

    @PutMapping("/updateItem")
    @PreAuthorize("hasAuthority('MANAGER')")
    public BarItem updateItem(@RequestBody @Param("item") BarItem newItem){
        return barService.updateItem(newItem);
    }

    @GetMapping("/public/search/{name}")
    public BarItem searchBarItem(@PathVariable String name){
        return barService.getItem(name);
    }

    @GetMapping("/public/available")
    public ArrayList<BarItem> getAvailableProducts(){
        return barService.getAvailableItems(1);
    }

    @GetMapping("/public/barProducts")
    public List<BarItem> getAllProducts(){
        return barService.getAllItems();
    }


}
