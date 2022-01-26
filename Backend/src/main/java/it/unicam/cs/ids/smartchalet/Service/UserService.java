package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.AuthCredential;
import it.unicam.cs.ids.smartchalet.Model.User;
import it.unicam.cs.ids.smartchalet.Repository.UserRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@RestController
public class UserService {

    @Autowired
    private UserRepository repository;

    public User addUser(@NonNull User newUser) throws ResponseStatusException {
        if(existById(newUser.getMail())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid user: this user already exists");
        } return repository.insert(newUser);
    }

    public User addFirstAccess(@NonNull User newUser) throws ResponseStatusException {
        newUser.setUsername(newUser.getUsername().toUpperCase().trim());
        if ( checkUser(newUser))
            return repository.save(newUser);
        return null;
    }

    public boolean deleteUser(@NonNull String id) throws ResponseStatusException {
        if (existById(id)) {
            repository.deleteById(id);
            return true;
        } else return false;
    }

    public User updateUser(User modifiedUser) throws ResponseStatusException {
        modifiedUser.setUsername(modifiedUser.getUsername().toUpperCase().trim());
        User oldUser = repository.findById(modifiedUser.getMail()).get();
        if (existById(modifiedUser.getMail())) {
            if (oldUser.getUsername().equals(modifiedUser.getUsername())) {
                if (checkUser(modifiedUser)) {
                    return repository.save(modifiedUser);
                }
            } else
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Username cannot be changed");
        }
        return null;
    }

    public List<User> findAll() {
        return repository.findAll();
    }


    public User findById(@NonNull String mail){
        return repository.findById(mail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
    }

    public List<User> findByIds(@NonNull List<String> ids) {
        return StreamSupport.stream(repository.findAllById(ids).spliterator(), false)
                .collect(Collectors.toList());
    }

    public List<User> findByUsername(@NonNull String username){
        return repository.findByUsername(username.toUpperCase());
    }

    private boolean existById(String id) throws ResponseStatusException {
        return repository.existsById(id);
    }

    private boolean checkUser(User user) {
        if (user.getRoles().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid user: it must have at least one role");
        } else if (user.getRoles().contains(AuthCredential.Role.NOT_COMPLETED)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid user: user registration not completed");
        } return true;
    }
}
