package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.RatingGarage;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ratingGarage.RatingGarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garages")
public class RatingGarageRestController {

    @Autowired
    private RatingGarageService ratingGarageService;

    // List Rating Garage
    @GetMapping(path = {"", "/", "/index"})
    public List<RatingGarage> index() {
        return ratingGarageService.findAll();
    }

    // Detail Rating Garage
    @GetMapping(path = {"/{id}", "/{id}/"})
    public RatingGarage show(@PathVariable int id) {
        RatingGarage ratingGarage = ratingGarageService.findById(id);
        if (ratingGarage == null) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }
        return ratingGarage;
    }

    // Create Rating Garage
    @PostMapping(path = {"", "/"})
    public RatingGarage store(@RequestBody RatingGarage ratingGarage) {
        ratingGarage.setId(0);
        RatingGarage newRatingGarage = ratingGarageService.save(ratingGarage);
        return ratingGarageService.findById(newRatingGarage.getId());
    }

    // Update Rating Garage
    @PutMapping(path = {"/{id}", "/{id}/"})
    public RatingGarage update(@RequestBody RatingGarage ratingGarage, @PathVariable int id) {

        if (ratingGarageService.findById(id) == null) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }

        ratingGarage.setId(0);
        ratingGarageService.save(ratingGarage);
        return ratingGarageService.findById(ratingGarage.getId());
    }

    // Delete Rating Garage
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (ratingGarageService.findById(id) == null) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }

        ratingGarageService.deleteById(id);
        return "Deleted rating garage id - " + id;
    }
}
