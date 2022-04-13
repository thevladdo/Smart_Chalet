package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Review;
import it.unicam.cs.ids.smartchalet.Service.ReviewService;
import it.unicam.cs.ids.smartchalet.Security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@Controller
@RequestMapping(path = "smartchalet/review")
public class ReviewController {

    @Autowired
    public ReviewService service;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/new")
    @PreAuthorize("hasAuthority('CLIENT') and @accessCheckerComponent.sameUser(principal, #review.getUserId())")
    public Review add(Review review){
        return service.addReview(review);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("hasAuthority('CLIENT') and @accessCheckerComponent.sameUser(principal, #review.getUserId())")
    public boolean delete(Review review){
        return service.deleteReview(review);
    }

    @GetMapping("/public/get")
    public Review getReview(UUID id){
        return service.getReview(id);
    }

    @GetMapping("/public/get/{userId}")
    public Review getReviewFromUser(@PathVariable String userId){
        return service.getReview(userId);
    }

    @PutMapping("/update")
    @PreAuthorize("hasAuthority('CLIENT') and @accessCheckerComponent.sameUser(principal, #review.getUserId())")
    public Review update(Review review){
        return service.updateReview(review);
    }

    @GetMapping("/public/average")
    public int getAverage(){
        return service.getAverage();
    }
}
