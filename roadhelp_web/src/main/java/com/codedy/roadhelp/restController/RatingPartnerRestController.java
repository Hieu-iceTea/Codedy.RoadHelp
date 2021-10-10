package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.RatingPartner;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ratingPartner.RatingPartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/ratingpartner")
public class RatingPartnerRestController {

    @Autowired
    private RatingPartnerService ratingPartnerService;

    // List Rating Partner
    @GetMapping(path = {"", "/", "/index"})
    public List<RatingPartner> index() {
        return ratingPartnerService.findAll();
    }

    // Detail Rating Partner
    @GetMapping(path = {"/{id}", "/{id}/"})
    public RatingPartner show(@PathVariable int id) {
        RatingPartner ratingPartner = ratingPartnerService.findById(id);
        if (ratingPartner == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }
        return ratingPartner;
    }

    // Create Rating Partner
    @PostMapping(path = {"", "/"})
    public RatingPartner store(@RequestBody RatingPartner ratingPartner) {
        ratingPartner.setId(0);
        RatingPartner newRatingPartner = ratingPartnerService.save(ratingPartner);
        return ratingPartnerService.findById(newRatingPartner.getId());
    }

    // User Create Rating Partner
    @PostMapping(path = {"/rescue/send/post-reviews", "/rescue/send/post-reviews/"})
    public RatingPartner postReview(@RequestBody RatingPartner ratingPartner) {
        ratingPartner.setId(0);
        RatingPartner newRatingPartner = ratingPartnerService.save(ratingPartner);
        return ratingPartnerService.findById(newRatingPartner.getId());
    }

    // Update Rating Partner
    @PutMapping(path = {"/{id}", "/{id}/"})
    public RatingPartner update(@RequestBody RatingPartner ratingPartner, @PathVariable int id) {

        if (ratingPartnerService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingPartner.setId(0);
        ratingPartnerService.save(ratingPartner);
        return ratingPartnerService.findById(ratingPartner.getId());
    }

    // Delete Rating Partner
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (ratingPartnerService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingPartnerService.deleteById(id);
        return "Deleted rating partner id - " + id;
    }
}
