package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Partner;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.partner.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/partner")
public class PartnerRestController {

    @Autowired
    private PartnerService partnerService;

    // List Partner
    @GetMapping(path = {"", "/", "/index"})
    public List<Partner> index() {
        return partnerService.findAll();
    }

    // Detail Partner
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Partner show(@PathVariable int id) {
        Partner partner = partnerService.findById(id);
        if (partner == null) {
            throw new RestNotFoundException("Partner id not found - " + id);
        }
        return partner;
    }

    // Create Partner
    @PostMapping(path = {"", "/"})
    public Partner store(@RequestBody Partner partner) {
        partner.setId(0);
        Partner newPartner = partnerService.save(partner);
        return partnerService.findById(newPartner.getId());
    }

    // Update Partner
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Partner update(@RequestBody Partner partner, @PathVariable int id) {

        if (partnerService.findById(id) == null) {
            throw new RestNotFoundException("Partner id not found - " + id);
        }

        partner.setId(0);
        partnerService.save(partner);
        return partnerService.findById(partner.getId());
    }

    // Delete Partner
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (partnerService.findById(id) == null) {
            throw new RestNotFoundException("Partner id not found - " + id);
        }

        partnerService.deleteById(id);
        return "Deleted partner id - " + id;
    }
}
