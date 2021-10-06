package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.IssuesDetail;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issuesDetail.IssuesDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/issuesdetails")
public class IssuesDetailRestController {

    @Autowired
    private IssuesDetailService issuesDetailService;

    // List Issues Detail
    @GetMapping(path = {"", "/", "/index"})
    public List<IssuesDetail> index() {
        return issuesDetailService.findAll();
    }

    // Detail Issues Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public IssuesDetail show(@PathVariable int id) {
        IssuesDetail issuesDetail = issuesDetailService.findById(id);
        if (issuesDetail == null) {
            throw new RestNotFoundException("Issues detail id not found - " + id);
        }
        return issuesDetail;
    }

    // Create Issues Detail
    @PostMapping(path = {"", "/"})
    public IssuesDetail store(@RequestBody IssuesDetail issuesDetail) {
        issuesDetail.setId(0);
        IssuesDetail newIssuesDetail = issuesDetailService.save(issuesDetail);
        return issuesDetailService.findById(newIssuesDetail.getId());
    }

    // Update Issues Detail
    @PutMapping(path = {"/{id}", "/{id}/"})
    public IssuesDetail update(@RequestBody IssuesDetail issuesDetail, @PathVariable int id) {

        if (issuesDetailService.findById(id) == null) {
            throw new RestNotFoundException("Issues detail id not found - " + id);
        }

        issuesDetail.setId(0);
        issuesDetailService.save(issuesDetail);
        return issuesDetailService.findById(issuesDetail.getId());
    }

    // Delete Issues Detail
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (issuesDetailService.findById(id) == null) {
            throw new RestNotFoundException("Issues detail id not found - " + id);
        }

        issuesDetailService.deleteById(id);
        return "Deleted issues detail id - " + id;
    }
}
