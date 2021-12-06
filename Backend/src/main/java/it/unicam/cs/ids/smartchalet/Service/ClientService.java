package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Client;
import org.springframework.stereotype.Service;

import java.util.List;

//SERVICE LAYER
@Service //not a regular @Component
public class ClientService {

    public List<Client> getClient(){
        return List.of();
    }
}
