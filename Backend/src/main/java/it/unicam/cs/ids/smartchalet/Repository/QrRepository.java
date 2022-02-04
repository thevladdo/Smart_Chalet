package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.Qr;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.io.File;

@Repository
public interface QrRepository extends MongoRepository<Qr,Integer> {

    File insert(File savedQr);

    boolean existsByFile(File qr);
}
