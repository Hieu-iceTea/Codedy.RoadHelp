package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.district.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/districts")
public class DistrictRestController {

    //region - Autowired Service -
    @Autowired
    private DistrictService districtService;
    //endregion


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index(@RequestParam(defaultValue = "0") int provinceId) {
        if (provinceId > 0) {
            return districtService.findAllByProvinceId(provinceId).stream().map(District::toApiResponse).toList();
        }
        return districtService.findAll().stream().map(District::toApiResponse).toList();
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        District district = districtService.findById(id);

        if (district == null) {
            throw new RestNotFoundException("District id not found - " + id);
        }

        return district.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody District district) {
        district.setId(0);

        return districtService.save(district).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody District district, @PathVariable int id) {
        if (!districtService.existsById(id)) {
            throw new RestNotFoundException("District id not found - " + id);
        }

        district.setId(id);

        return districtService.save(district).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!districtService.existsById(id)) {
            throw new RestNotFoundException("District id not found - " + id);
        }

        districtService.deleteById(id);

        return "Deleted district id - " + id;
    }
    //endregion

}
