package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Issues;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issues.IssuesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/issueses")
public class IssuesRestController {

    @Autowired
    private IssuesService issuesService;

    // List Issues
    @GetMapping(path = {"", "/", "/index"})
    public List<Issues> index() {
        return issuesService.findAll();
    }

    // Detail Issues
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Issues show(@PathVariable int id) {
        Issues issues = issuesService.findById(id);
        if (issues == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }
        return issues;
    }

    // Create Issues
    @PostMapping(path = {"", "/"})
    public Issues store(@RequestBody Issues issues) {
        issues.setId(0);
        Issues newIssues = issuesService.save(issues);
        return issuesService.findById(newIssues.getId());
    }

    // Update Issues
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Issues update(@RequestBody Issues issues, @PathVariable int id) {

        if (issuesService.findById(id) == null) {
            throw new RestNotFoundException("Issuues id not found - " + id);
        }

        issues.setId(0);
        issuesService.save(issues);
        return issuesService.findById(issues.getId());
    }

    // Delete Issues
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (issuesService.findById(id) == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        issuesService.deleteById(id);
        return "Deleted issues id - " + id;
    }
}
