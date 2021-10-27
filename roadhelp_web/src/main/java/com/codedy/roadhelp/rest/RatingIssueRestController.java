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

    //region - Autowired Service -
    @Autowired
    private RatingIssueService ratingIssueService;

    @Autowired
    private UserService userService;

    @Autowired
    private IssuesService issuesService;
    //endregion


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return ratingIssueService.findAll().stream().map(RatingIssue::toApiResponse).toList();
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        RatingIssue ratingIssue = ratingIssueService.findById(id);

        if (ratingIssue == null) {
            throw new RestNotFoundException("Rating issue id not found - " + id);
        }

        return ratingIssue.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody RatingIssue ratingIssue) {
        ratingIssue.setId(0);

        return ratingIssueService.save(ratingIssue).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody RatingIssue ratingIssue, @PathVariable int id) {
        if (!ratingIssueService.existsById(id)) {
            throw new RestNotFoundException("Rating issue id not found - " + id);
        }

        ratingIssue.setId(id);

        return ratingIssueService.save(ratingIssue).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!ratingIssueService.existsById(id)) {
            throw new RestNotFoundException("Rating issue id not found - " + id);
        }

        ratingIssueService.deleteById(id);

        return "Deleted rating issue id - " + id;
    }
    //endregion

}
