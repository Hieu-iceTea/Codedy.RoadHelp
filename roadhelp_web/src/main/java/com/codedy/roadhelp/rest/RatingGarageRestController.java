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

    //region - Autowired Service -
    @Autowired
    private RatingGarageService ratingGarageService;

    @Autowired
    private GarageService garageService;

    @Autowired
    private UserService userService;
    //endregion


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return ratingGarageService.findAll().stream().map(RatingGarage::toApiResponse).toList();
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        RatingGarage ratingGarage = ratingGarageService.findById(id);

        if (ratingGarage == null) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }

        return ratingGarage.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody RatingGarage ratingGarage) {
        ratingGarage.setId(0);

        return ratingGarageService.save(ratingGarage).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody RatingGarage ratingGarage, @PathVariable int id) {
        if (!ratingGarageService.existsById(id)) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }

        ratingGarage.setId(id);

        return ratingGarageService.save(ratingGarage).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!ratingGarageService.existsById(id)) {
            throw new RestNotFoundException("Rating garage id not found - " + id);
        }

        ratingGarageService.deleteById(id);

        return "Deleted rating garage id - " + id;
    }
    //endregion


    //region - Extend -
    // Review Garage -
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
        for (RatingGarage ratings : ratingGarages) {
            amountRating += ratings.getRatePoint();
        }

        amountRating += ratingGarage.getRatePoint();

        garage.setRateAvg(amountRating / (count + 1));

        garageService.save(garage);

        RatingGarage newRatingGarage = ratingGarageService.save(ratingGarage);
        return ratingGarageService.findById(newRatingGarage.getId()).toApiResponse();
    }

    // List Rating Garage
    @GetMapping(path = {"/byGarage/{garageId}", "/byGarage/{garageId}/"})
    public List<LinkedHashMap<String, Object>> ByGarage(@PathVariable int garageId) {
        return ratingGarageService.findAllByGarageId(garageId).stream().map(RatingGarage::toApiResponse).toList();
    }
    //endregion

}
