package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.province.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/provinces")
public class ProvinceRestController {

    //region - Autowired Service -
    @Autowired
    private ProvinceService provinceServiceService;
    //endregion


    //region - Base -
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

        return provinceServiceService.save(province).toApiResponse();
    }

    // Update Province
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Province province, @PathVariable int id) {
        if (!provinceServiceService.existsById(id)) {
            throw new RestNotFoundException("Province id not found - " + id);
        }

        province.setId(id);

        return provinceServiceService.save(province).toApiResponse();
    }

    // Delete Province
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!provinceServiceService.existsById(id)) {
            throw new RestNotFoundException("Province id not found - " + id);
        }

        provinceServiceService.deleteById(id);

        return "Deleted province id - " + id;
    }
    //endregion

}
