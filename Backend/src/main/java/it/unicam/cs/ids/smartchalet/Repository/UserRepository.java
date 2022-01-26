package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.AuthCredential;
import it.unicam.cs.ids.smartchalet.Model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends MongoRepository<User, String> {

    List<User> findByUsername(String username);

    List<User> findByName(String name);

    List<User> findByRoles(List<AuthCredential.Role> roles);
}
