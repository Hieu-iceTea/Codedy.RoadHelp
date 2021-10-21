package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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


    // Chi tiết tiệm sửa xe
    @GetMapping(path = {"/repair-place-manage/{id}", "/repair-place-manage/{id}/"})
    public Garage garageDetails(@PathVariable int id) {
        Garage garage = garageService.findById(id);
        if (garage == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        return garage;
    }
    // Thêm tiệm sửa xe
    @PostMapping(path = {"/repair-place-manage", "/repair-place-manage/"})
    public Garage storeGarage(@RequestBody Garage garage) {
        garage.setId(0);
        Garage newGarage = garageService.save(garage);
        return garageService.findById(newGarage.getId());
    }

    // Danh sách tiệm sửa xe đang quản lý
    @GetMapping(path = {"/repair-place-manage", "/repair-place-manage/"})
    public List<Garage> listGarage(@RequestParam(defaultValue = "0") int PartnerId) {
        List<Garage> garages = garageService.findAll();
        List<Garage> garagesByProvinceId = new ArrayList<>();
        for (Garage d : garages
        ) {
            if (d.getProvince().getId() == PartnerId) {
                garagesByProvinceId.add(d);
            }

        }

        if (PartnerId > 0) {
            return garagesByProvinceId;
        } else {
            return garageService.findAll();
        }
    }


    // Chi tiết tiệm sửa xe - Chỉnh sửa
    @PutMapping(path = {"/repair-place-manage/{id}", "/repair-place-manage/{id}/"})
    public Garage repair_update(@RequestBody Garage garage, @PathVariable int id) {

        if (garageService.findById(id) == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        garage.setId(id);
        garageService.save(garage);

        return garageService.findById(garage.getId());
    }

    // Chi tiết tiệm sửa xe - Xóa / Tạm dừng hoạt động
    @PutMapping(path = {"/repair-place-manage/{Id}/setActive", "/repair-place-manage/{Id}/setActive/"})
    public String repair_delete(@PathVariable int Id,@RequestParam(value="setActive", required = false,
            defaultValue = "true") boolean setActive) {

        Garage garage = garageService.findById(Id);
        garage.setActive(setActive);
        garageService.save(garage);

        return   " garage id - " + garage.getId() + " Set active - " + setActive;

    }
}