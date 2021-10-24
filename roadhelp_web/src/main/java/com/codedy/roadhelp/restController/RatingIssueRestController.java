package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.GarageImage;
import com.codedy.roadhelp.model.RatingIssues;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issues.IssuesService;
import com.codedy.roadhelp.service.ratingIssue.RatingIssueService;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/ratingIssues")
public class RatingIssueRestController {

    @Autowired
    private RatingIssueService ratingIssueService;
    @Autowired
    private UserService userService;
    @Autowired
    private IssuesService issuesService;

    // List Rating Partner
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return ratingIssueService.findAll().stream().map(RatingIssues::toApiResponse).toList();
    }

    // Detail Rating Partner
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        RatingIssues ratingIssues = ratingIssueService.findById(id);
        if (ratingIssues == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }
        return ratingIssues.toApiResponse();
    }

    // Create Rating Partner
    @PostMapping(path = {"", "/"})
    public RatingIssues store(@RequestBody RatingIssues ratingIssues) {
        ratingIssues.setId(0);
        RatingIssues newRatingIssues = ratingIssueService.save(ratingIssues);
        return ratingIssueService.findById(newRatingIssues.getId());
    }
    // Gửi đánh giá cứu hộ
    @PostMapping(path = {"/rescue/send/post-reviews", "/rescue/send/post-reviews/"})
    public RatingIssues createReviewRescue(@RequestBody RatingIssues ratingIssues, @RequestParam(defaultValue = "0") int userMemberId,
                                           @RequestParam(defaultValue = "0") int issueId) {

        ratingIssues.setId(0);
        ratingIssues.setIssues(issuesService.findById(issueId));
        ratingIssues.setUsers(userService.findById(userMemberId));
        RatingIssues newRatingIssues = ratingIssueService.save(ratingIssues);
        return ratingIssueService.findById(newRatingIssues.getId());
    }

    // Update Rating Partner
    @PutMapping(path = {"/{id}", "/{id}/"})
    public RatingIssues update(@RequestBody RatingIssues ratingIssues, @PathVariable int id) {

        if (ratingIssueService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingIssues.setId(id);
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

}
