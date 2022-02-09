package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Reservation;
import it.unicam.cs.ids.smartchalet.Service.ReservationService;
import it.unicam.cs.ids.smartchalet.security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "smartchalet/reserve")
public class ReservationController {

    @Autowired
    private ReservationService service;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/new")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF')) " +
            "and (@accessCheckerComponent.sameUser(principal, #reservation.getUserId()) or hasAuthority('RECEPTION_STAFF'))")
    public Reservation create(@RequestBody @Param("reservation") Reservation reservation){
        return service.createReservation(reservation);
    }

    @GetMapping("/get/status")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('RECEPTION_STAFF'))")
    public List<Reservation> getStatus(){
        return service.getStatus();
    }

    @GetMapping("/get")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF'))")
    public Reservation getReservation(UUID id){
        return service.getReservation(id);
    }

    @PutMapping("/update")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF')) " +
            "and (@accessCheckerComponent.sameUser(principal, #reservation.getUserId()) or hasAuthority('RECEPTION_STAFF'))")
    public Reservation update(@RequestBody @Param("reservation") Reservation reservation){
        return service.updateReservation(reservation);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('CLIENT') or hasAuthority('RECEPTION_STAFF')) " +
            "and (@accessCheckerComponent.sameUser(principal, #reservation.getUserId()) or hasAuthority('RECEPTION_STAFF'))")
    public boolean delete(@RequestBody @Param("reservation") Reservation reservation){
        return service.deleteReservation(reservation);
    }
}
