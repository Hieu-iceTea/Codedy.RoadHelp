package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Issue;
import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issues.IssuesService;
import com.codedy.roadhelp.service.ratingIssue.RatingIssueService;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/issues")
public class IssueRestController {

    //region - Autowired Service -
    @Autowired
    private IssuesService issuesService;

    @Autowired
    private UserService userService;

    @Autowired
    private RatingIssueService ratingIssueService;
    //endregion


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return issuesService.findAll().stream().map(Issue::toApiResponse).toList();
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Issue issue = issuesService.findById(id);

        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        return issue.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody Issue issue) {
        issue.setId(0);

        return issuesService.save(issue).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Issue issue, @PathVariable int id) {
        if (!issuesService.existsById(id)) {
            throw new RestNotFoundException("Issue id not found - " + id);
        }

        issue.setId(id);

        return issuesService.save(issue).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!issuesService.existsById(id)) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        issuesService.deleteById(id);

        return "Deleted issues id - " + id;
    }
    //endregion


    //region - Extend -
    // = = = = = = = = = = = = = = = For Member = = = = = = = = = = = = = = = //

    // Gửi yêu cầu cứu hộ
    @PostMapping(path = {"/rescue/send", "/rescue/send/"})
    public LinkedHashMap<String, Object> createRescue(@RequestBody Issue issue) {
        issue.setId(0);
        Issue newIssue = issuesService.save(issue);
        return issuesService.findById(newIssue.getId()).toApiResponse();
    }

    // Xem thông tin người giúp đỡ mình
    @GetMapping(path = {"/rescue/send/confirmation", "/rescue/send/confirmation/"})
    public LinkedHashMap<String, Object> showComfirmation(@RequestParam(defaultValue = "0") int id) {
        Issue issue = issuesService.findById(id);
        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }
        return issue.getUserPartner().toApiResponse();
    }

    // Xác nhận thông tin người giúp đỡ mình
    @PutMapping(path = {"/rescue/send/confirmation", "/rescue/send/confirmation/"})
    public String acceptComfirmation(@RequestBody Issue issue, @RequestParam(defaultValue = "0") int id) {
        if (issue.getStatus().toString() == IssueStatus.waitMemberConfirm.toString()) {

            if (issuesService.findById(id) == null) {
                throw new RestNotFoundException("Issuues id not found - " + id);
            }
            issue.setId(id);
            issue.setStatus(IssueStatus.memberConfirmPartner);
            issuesService.save(issue);
            return "xác nhận " + issue.getUserPartner().getLastName() + " " + issue.getUserPartner().getFirstName() + " là người hỗ trợ!";
        } else return "sai status xác nhận! " + IssueStatus.waitMemberConfirm.toString();

    }

    // xác nhận hoàn thành sau khi partner hỗ trợ xog
    @PutMapping(path = {"/rescue/success/{id}", "/rescue/success/{id}/"})
    public String rescueSuccess(@PathVariable int id) {
        Issue issue = issuesService.findById(id);

        if (issue.getStatus().toString() == IssueStatus.memberConfirmPartner.toString()) {

            if (issuesService.findById(id) == null) {
                throw new RestNotFoundException("Issuues id not found - " + id);
            }
            issue.setId(id);
            issue.setStatus(IssueStatus.succeeded);
            issuesService.save(issue);
            return "xác nhận " + issue.getUserPartner().getLastName() + " " + issue.getUserPartner().getFirstName() + " là người hỗ trợ!";
        } else return "sai status xác nhận! " + IssueStatus.waitMemberConfirm.toString();

    }

    // Gửi đánh giá cứu hộ
    @PostMapping(path = {"/rescue/send/post-reviews", "/rescue/send/post-reviews/"})
    public LinkedHashMap<String, Object> createReviewRescue(@RequestBody RatingIssue ratingIssue, @RequestParam(defaultValue = "0") int userMemberId,
                                                            @RequestParam(defaultValue = "0") int issueId) {

        ratingIssue.setId(0);
        ratingIssue.setIssue(issuesService.findById(issueId));
        ratingIssue.setUserMember(userService.findById(userMemberId));
        RatingIssue newRatingIssue = ratingIssueService.save(ratingIssue);
        return ratingIssueService.findById(newRatingIssue.getId()).toApiResponse();
    }


    // = = = = = = = = = = = = = = = For Partner = = = = = = = = = = = = = = = //

    // Xem danh sách những người đang cần hỗ trợ
    @GetMapping(path = {"/rescue/receive", "/rescue/receive/"})
    public List<LinkedHashMap<String, Object>> showListRescue() {
        List<Issue> issues = issuesService.findIssueByStatus(IssueStatus.sent);
        return issues.stream().map(Issue::toApiResponse).toList();
    }

    // Xác nhận giúp
    @PutMapping(path = {"/rescue/receive/details", "/rescue/receive/details/"})
    public String acceptReceive(@RequestBody Issue issue, @RequestParam(defaultValue = "0") int id
            , @RequestParam(defaultValue = "0") int userPartnerId) {

        User userPartner = userService.findById(userPartnerId);
        if (issue.getStatus().toString() == IssueStatus.sent.toString()) {

            if (issuesService.findById(id)
                    == null) {
                throw new RestNotFoundException("Issues id not found - " + id);
            }
            issue.setId(id);
            issue.setUserPartner(userPartner);
            issue.setStatus(IssueStatus.waitMemberConfirm);
            issuesService.save(issue);
            return "xác nhận " + issue.getUserPartner().getLastName() + " " + issue.getUserPartner().getFirstName() + " hỗ trợ!";
        } else
            return "sai status xác nhận! " + IssueStatus.waitMemberConfirm.toString();

    }

    // Xem đánh giá sau khi hỗ trợ xong
    @GetMapping(path = {"/rescue/receive/show-reviews", "/rescue/receive/show-reviews/"})
    public LinkedHashMap<String, Object> showRating(@RequestParam(defaultValue = "0") int ratingIssueId) {
        return ratingIssueService.findById(ratingIssueId).toApiResponse();
    }
    //endregion

}
