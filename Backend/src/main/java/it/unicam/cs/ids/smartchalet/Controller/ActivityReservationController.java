package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import it.unicam.cs.ids.smartchalet.Service.ActivityReservationService;
import it.unicam.cs.ids.smartchalet.Security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping(path = "smartchalet/activity/reserve")
public class ActivityReservationController {

    @Autowired
    private ActivityReservationService reserveService;

   @Autowired
   private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/new")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF')) " +
            "and (@accessCheckerComponent.sameUser(principal, #reservation.getUserId()) or hasAuthority('RECEPTION_STAFF'))")
    public ActivityReservation create(@RequestBody @Param("reservation") ActivityReservation reservation){
        return reserveService.createNew(reservation);
    }

    @GetMapping("/get/{id}")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF'))"+
            "and (@accessCheckerComponent.sameUser(principal, #id) or hasAuthority('RECEPTION_STAFF'))")
    public ActivityReservation getReservation(@PathVariable UUID id){
        return reserveService.getReservation(id);
    }

    @PutMapping("/update")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF')) " +
            "and (@accessCheckerComponent.sameUser(principal, #reservation.getUserId()) or hasAuthority('RECEPTION_STAFF'))")
    public ActivityReservation updateReservation(@RequestBody @Param("reservation") ActivityReservation reservation){
        return reserveService.updateReservation(reservation);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF')) " +
            "and (@accessCheckerComponent.sameUser(principal, #reservation.getUserId()) or hasAuthority('RECEPTION_STAFF'))")
    public boolean deleteReservation(@RequestBody @Param("reservation") ActivityReservation reservation){
        return reserveService.deleteReservation(reservation);
    }
}
