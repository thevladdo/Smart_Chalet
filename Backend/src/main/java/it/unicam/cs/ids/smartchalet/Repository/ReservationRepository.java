package it.unicam.cs.ids.smartchalet.Repository;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import it.unicam.cs.ids.smartchalet.Model.Reservation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface ReservationRepository extends MongoRepository<Reservation, UUID> {

    Optional<Reservation> findByUserId(String userMail);

    boolean existsByUserId(String userMail);
}
