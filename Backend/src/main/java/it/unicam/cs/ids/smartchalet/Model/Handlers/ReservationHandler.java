package it.unicam.cs.ids.smartchalet.Model.Handlers;

import it.unicam.cs.ids.smartchalet.Model.Client;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ReservationHandler {

    //TODO ricordarsi! L'integer rappresenta il qrcode, il client va su V perchè un cliente può avere più ombrelloni.
    private Map<Integer, Client> reservationHandler;
    private static ReservationHandler rvHandler;

    private ReservationHandler() {
        this.reservationHandler = new HashMap<>();
    }

    public static ReservationHandler sigletonReservationHandler(){
        if (rvHandler == null) {
            rvHandler = new ReservationHandler();
        }
        return rvHandler;
    }
}
