package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.AppUser;
import it.unicam.cs.ids.smartchalet.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import lombok.NonNull;

@Service
public class AppUserService {

    @Autowired
    private UserRepository repository;

    public AppUser addUser(@NonNull AppUser newAppUser){
        if(existById(newAppUser.getMail())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid user: this user already exists");
        } return repository.insert(newAppUser);
    }

    public boolean deleteUser(@NonNull String id){
        if (existById(id)) {
            repository.deleteById(id);
            return true;
        } else return false;
    }

    public AppUser updateUser(@NonNull AppUser newUser){
        AppUser oldUser = repository.findById(newUser.getMail()).get();
        if (existById(oldUser.getMail())) {
            if (oldUser.getMail().equals(newUser.getMail())) {
                return repository.save(newUser);
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "E-Mail cannot be changed");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User don't exist. Try to add new user");
    }

    public AppUser findById(@NonNull String mail){
        return repository.findById(mail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "AppUser not found"));
    }

    public String getUserDetils(@NonNull String mail){
        return findById(mail).toString();
    }

    private boolean existById(@NonNull String id){
        return repository.existsById(id);
    }
}
