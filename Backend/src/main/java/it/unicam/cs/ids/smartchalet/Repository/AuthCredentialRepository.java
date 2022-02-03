package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.AuthCredential;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthCredentialRepository extends MongoRepository<AuthCredential,String> {

    AuthCredential.Role findByUsername(String username);
}
