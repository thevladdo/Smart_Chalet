package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Activity;
import it.unicam.cs.ids.smartchalet.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping(path = "smartchalet/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @PostMapping("/new")
    public Activity add(Activity activity){
        return activityService.addActiviy(activity);
    }

    @GetMapping("/get/{name}")
    public Activity get(@PathVariable String name){
        return activityService.getByName(name);
    }

    @DeleteMapping("/delete")
    public boolean delete(@RequestParam String name){
        return activityService.deleteActivity(name);
    }

    @PutMapping("/update")
    public Activity update( Activity activity){
        return activityService.updateActivity(activity);
    }

    //GenericUser: Ricerca attività
    @GetMapping("/search/{name}")
    public Activity searchActivity(@RequestParam @PathVariable String name){
        return activityService.getByName(name);
    }

    @GetMapping("/get/all")
    public List<Activity> getAllActivities(){
        return activityService.getAll();
    }
}
