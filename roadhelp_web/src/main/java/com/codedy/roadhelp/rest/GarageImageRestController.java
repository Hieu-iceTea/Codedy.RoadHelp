package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.GarageImage;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garageImage.GarageImageService;
import com.codedy.roadhelp.util.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garageImages")
public class GarageImageRestController {

    private final String _path = "src/main/resources/static/" + "data-images/garage";


    //region - Autowired Service -
    @Autowired
    private GarageImageService garageImageService;

    @Autowired
    private StorageService storageService;
    //endregion


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return garageImageService.findAll().stream().map(GarageImage::toApiResponse).toList();
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        GarageImage garageImage = garageImageService.findById(id);

        if (garageImage == null) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }

        return garageImage.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody GarageImage garageImage, @RequestParam MultipartFile imageFile) {
        garageImage.setId(0);

        //Xử lý file
        if (!imageFile.isEmpty()) {
            String fileName = storageService.store(imageFile, _path);
            garageImage.setImage(fileName);
        }

        return garageImageService.save(garageImage).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody GarageImage garageImage, @PathVariable int id) {
        if (!garageImageService.existsById(id)) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }

        garageImage.setId(id);

        return garageImageService.save(garageImage).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> delete(@PathVariable int id) {
        if (!garageImageService.existsById(id)) {
            throw new RestNotFoundException("GarageImage id not found - " + id);
        }

        //Xử lý file
        storageService.delete(garageImageService.findById(id).getImage(), _path);

        garageImageService.deleteById(id);

        LinkedHashMap<String, Object> response = new LinkedHashMap<>();
        response.put("message", "Deleted garageImage id - " + id);
        return response;
    }
    //endregion


    //region - Extend -
    @PostMapping(path = {"/addImageByGarageId/{garageId}", "/addImageByGarageId/{garageId}/"})
    public LinkedHashMap<String, Object> addImageByGarageId(@PathVariable int garageId, @RequestParam MultipartFile imageFile) {
        Garage garage = new Garage();
        garage.setId(garageId);

        GarageImage garageImage = new GarageImage();
        garageImage.setGarage(garage);

        return this.store(garageImage, imageFile);
    }
    //endregion

}
