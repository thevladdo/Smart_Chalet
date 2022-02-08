package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.AppUser;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface UserRepository extends MongoRepository<AppUser, String> {

    List<AppUser> findByUsername(String username);

    List<AppUser> findByName(String name);

    //List<AppUser> findByRoles(List<AuthCredential.Role> roles);
}
