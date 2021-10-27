package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Ward;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ward.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/wards")
public class WardRestController {

    //region - Autowired Service -
    @Autowired
    private WardService wardService;
    //endregion


    //region - Base -
    // List Ward
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index(@RequestParam(defaultValue = "0") int provinceId, @RequestParam(defaultValue = "0") int districtId) {
        if (provinceId >= 1 && districtId >= 1) {
            return wardService.findAllByDistrictIdAndProvinceId(districtId, provinceId).stream().map(Ward::toApiResponse).toList();
        } else if (districtId >= 1) {
            return wardService.findAllByDistrictId(districtId).stream().map(Ward::toApiResponse).toList();
        }
        return wardService.findAll().stream().map(Ward::toApiResponse).toList();
    }

    // Detail Ward
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Ward ward = wardService.findById(id);

        if (ward == null) {
            throw new RestNotFoundException("Ward id not found - " + id);
        }

        return ward.toApiResponse();
    }

    // Create Ward
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody Ward ward) {
        ward.setId(0);

        return wardService.save(ward).toApiResponse();
    }

    // Update Ward
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Ward ward, @PathVariable int id) {
        if (!wardService.existsById(id)) {
            throw new RestNotFoundException("Ward id not found - " + id);
        }

        ward.setId(id);

        return wardService.save(ward).toApiResponse();
    }

    // Delete Ward
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!wardService.existsById(id)) {
            throw new RestNotFoundException("Ward id not found - " + id);
        }

        wardService.deleteById(id);

        return "Deleted ward id - " + id;
    }
    //endregion

}
