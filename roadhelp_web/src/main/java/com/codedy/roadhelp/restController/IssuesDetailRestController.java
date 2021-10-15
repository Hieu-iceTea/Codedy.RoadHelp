package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.IssuesDetail;
import com.codedy.roadhelp.model.Partner;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.issuesDetail.IssuesDetailService;
import com.codedy.roadhelp.service.partner.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/issuesdetails")
public class IssuesDetailRestController {

    @Autowired
    private IssuesDetailService issuesDetailService;
//    @Autowired
//    private PartnerService partnerService;

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

    //Receive Emergency rescue
    @GetMapping(path = {"/rescue/receive", "/rescue/receive/"})
    public List<IssuesDetail> receive() {
        return issuesDetailService.findAll();
    }

    //Details xem
    @GetMapping(path = {"/rescue/receive/details", "/rescue/receive/details/"})
    public IssuesDetail getIssuesDetailsReceive(@PathVariable int id) {
        IssuesDetail issuesDetail = issuesDetailService.findById(id)
                ;
        if (issuesDetail == null) {
            throw new RestNotFoundException("Issues detail id not found - " + id);
        }
        return issuesDetail;
    }

    //Details xác nhận
//    @PostMapping (path = {"/rescue/receive/details", "/rescue/receive/details/"})
//    public IssuesDetail confirmationReceiveResues(@RequestBody IssuesDetail issuesDetail, @PathVariable Is id) {
//
//        if (issuesDetailService.findById(id)
//                == null) {
//            throw new RestNotFoundException("Issues detail id not found - " + id);
//        }
//
//        issuesDetail.setId(0);
//        issuesDetail.setStatus(1);
//        issuesDetailService.save(issuesDetail);
//        return issuesDetailService.findById(issuesDetail.getId());
//    }

    //Xem đánh giá sau khi hỗ trợ xong
    @GetMapping(path = {"/rescue/receive/show-reviews", "/rescue/receive/show-reviews/"})
    public IssuesDetail showReviews(@PathVariable int id) {
        IssuesDetail issuesDetail = issuesDetailService.findById(id);
        if (issuesDetail == null) {
            throw new RestNotFoundException("Issues detail id not found - " + id);
        }
        return issuesDetail;
    }

    //Hùng
    // Xem thông tin người giúp đỡ mình
//    @GetMapping(path = {"/rescue/send/confirmation/{id}", "/rescue/send/confirmation/{id}/"})
//    public Partner getIssuesDetails(@PathVariable int id) {
//        IssuesDetail issuesDetail = issuesDetailService.findById(id);
//
//        if (issuesDetail == null) {
//            throw new RestNotFoundException("Issues detail id not found - " + id);
//        }
//        return partnerService.findById(issuesDetail.getUsers().getId());
//    }
    //User Create Issues Detail
    @PostMapping(path = {"/rescue/send", "/rescue/send/"})
    public IssuesDetail sendRescue(@RequestBody IssuesDetail issuesDetail) {
        issuesDetail.setId(0);
       // issuesDetail.setStatus(1);
        IssuesDetail newIssuesDetail = issuesDetailService.save(issuesDetail);
        return issuesDetailService.findById(newIssuesDetail.getId());
    }

    // Xác nhận thông tin người giúp đỡ mình
    @PutMapping(path = {"/rescue/send/confirmation/{id}", "/rescue/send/confirmation/{id}/"})
    public IssuesDetail confirmationResues(@RequestBody IssuesDetail issuesDetail, @PathVariable int id, int isConfirm) {

        if (issuesDetailService.findById(id) == null) {
            throw new RestNotFoundException("Issues detail id not found - " + id);
        }
        issuesDetail.setId(0);
       // issuesDetail.setStatus(isConfirm);
        issuesDetailService.save(issuesDetail);
        return issuesDetailService.findById(issuesDetail.getId());
    }

}
