package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Issue;
import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issues.IssuesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/issues")
public class IssueRestController {

    @Autowired
    private IssuesService issuesService;

    // List Issues
    @GetMapping(path = {"", "/", "/index"})
    public List<Issue> index() {
        return issuesService.findAll();
    }

    // Detail Issues
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Issue show(@PathVariable int id) {
        Issue issue = issuesService.findById(id);
        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }
        return issue;
    }
    // tạo thông báo
    @PostMapping(path = {"/rescue/send", "/rescue/send/"})
    public Issue createRescue(@RequestBody Issue issue) {
        issue.setId(0);
        Issue newIssue = issuesService.save(issue);
        return issuesService.findById(newIssue.getId());
    }
    // Xem thông tin người giúp đỡ mình
    @GetMapping(path = {"/rescue/send/confirmation", "/rescue/send/confirmation/"})
    public User showComfirmation(@RequestParam(defaultValue = "0") int id) {
        Issue issue = issuesService.findById(id);
        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }
        return issue.getUserPartners();
    }
    // Xác nhận thông tin người giúp đỡ mình
    @PutMapping(path = {"/rescue/send/confirmation", "/rescue/send/confirmation/"})
    public String acceptComfirmation(@RequestBody Issue issue , @RequestParam(defaultValue = "0") int id) {

       // String statusRequest = requestBody.get("status");
        if(issue.getStatus().toString() == IssueStatus.memberConfirmPartner.toString() ){
             issue = issuesService.findById(id);
            if (issuesService.findById(id) == null) {
                throw new RestNotFoundException("Issuues id not found - " + id);
            }
            issue.setId(id);
            issue.setStatus(IssueStatus.succeeded);
            issuesService.save(issue);
            return "xác nhận " + issue.getUserPartners().getLastName() + " " + issue.getUserPartners().getFirstName() + " là người hỗ trợ!";
        }else return "sai status xác nhận! " +IssueStatus.memberConfirmPartner.toString();

    }
    // Create Issues
    @PostMapping(path = {"", "/"})
    public Issue store(@RequestBody Issue issue) {
        issue.setId(0);
        Issue newIssue = issuesService.save(issue);
        return issuesService.findById(newIssue.getId());
    }

    // Update Issues
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Issue update(@RequestBody Issue issue, @PathVariable int id) {

        if (issuesService.findById(id) == null) {
            throw new RestNotFoundException("Issuues id not found - " + id);
        }
        issue.setId(id);
        issuesService.save(issue);
        return issuesService.findById(issue.getId());
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
