package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.district.DistrictService;
import com.codedy.roadhelp.service.province.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/provinces")
public class ProvinceRestController {

    @Autowired
    private ProvinceService provinceServiceService;
    private DistrictService districtService;

    // List Province
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return provinceServiceService.findAll().stream().map(Province::toApiResponse).toList();
    }

    // Detail Province
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Province province = provinceServiceService.findById(id);
        if (province == null) {
            throw new RestNotFoundException("Province id not found - " + id);
        }
        return province.toApiResponse();
    }

    // Create Province
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody Province province) {
        province.setId(0);
        Province newProvince = provinceServiceService.save(province);
        return provinceServiceService.findById(newProvince.getId()).toApiResponse();
    }

    // Update Province
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Province province, @PathVariable int id) {

        if (provinceServiceService.findById(id) == null) {
            throw new RestNotFoundException("Province id not found - " + id);
        }

        province.setId(id);
        provinceServiceService.save(province);
        return provinceServiceService.findById(province.getId()).toApiResponse();
    }

    // Delete Province
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (provinceServiceService.findById(id) == null) {
            throw new RestNotFoundException("Province id not found - " + id);
        }

        provinceServiceService.deleteById(id);
        return "Deleted province id - " + id;
    }
}
