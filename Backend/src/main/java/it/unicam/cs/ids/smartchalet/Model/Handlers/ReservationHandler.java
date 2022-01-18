package it.unicam.cs.ids.smartchalet.Model.Handlers;

import it.unicam.cs.ids.smartchalet.Model.Reservation;
import it.unicam.cs.ids.smartchalet.Model.Users.Client;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ReservationHandler {

    private Map<Client,Reservation> handler;
    private static ReservationHandler rvHandler;

    private ReservationHandler() {
        this.handler = new HashMap<>();
    }

    public static ReservationHandler sigletonReservationHandler(){
        if (rvHandler == null) {
            rvHandler = new ReservationHandler();
        }
        return rvHandler;
    }
}
