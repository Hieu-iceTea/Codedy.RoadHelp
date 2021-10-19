package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Ward;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ward.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/wards")
public class WardRestController {

    @Autowired
    private WardService wardService;

    // List Ward
    @GetMapping(path = {"", "/", "/index"})
    public List<Ward> index() {
        return wardService.findAll();
    }

    // Detail Ward
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Ward show(@PathVariable int id) {
        Ward ward = wardService.findById(id);
        if (ward == null) {
            throw new RestNotFoundException("Ward id not found - " + id);
        }
        return ward;
    }

    // Create Ward
    @PostMapping(path = {"", "/"})
    public Ward store(@RequestBody Ward ward) {
        ward.setId(0);
        Ward newWard = wardService.save(ward);
        return wardService.findById(newWard.getId());
    }

    // Update Ward
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Ward update(@RequestBody Ward ward, @PathVariable int id) {

        if (wardService.findById(id) == null) {
            throw new RestNotFoundException("Ward id not found - " + id);
        }

        ward.setId(0);
        wardService.save(ward);
        return wardService.findById(ward.getId());
    }

    // Delete Ward
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (wardService.findById(id) == null) {
            throw new RestNotFoundException("Ward id not found - " + id);
        }

        wardService.deleteById(id);
        return "Deleted ward id - " + id;
    }
}
