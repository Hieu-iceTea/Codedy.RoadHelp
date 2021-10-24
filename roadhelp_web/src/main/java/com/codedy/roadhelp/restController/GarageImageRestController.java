package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.GarageImage;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garage.GarageService;
import com.codedy.roadhelp.service.garageImage.GarageImageService;
import com.codedy.roadhelp.untitlities.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garageImages")
public class GarageImageRestController {

    @Autowired
    private GarageImageService garageImageService;
    @Autowired
    private GarageService garageService;
    @Autowired
    private StorageService storageService;
    // List GarageImage
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return garageImageService.findAll().stream().map(GarageImage::toApiResponse).toList();
    }

    // Detail GarageImage
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        GarageImage garageImage = garageImageService.findById(id);
        if (garageImage == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }
        return garageImage.toApiResponse();
    }

    // Create GarageImage
    private final String _path = "src/main/resources/static/" + "data-images/garage";

    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestParam int garageId, @RequestParam("File") MultipartFile file) throws IOException{
       GarageImage garageImage = new GarageImage();
        Garage garage = garageService.findById(garageId);

        garageImage.setGarage(garage);
        //
        if (!file.isEmpty()) {
            // 02. Lưu file mới:
            String fileName =  storageService.store(file, _path);
            garageImage.setImage(fileName);
        }
        GarageImage newGarageImage = garageImageService.save(garageImage);
        return garageImageService.findById(newGarageImage.getId()).toApiResponse();
    }

    // Update GarageImage
    @PutMapping(path = {"/{id}", "/{id}/"})
    public GarageImage update(@RequestBody GarageImage garageImage, @PathVariable int id) {

        if (garageImageService.findById(id) == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }
        garageImage.setId(id);
        garageImageService.save(garageImage);
        return garageImageService.findById(garageImage.getId());
    }

    // Delete GarageImage
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (garageImageService.findById(id) == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }
        storageService.delete(garageImageService.findById(id).getImage(), _path);

        garageImageService.deleteById(id);
        return "Deleted garageImage id - " + id;
    }
}
