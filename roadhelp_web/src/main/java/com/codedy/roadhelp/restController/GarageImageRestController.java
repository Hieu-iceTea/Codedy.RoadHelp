package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.GarageImage;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garageImage.GarageImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garageImages")
public class GarageImageRestController {

    @Autowired
    private GarageImageService garageImageService;

    // List GarageImage
    @GetMapping(path = {"", "/", "/index"})
    public List<GarageImage> index() {
        return garageImageService.findAll();
    }

    // Detail GarageImage
    @GetMapping(path = {"/{id}", "/{id}/"})
    public GarageImage show(@PathVariable int id) {
        GarageImage garageImage = garageImageService.findById(id);
        if (garageImage == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }
        return garageImage;
    }

    // Create GarageImage
    @PostMapping(path = {"", "/"})
    public GarageImage store(@RequestBody GarageImage garage) {
        garage.setId(0);
        GarageImage newGarageImage = garageImageService.save(garage);
        return garageImageService.findById(newGarageImage.getId());
    }

    // Update GarageImage
    @PutMapping(path = {"/{id}", "/{id}/"})
    public GarageImage update(@RequestBody GarageImage garageImage, @PathVariable int id) {

        if (garageImageService.findById(id) == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }

        garageImage.setId(0);
        garageImageService.save(garageImage);
        return garageImageService.findById(garageImage.getId());
    }

    // Delete GarageImage
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (garageImageService.findById(id) == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }

        garageImageService.deleteById(id);
        return "Deleted garageImage id - " + id;
    }
}
