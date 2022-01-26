package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.User;
import it.unicam.cs.ids.smartchalet.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//API LAYER
@RestController
@RequestMapping(path = "smartchalet/api/Client")
public class UserController {

    @Autowired
    private final UserService clientService;

    @Autowired//dependency injection with @component
    public UserController(UserService userService) {
        this.clientService = userService;
    }

    @GetMapping
    public User getClient(){
        return clientService.findById("denise@gmail.com");
    }

    //all the resurces for the api
}
