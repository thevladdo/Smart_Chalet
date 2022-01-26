package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.UUID;

public interface UmbrellaRepository extends MongoRepository<Umbrella, UUID> {
}
