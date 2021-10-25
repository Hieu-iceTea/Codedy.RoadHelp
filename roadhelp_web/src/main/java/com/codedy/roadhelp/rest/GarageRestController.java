package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garage.GarageService;
import com.codedy.roadhelp.service.ward.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garages")
public class GarageRestController {

    @Autowired
    private WardService wardService;

    @Autowired
    private GarageService garageService;

    // List Garage
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return garageService.findAll().stream().map(Garage::toApiResponse).toList();
    }

    // Detail Garage
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Garage garage = garageService.findById(id);
        if (garage == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        return garage.toApiResponse();
    }

    // Create Garage
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody Garage garage) {
        garage.setId(0);
        Garage newGarage = garageService.save(garage);
        return garageService.findById(newGarage.getId()).toApiResponse();
    }

    // Update Garage
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Garage garage, @PathVariable int id) {

        if (garageService.findById(id) == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        garage.setId(id);
        garageService.save(garage);
        return garageService.findById(garage.getId()).toApiResponse();
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
    public LinkedHashMap<String, Object> garageDetails(@PathVariable int id) {
        Garage garage = garageService.findById(id);
        if (garage == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        return garage.toApiResponse();
    }

    // Thêm tiệm sửa xe
    @PostMapping(path = {"/repair-place-manage", "/repair-place-manage/"})
    public LinkedHashMap<String, Object> storeGarage(@RequestBody Garage garage) {
        garage.setId(0);
        Garage newGarage = garageService.save(garage);
        return garageService.findById(newGarage.getId()).toApiResponse();
    }

    // Danh sách tiệm sửa xe đang quản lý
    @GetMapping(path = {"/repair-place-manage", "/repair-place-manage/"})
    public List<LinkedHashMap<String, Object>> listGarage(@RequestParam(defaultValue = "0") int PartnerId) {
        List<Garage> garages = garageService.findAll();
        List<LinkedHashMap<String, Object>> garagesByProvinceId = new ArrayList<>();
        for (Garage d : garages
        ) {
            if (d.getProvince().getId() == PartnerId) {
                garagesByProvinceId.add(d.toApiResponse());
            }

        }

        if (PartnerId > 0) {
            return garagesByProvinceId;
        } else {
            return garageService.findAll().stream().map(Garage::toApiResponse).toList();
        }
    }


    // Chi tiết tiệm sửa xe - Chỉnh sửa
    @PutMapping(path = {"/repair-place-manage/{id}", "/repair-place-manage/{id}/"})
    public LinkedHashMap<String, Object> repair_update(@RequestBody Garage garage, @PathVariable int id) {

        if (garageService.findById(id) == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }
        garage.setId(id);
        garageService.save(garage);

        return garageService.findById(garage.getId()).toApiResponse();
    }

    // Chi tiết tiệm sửa xe - Xóa / Tạm dừng hoạt động
    @PutMapping(path = {"/repair-place-manage/{id}/setActive", "/repair-place-manage/{Id}/setActive/"})
    public String repair_delete(@PathVariable int id, @RequestParam(value = "setActive", required = false,
            defaultValue = "true") boolean setActive) {

        Garage garage = garageService.findById(id);
        garage.setActive(setActive);
        garageService.save(garage);

        return " garage id - " + garage.getId() + " Set active - " + setActive;

    }

    // Tìm kiếm tiệm sửa xe theo tên
    @GetMapping(path = {"/repair-place", "/repair-place"})
    public List<LinkedHashMap<String, Object>> searchGarage(@RequestParam(required = false, defaultValue = "") String name,
                                     @RequestParam(required = false, defaultValue = "0") int provinceId,
                                     @RequestParam(required = false, defaultValue = "0") int districtId,
                                     @RequestParam(required = false, defaultValue = "0") int wardId) {
        if (name.isEmpty() && provinceId < 1 && districtId < 1 && wardId < 1) {
            return garageService.findAllByProvinceIdAndDistrictIdAndWardId(provinceId, districtId, wardId).stream().map(Garage::toApiResponse).toList();
        } else if (!name.isEmpty() && provinceId < 1 && districtId < 1 && wardId < 1) {
            return garageService.findByNameContaining(name).stream().map(Garage::toApiResponse).toList();
        } else {
            return garageService.findAllByProvinceIdAndDistrictIdAndWardIdAndNameContaining(provinceId, districtId, wardId, name).stream().map(Garage::toApiResponse).toList();
        }
    }
}