package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Issue;
import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issues.IssuesService;
import com.codedy.roadhelp.service.ratingIssue.RatingIssueService;
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

    // Member Gửi yêu cầu cứu hộ
    @PostMapping(path = {"/send", "/send/"})
    public LinkedHashMap<String, Object> sendIssue(@RequestBody Issue issue) {
        return this.store(issue);
    }

    // Member Xem thông tin người giúp đỡ mình
    @GetMapping(path = {"/{id}/userPartner", "/{id}/userPartner/"})
    public LinkedHashMap<String, Object> userPartner(@PathVariable int id) {
        Issue issue = issuesService.findById(id);

        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        if (issue.getUserPartner() == null) {
            throw new RestNotFoundException("UserPartner for Issues id not found - " + id);
        }

        return issue.getUserPartner().toApiResponse();
    }

    // Member Xác nhận thông tin người giúp đỡ mình
    @PutMapping(path = {"/{id}/member-confirm-partner", "/{id}/member-confirm-partner/"})
    public String memberConfirmPartner(@PathVariable int id) {
        Issue issue = issuesService.findById(id);

        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        if (issue.getStatus() != IssueStatus.waitMemberConfirm) {
            return "Lỗi: Không trong trạng thái chờ member xác nhận, Status hiện tại: " + issue.getStatus();
        }

        issue.setStatus(IssueStatus.memberConfirmPartner);

        issuesService.save(issue);

        return "Xác nhận '" + issue.getUserPartner().getFirstName() + " " + issue.getUserPartner().getLastName() + "' là người hỗ trợ!";
    }

    // Member xác nhận hoàn thành sau khi partner hỗ trợ xog
    @PutMapping(path = {"/{id}/setStatusSuccess", "/{id}/setStatusSuccess/"})
    public String rescueSuccess(@PathVariable int id) {
        Issue issue = issuesService.findById(id);

        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        if (issue.getStatus() != IssueStatus.memberConfirmPartner) {
            return "Lỗi: Trạng thái hiện tại không phải là memberConfirmPartner, Status hiện tại: " + issue.getStatus();
        }

        issue.setStatus(IssueStatus.succeeded);

        issuesService.save(issue);

        return "Issue có ID " + id + "được thay đổi trạng thái thành: 'Thành công'";
    }

    // Member viết đánh giá issue sau khi được cứu hộ xong -
    @PostMapping(path = {"/{issueId}/ratingIssue", "/{issueId}/ratingIssue/"})
    public LinkedHashMap<String, Object> ratingIssue(@RequestBody RatingIssue ratingIssue, @PathVariable int issueId) {
        ratingIssue.setId(0);

        Issue issue = issuesService.findById(issueId);
        ratingIssue.setIssue(issue);

        return ratingIssueService.save(ratingIssue).toApiResponse();
    }


    // = = = = = = = = = = = = = = = For Partner = = = = = = = = = = = = = = = //

    // Partner Xem danh sách những người đang cần hỗ trợ
    @GetMapping(path = {"/byStatusSent", "/byStatusSent/"})
    public List<LinkedHashMap<String, Object>> showListRescue() {
        return issuesService.findIssueByStatus(IssueStatus.sent).stream().map(Issue::toApiResponse).toList();
    }

    // Partner Xác nhận giúp
    @PutMapping(path = {"/{id}/partner-confirm-member", "/{id}/partner-confirm-member"})
    public String partnerConfirmMember(@PathVariable int id) {
        Issue issue = issuesService.findById(id);

        if (issue == null) {
            throw new RestNotFoundException("Issues id not found - " + id);
        }

        if (issue.getStatus() != IssueStatus.sent) {
            return "Lỗi: Không trong trạng thái 'sent', Status hiện tại: " + issue.getStatus();
        }

        issue.setStatus(IssueStatus.waitMemberConfirm);

        issuesService.save(issue);

        return "Partner xác nhận muốn hỗ trợ: '" + issue.getUserMember().getFirstName() + " " + issue.getUserMember().getLastName();
    }

    // Partner Xem đánh giá sau khi hỗ trợ xong
    @GetMapping(path = {"/{id}/ratingIssue", "/{id}/ratingIssue/"})
    public LinkedHashMap<String, Object> ratingIssue(@PathVariable int id) {
        return ratingIssueService.findByIssueId(id).toApiResponse();
    }
    //endregion

}
