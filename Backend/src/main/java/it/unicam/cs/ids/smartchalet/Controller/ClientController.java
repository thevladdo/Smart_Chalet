package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Service.ClientService;
import it.unicam.cs.ids.smartchalet.Model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//API LAYER
@RestController
@RequestMapping(path = "smartchalet/api/Client")
public class ClientController {

    private final ClientService clientService;

    @Autowired //dependency injection with @component
    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping
    public List<Client> getClient(){
        return clientService.getClient();
    }

    //all the resurces for the api
}
