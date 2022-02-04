package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.*;
import it.unicam.cs.ids.smartchalet.Service.BarService;
import it.unicam.cs.ids.smartchalet.Service.BeachService;
import it.unicam.cs.ids.smartchalet.Service.AppUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "smartchalet/user")
public class AppUserController {

    @Autowired
    private final AppUserService userService;

    @Autowired
    private final BeachService beachService;

    @Autowired//dependency injection with @component
    public AppUserController(AppUserService userService, BeachService beachService,
                             BarService barService) {
        this.userService = userService;
        this.beachService = beachService;
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
}
