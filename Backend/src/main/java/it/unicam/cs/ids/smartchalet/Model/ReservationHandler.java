package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ReservationHandler {

    //TODO integer è per l'id, verificare che sia corretto
    private Map<Integer,Client> reservationHandler;

    public ReservationHandler() {
        this.reservationHandler = new HashMap<>();
    }

}
