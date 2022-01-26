package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.Reservation;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.UUID;

public interface ReservationRepository extends MongoRepository<Reservation, UUID> {
}
