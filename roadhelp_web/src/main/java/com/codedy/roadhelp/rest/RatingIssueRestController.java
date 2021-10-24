package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
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
        return ratingIssueService.findAll().stream().map(RatingIssue::toApiResponse).toList();
    }

    // Detail Rating Partner
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        RatingIssue ratingIssue = ratingIssueService.findById(id);
        if (ratingIssue == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }
        return ratingIssue.toApiResponse();
    }

    // Create Rating Partner
    @PostMapping(path = {"", "/"})
    public RatingIssue store(@RequestBody RatingIssue ratingIssue) {
        ratingIssue.setId(0);
        RatingIssue newRatingIssue = ratingIssueService.save(ratingIssue);
        return ratingIssueService.findById(newRatingIssue.getId());
    }
    // Gửi đánh giá cứu hộ
    @PostMapping(path = {"/rescue/send/post-reviews", "/rescue/send/post-reviews/"})
    public RatingIssue createReviewRescue(@RequestBody RatingIssue ratingIssue, @RequestParam(defaultValue = "0") int userMemberId,
                                          @RequestParam(defaultValue = "0") int issueId) {

        ratingIssue.setId(0);
        ratingIssue.setIssue(issuesService.findById(issueId));
        ratingIssue.setUserMember(userService.findById(userMemberId));
        RatingIssue newRatingIssue = ratingIssueService.save(ratingIssue);
        return ratingIssueService.findById(newRatingIssue.getId());
    }

    // Update Rating Partner
    @PutMapping(path = {"/{id}", "/{id}/"})
    public RatingIssue update(@RequestBody RatingIssue ratingIssue, @PathVariable int id) {

        if (ratingIssueService.findById(id) == null) {
            throw new RestNotFoundException("Rating partner id not found - " + id);
        }

        ratingIssue.setId(id);
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

}
