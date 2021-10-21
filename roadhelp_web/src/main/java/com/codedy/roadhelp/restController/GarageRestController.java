package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garages")
public class GarageRestController {

    @Autowired
    private GarageService garageService;

    // List Garage
    @GetMapping(path = {"", "/", "/index"})
    public List<Garage> index() {
        return garageService.findAll();
    }

    // Detail Garage
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Garage show(@PathVariable int id) {
        Garage garage = garageService.findById(id);
        if (garage == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        return garage;
    }

    // Create Garage
    @PostMapping(path = {"", "/"})
    public Garage store(@RequestBody Garage garage) {
        garage.setId(0);
        Garage newGarage = garageService.save(garage);
        return garageService.findById(newGarage.getId());
    }

    // Update Garage
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Garage update(@RequestBody Garage garage, @PathVariable int id) {

        if (garageService.findById(id) == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        garage.setId(id);
        garageService.save(garage);
        return garageService.findById(garage.getId());
    }

    // Delete Garage
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (garageService.findById(id) == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }

        garageService.deleteById(id);
        return "Deleted garage id - " + id;
    }
}
