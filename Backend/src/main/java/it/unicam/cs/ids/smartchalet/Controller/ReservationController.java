package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Reservation;
import it.unicam.cs.ids.smartchalet.Service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping(path = "smartchalet/reserve")
public class ReservationController {

    @Autowired
    private ReservationService service;

    @PostMapping("/new")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #reservation.getUserId())")
    public Reservation create(Reservation reservation){
        return service.createReservation(reservation);
    }

    @GetMapping("/get")
    //TODO same as ActivityController
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF'))")
    public Reservation getReservation(UUID id){
        return service.getReservation(id);
    }

    @PutMapping("/update")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #reservation.getUserId())")
    public Reservation update(Reservation reservation){
        return service.updateReservation(reservation);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #reservation.getUserId())")
    public boolean delete(Reservation reservation){
        return service.deleteReservation(reservation);
    }
}
