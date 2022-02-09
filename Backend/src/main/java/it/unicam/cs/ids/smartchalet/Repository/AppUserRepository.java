package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.AppUser;
import it.unicam.cs.ids.smartchalet.Model.AuthCredential;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface AppUserRepository extends MongoRepository<AppUser, String> {

    List<AppUser> findByName(String name);

    List<AppUser> findByRole(AuthCredential.Role roles);
}
