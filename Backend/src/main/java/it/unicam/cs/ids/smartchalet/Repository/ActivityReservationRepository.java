package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface ActivityReservationRepository extends MongoRepository<ActivityReservation, UUID> {

    ActivityReservation findByUserId(String userMail);

    boolean existsByUserId(String userMail);
}
