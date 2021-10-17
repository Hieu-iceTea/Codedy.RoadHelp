package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ratingIssue.RatingIssueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/ratingissues")
public class RatingIssueRestController {

    @Autowired
    private RatingIssueService ratingIssueService;

    // List Rating Partner
    @GetMapping(path = {"", "/", "/index"})
    public List<RatingIssue> index() {
        return ratingIssueService.findAll();
    }

    // Detail Rating Partner
    @GetMapping(path = {"/{id}", "/{id}/"})
    public RatingIssue show(@PathVariable int id) {
        RatingIssue ratingIssue = ratingIssueService.findById(id);
        if (ratingIssue == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }
        return ratingIssue;
    }

    // Create Rating Partner
    @PostMapping(path = {"", "/"})
    public RatingIssue store(@RequestBody RatingIssue ratingIssue) {
        ratingIssue.setId(0);
        RatingIssue newRatingIssue = ratingIssueService.save(ratingIssue);
        return ratingIssueService.findById(newRatingIssue.getId());
    }

    // Update Rating Partner
    @PutMapping(path = {"/{id}", "/{id}/"})
    public RatingIssue update(@RequestBody RatingIssue ratingIssue, @PathVariable int id) {

        if (ratingIssueService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingIssue.setId(0);
        ratingIssueService.save(ratingIssue);
        return ratingIssueService.findById(ratingIssue.getId());
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
    public RatingIssue postReview(@RequestBody RatingIssue ratingIssue) {
        ratingIssue.setId(0);
        RatingIssue newRatingIssue = ratingIssueService.save(ratingIssue);
        return ratingIssueService.findById(newRatingIssue.getId());
    }
}
