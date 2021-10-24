package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.RatingGarage;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garage.GarageService;
import com.codedy.roadhelp.service.ratingGarage.RatingGarageService;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/ratingGarages")
public class RatingGarageRestController {

    @Autowired
    private RatingGarageService ratingGarageService;

    @Autowired
    private GarageService garageService;

    @Autowired
    private UserService userService;

    // List Rating Garage
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return ratingGarageService.findAll().stream().map(RatingGarage::toApiResponse).toList();
    }

    // Detail Rating Garage
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        RatingGarage ratingGarage = ratingGarageService.findById(id);
        if (ratingGarage == null) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }
        return ratingGarage.toApiResponse();
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
    public LinkedHashMap<String, Object> update(@RequestBody RatingGarage ratingGarage, @PathVariable int id) {

        if (ratingGarageService.findById(id) == null) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }

        ratingGarage.setId(id);
        ratingGarageService.save(ratingGarage);
        return ratingGarageService.findById(ratingGarage.getId()).toApiResponse();
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

    //region - Review Garage -
    @PostMapping(path = {"/repair-place/{garageId}/member-create-rating", "/repair-place/{garageId}/member-create-rating/"})
    public LinkedHashMap<String, Object> reviewGarage(@RequestBody RatingGarage ratingGarage,
                                     @PathVariable int garageId,
                                     @RequestParam(defaultValue = "0") int memberId) {
        ratingGarage.setId(0);
        ratingGarage.setGarage(garageService.findById(garageId));
        ratingGarage.setUserMember(userService.findById(memberId));

        Garage garage = garageService.findById(garageId);
        List<RatingGarage> ratingGarages = ratingGarageService.findAllByGarageId(garageId);
        int count = ratingGarageService.findAllByGarageId(garageId).toArray().length;
        double amountRating = 0;
        for ( RatingGarage ratings : ratingGarages) {
             amountRating += ratings.getRatePoint();
        }

        amountRating += ratingGarage.getRatePoint();

        garage.setRateAvg(amountRating / (count + 1));

        garageService.save(garage);

        RatingGarage newRatingGarage = ratingGarageService.save(ratingGarage);
        return ratingGarageService.findById(newRatingGarage.getId()).toApiResponse();
    }
    //endregion
}
