package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.*;
import java.util.ArrayList;
import it.unicam.cs.ids.smartchalet.Service.ActivityService;
import it.unicam.cs.ids.smartchalet.Service.BarService;
import it.unicam.cs.ids.smartchalet.Service.BeachService;
import it.unicam.cs.ids.smartchalet.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "smartchalet/user")
public class UserController {

    @Autowired
    private final UserService userService;

    @Autowired
    private final BeachService beachService;

    @Autowired
    private final BarService barService;

    @Autowired
    private final ActivityService activityService;

    @Autowired//dependency injection with @component
    public UserController(UserService userService, BeachService beachService,
                          BarService barService, ActivityService activityService) {
        this.userService = userService;
        this.beachService = beachService;
        this.barService = barService;
        this.activityService = activityService;
    }

    @GetMapping("/get")
    public AppUser getUser(String mail){
        return userService.findById(mail);
    }

    @PostMapping("/add")
    public AppUser addUser(AppUser user){
        return userService.addUser(user);
    }

    @DeleteMapping("/delete")
    public boolean deleteUser(String mail){
        return userService.deleteUser(mail);
    }

    @PutMapping("/update")
    public AppUser updateUser(AppUser newUser){
        return userService.updateUser(newUser);
    }

    //AuthenticatedUser: Accedi all'area riservata
    @GetMapping("/details")
    public String getDetails(String email){
        return userService.getUserDetils(email);
    }

    //TODO usare in BeachController
    //GenericUser: Visualizza stato spiaggia
    @GetMapping("/beachStatus")
    public ArrayList<ArrayList<Umbrella>> getBeachStatus(){
        return beachService.getBeachStatus(1);
    }

    //TODO usare in BarController
    //GenericUser: Visualizza prodotti bar disponibili
    @GetMapping("/barProducts")
    public ArrayList<BarItem> getProducts(){
        return barService.getItems(1);
    }

    //TODO usare in ActivityController
    //GenericUser: Ricerca attività
    @GetMapping("/search/activity")
    public Activity searchActivity(String name){
        return activityService.getByName(name);
    }

    //TODO usare in BarController
    //GenericUser: Ricerca prodotto bar
    @GetMapping("/search/barProduct")
    public ArrayList<BarItem> searchBarItem(String name){
        return barService.getItem(name,1);
    }

}
