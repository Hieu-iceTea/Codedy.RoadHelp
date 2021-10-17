package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.RatingIssues;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ratingIssue.RatingIssueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/ratingIssues")
public class RatingIssueRestController {

    @Autowired
    private RatingIssueService ratingIssueService;

    // List Rating Partner
    @GetMapping(path = {"", "/", "/index"})
    public List<RatingIssues> index() {
        return ratingIssueService.findAll();
    }

    // Detail Rating Partner
    @GetMapping(path = {"/{id}", "/{id}/"})
    public RatingIssues show(@PathVariable int id) {
        RatingIssues ratingIssues = ratingIssueService.findById(id);
        if (ratingIssues == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }
        return ratingIssues;
    }

    // Create Rating Partner
    @PostMapping(path = {"", "/"})
    public RatingIssues store(@RequestBody RatingIssues ratingIssues) {
        ratingIssues.setId(0);
        RatingIssues newRatingIssues = ratingIssueService.save(ratingIssues);
        return ratingIssueService.findById(newRatingIssues.getId());
    }

    // Update Rating Partner
    @PutMapping(path = {"/{id}", "/{id}/"})
    public RatingIssues update(@RequestBody RatingIssues ratingIssues, @PathVariable int id) {

        if (ratingIssueService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingIssues.setId(0);
        ratingIssueService.save(ratingIssues);
        return ratingIssueService.findById(ratingIssues.getId());
    }

    // Delete Rating Partner
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (ratingIssueService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingIssueService.deleteById(id);
        return "Deleted rating partner id - " + id;
    }

    //Hùng
    // Tạo đánh giá người giúp đỡ mình
    @PostMapping(path = {"/rescue/send/post-reviews", "/rescue/send/post-reviews/"})
    public RatingIssues postReview(@RequestBody RatingIssues ratingIssues) {
        ratingIssues.setId(0);
        RatingIssues newRatingIssues = ratingIssueService.save(ratingIssues);
        return ratingIssueService.findById(newRatingIssues.getId());
    }
}