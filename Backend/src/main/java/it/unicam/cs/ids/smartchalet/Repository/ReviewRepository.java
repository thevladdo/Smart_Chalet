package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.Review;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.UUID;

public interface ReviewRepository extends MongoRepository<Review, UUID> {
}
