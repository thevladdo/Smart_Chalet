package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Activity;
import it.unicam.cs.ids.smartchalet.Service.ActivityService;
import it.unicam.cs.ids.smartchalet.Security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping(path = "smartchalet/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/new")
    @PreAuthorize("hasAuthority('MANAGER')")
    public Activity add(@RequestBody @Param("activity") Activity activity){
        return activityService.addActiviy(activity);
    }

    @DeleteMapping("/delete/{name}")
    @PreAuthorize("hasAuthority('MANAGER')")
    public boolean delete(@PathVariable String name){
        return activityService.deleteActivity(name);
    }

    @PutMapping("/update")
    @PreAuthorize("hasAuthority('MANAGER')")
    public Activity update(@RequestBody @Param("activity") Activity activity){
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
