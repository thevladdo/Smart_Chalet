package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import it.unicam.cs.ids.smartchalet.Service.ActivityReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping(path = "smartchalet/activity/reserve")
public class ActivityReservationController {

    @Autowired
    private ActivityReservationService reserveService;

    @PostMapping("/new")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #reservation.getUserId())")
    public ActivityReservation create(ActivityReservation reservation){
        return reserveService.createNew(reservation);
    }

    @GetMapping("/get")
    //TODO same as ActivityUser
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF'))")
    public ActivityReservation getReservation(UUID id){
        return reserveService.getReservation(id);
    }

    @PutMapping("/update")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #reservation.getUserId())")
    public ActivityReservation updateReservation(ActivityReservation reservation){
        return reserveService.updateReservation(reservation);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #reservation.getUserId())")
    public boolean deleteReservation(ActivityReservation reservation){
        return reserveService.deleteReservation(reservation);
    }
}
