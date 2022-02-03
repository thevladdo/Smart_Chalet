package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Activity;
import it.unicam.cs.ids.smartchalet.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "smartchalet/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @PostMapping("/add")
    public Activity add(Activity activity){
        return activityService.addActiviy(activity);
    }

    @GetMapping("/get")
    public Activity get(String name){
        return activityService.getByName(name);
    }

    @DeleteMapping("/delete")
    public boolean delete(String name){
        return activityService.deleteActivity(name);
    }

    @PutMapping("/update")
    public Activity update(Activity activity){
        return activityService.updateActivity(activity);
    }

    //GenericUser: Ricerca attività
    @GetMapping("/search/activity")
    public Activity searchActivity(String name){
        return activityService.getByName(name);
    }
}
