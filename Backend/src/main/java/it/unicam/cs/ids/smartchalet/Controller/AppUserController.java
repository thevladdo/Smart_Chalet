package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.*;
import it.unicam.cs.ids.smartchalet.Service.AppUserService;
import it.unicam.cs.ids.smartchalet.Service.AuthCredentialService;
import it.unicam.cs.ids.smartchalet.security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "smartchalet/user")
public class AppUserController {

    @Autowired
    private AppUserService userService;

    @Autowired
    private AuthCredentialService authCredentialService;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @GetMapping("/get")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, #mail) or hasAuthority('MANAGER')")
    public AppUser getUser(String mail){
        return userService.findById(mail);
    }

    @PostMapping("/public/add")
    public AppUser addUser(@RequestBody @Param("user") AppUser user){
        AuthCredential authCredential = authCredentialService.getAuthCredentialsInstance(user.getMail());
        authCredential.setRole(user.getRole());
        authCredentialService.updateRolesCredential(authCredential);
        return userService.addUser(user);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, mail) or hasAuthority('MANAGER')")
    public boolean deleteUser(String mail){
        return userService.deleteUser(mail);
    }

    @PutMapping("/update")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, #newUser.getMail()) or hasAuthority('MANAGER')")
    public AppUser updateUser(@RequestBody @Param("user") AppUser newUser){
        return userService.updateUser(newUser);
    }

    @GetMapping("/details")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, email) or hasAuthority('MANAGER')")
    public String getDetails(String email){
        return userService.getUserDetils(email);
    }
}
