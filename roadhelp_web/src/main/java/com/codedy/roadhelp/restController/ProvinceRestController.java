package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.province.ProvinceService;
import com.codedy.roadhelp.service.province.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/provinces")
public class ProvinceRestController {

    @Autowired
    private ProvinceService provinceServiceService;

    // List Province
    @GetMapping(path = {"", "/", "/index"})
    public List<Province> index() {
        return provinceServiceService.findAll();
    }

    // Detail Province
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Province show(@PathVariable int id) {
        Province province = provinceServiceService.findById(id);
        if (province == null) {
            throw new RestNotFoundException("Province id not found - " + id);
        }
        return province;
    }

    // Create Province
    @PostMapping(path = {"", "/"})
    public Province store(@RequestBody Province province) {
        province.setId(0);
        Province newProvince = provinceServiceService.save(province);
        return provinceServiceService.findById(newProvince.getId());
    }

    // Update Province
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Province update(@RequestBody Province province, @PathVariable int id) {

        if (provinceServiceService.findById(id) == null) {
            throw new RestNotFoundException("Province id not found - " + id);
        }

        province.setId(0);
        provinceServiceService.save(province);
        return provinceServiceService.findById(province.getId());
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
