package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.district.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/districts")
public class DistrictRestController {

    @Autowired
    private DistrictService districtService;

    // List District
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index(@RequestParam(defaultValue = "0") int provinceId) {
        List<District> districts = districtService.findAll();
        List<District> districtsByProvinceId = new ArrayList<>();
        for (District d: districts
        ) {
            if (d.getProvince().getId() == provinceId){
                districtsByProvinceId.add(d);
            }

        }
        if(provinceId > 0){
            return districtsByProvinceId.stream().map(District::toApiResponse).toList();
        }
        else {
            return districtService.findAll().stream().map(District::toApiResponse).toList();

        }
    }

    // Detail District
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        District district = districtService.findById(id);
        if (district == null) {
            throw new RestNotFoundException("District id not found - " + id);
        }

        return district.toApiResponse();
    }

    // Create District
    @PostMapping(path = {"", "/"})
    public District store(@RequestBody District district) {
        district.setId(0);
        District newDistrict = districtService.save(district);
        return districtService.findById(newDistrict.getId());
    }

    // Update District
    @PutMapping(path = {"/{id}", "/{id}/"})
    public District update(@RequestBody District district, @PathVariable int id) {

        if (districtService.findById(id) == null) {
            throw new RestNotFoundException("District id not found - " + id);
        }

        district.setId(id);
        districtService.save(district);
        return districtService.findById(district.getId());
    }

    // Delete District
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (districtService.findById(id) == null) {
            throw new RestNotFoundException("District id not found - " + id);
        }

        districtService.deleteById(id);
        return "Deleted district id - " + id;
    }
}
