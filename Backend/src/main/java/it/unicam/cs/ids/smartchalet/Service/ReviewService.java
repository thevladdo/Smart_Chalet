package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Review;
import it.unicam.cs.ids.smartchalet.Repository.ReviewRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.UUID;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository repository;

    public Review addReview(@NonNull Review review) {
        if (review.getId() == null) review.setId(UUID.randomUUID());
        if (repository.existsById(review.getId())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid review: review already exists.");
        } else return repository.insert(review);
    }

    public boolean deleteReview(@NonNull Review review) {
        if (repository.existsById(review.getId())) {
            repository.deleteById(review.getId());
            return true;
        } else return false;
    }

    public Review updateReview(@NonNull Review review) {
        if (repository.findById(review.getId()).isPresent()) {
            return repository.save(review);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Review don't exists. Try to add it.");
    }

    public Review getReview(@NonNull UUID id){
        if(!repository.existsById(id)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation do not exist");
        } else return repository.findById(id).get();
    }

    public Review getReview(@NonNull String userId){
        if(!repository.existsByUserId(userId)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation do not exist");
        } else return repository.findByUserId(userId).get();
    }

    public int getAverage(){
        int total = 0;
        for (Review r : repository.findAll()) {
            total += r.getEvaluation();
        }
        return total/repository.findAll().size();
    }
}

