package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Activity;
import it.unicam.cs.ids.smartchalet.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping(path = "smartchalet/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @PostMapping("/new")
    @PreAuthorize("hasAuthority('MANAGER') and @accessCheckerComponent.sameUser(principal, #activity.getUserMail())")
    public Activity add(Activity activity){
        return activityService.addActiviy(activity);
    }

    @GetMapping("/public/get/{name}")
    public Activity get(@PathVariable String name){
        return activityService.getByName(name);
    }

    @DeleteMapping("/delete")
    //TODO Controllare se va bene senza @accesCheckerComponent
    @PreAuthorize("hasAuthority('MANAGER')")
    public boolean delete(String name){
        return activityService.deleteActivity(name);
    }

    @PutMapping("/update")
    @PreAuthorize("hasAuthority('MANAGER') and @accessCheckerComponent.sameUser(principal, #activity.getUserMail())")
    public Activity update( Activity activity){
        return activityService.updateActivity(activity);
    }

    //GenericUser: Ricerca attività
    @GetMapping("/public/search/{name}")
    public Activity searchActivity(@PathVariable String name){
        return activityService.getByName(name);
    }

    @GetMapping("/public/get/all")
    public List<Activity> getAllActivities(){
        return activityService.getAll();
    }
}
