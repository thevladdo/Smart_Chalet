package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.Review;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ReviewRepository extends MongoRepository<Review, UUID> {

    Optional<Review> findByUserId(String userId);

    boolean existsByUserId(String userId);
}
