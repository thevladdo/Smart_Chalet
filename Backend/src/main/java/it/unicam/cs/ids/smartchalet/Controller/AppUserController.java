package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.*;
import it.unicam.cs.ids.smartchalet.Service.AppUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "smartchalet/user")
public class AppUserController {

    @Autowired
    private AppUserService userService;

    @GetMapping("/get")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, mail) or hasAuthority('MANAGER')")
    public AppUser getUser(String mail){
        return userService.findById(mail);
    }

    @PostMapping("/add")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, #user.getMail()) or hasAuthority('MANAGER')")
    public AppUser addUser(AppUser user){
        return userService.addUser(user);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, mail) or hasAuthority('MANAGER')")
    public boolean deleteUser(String mail){
        return userService.deleteUser(mail);
    }

    @PutMapping("/update")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, #newUser.getMail()) or hasAuthority('MANAGER')")
    public AppUser updateUser(AppUser newUser){
        return userService.updateUser(newUser);
    }

    @GetMapping("/details")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, email) or hasAuthority('MANAGER')")
    public String getDetails(String email){
        return userService.getUserDetils(email);
    }
}
