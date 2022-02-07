package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.ActivityReservation;
import it.unicam.cs.ids.smartchalet.Service.ActivityReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping(path = "smartchalet/activity/reserve")
public class ActivityReservationController {

    @Autowired
    private ActivityReservationService reserveService;

    @PostMapping("/new")
    public ActivityReservation create(ActivityReservation reservation){
        return reserveService.createNew(reservation);
    }

    @GetMapping("/get")
    public ActivityReservation getReservation(@RequestParam UUID id){
        return reserveService.getReservation(id);
    }

    @PutMapping("/update")
    public ActivityReservation updateReservation(ActivityReservation reservation){
        return reserveService.updateReservation(reservation);
    }

    @DeleteMapping("/delete")
    public boolean deleteReservation(ActivityReservation reservation){
        return reserveService.deleteReservation(reservation);
    }
}
