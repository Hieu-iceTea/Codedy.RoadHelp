package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.RatingGarage;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.garage.GarageService;
import com.codedy.roadhelp.service.ratingGarage.RatingGarageService;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garages")
public class GarageRestController {

    //region - Autowired Service -
    @Autowired
    private GarageService garageService;

    @Autowired
    private RatingGarageService ratingGarageService;

    @Autowired
    private UserService userService;
    //endregion


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index(@RequestParam(required = false, defaultValue = "") String name,
                                                     @RequestParam(required = false, defaultValue = "0") int provinceId,
                                                     @RequestParam(required = false, defaultValue = "0") int districtId,
                                                     @RequestParam(required = false, defaultValue = "0") int wardId) {
        //return garageService.findAll().stream().map(Garage::toApiResponse).toList();
        return this.searchLocal(name, provinceId, districtId, wardId);
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Garage garage = garageService.findById(id);

        if (garage == null) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }

        return garage.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody Garage garage) {
        garage.setId(0);

        return garageService.save(garage).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Garage garage, @PathVariable int id) {
        if (!garageService.existsById(id)) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }

        garage.setId(id);

        return garageService.save(garage).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!garageService.existsById(id)) {
            throw new RestNotFoundException("Garage id not found - " + id);
        }

        garageService.deleteById(id);

        return "Deleted garage id - " + id;
    }
    //endregion


    //region - Extend -

    // = = = = = = = = = = = = = = = For Member = = = = = = = = = = = = = = = //

    // Tìm kiếm tiệm sửa xe theo tên, Tỉnh/Huyện/Xã
    @GetMapping(path = {"/search", "/search"})
    public List<LinkedHashMap<String, Object>> searchLocal(@RequestParam(required = false, defaultValue = "") String name,
                                                           @RequestParam(required = false, defaultValue = "0") int provinceId,
                                                           @RequestParam(required = false, defaultValue = "0") int districtId,
                                                           @RequestParam(required = false, defaultValue = "0") int wardId) {
        // 1. Có tất cả tên và tỉnh/huyện/xã
        if (!name.isEmpty() && (provinceId >= 1 || districtId >= 1 || wardId >= 1)) {
            return garageService.findAllByProvinceIdAndDistrictIdAndWardIdAndNameContaining(provinceId, districtId, wardId, name).stream().map(Garage::toApiResponse).toList();
        }

        // 2. Chỉ có tên
        if (!name.isEmpty()) {
            return garageService.findByNameContaining(name).stream().map(Garage::toApiResponse).toList();
        }

        // 3. Nếu chỉ có tỉnh/huyện/xã
        if (provinceId >= 1 || districtId >= 1 || wardId >= 1) {
            return garageService.findAllByProvinceIdAndDistrictIdAndWardId(provinceId, districtId, wardId).stream().map(Garage::toApiResponse).toList();
        }

        //Mặc định getAll()
        return garageService.findAll().stream().map(Garage::toApiResponse).toList();

    }

    // Tìm kiếm tiệm sửa xe theo tên, Vị trí gần nhất
    @GetMapping(path = {"/searchNearMe", "/searchNearMe/"})
    public List<LinkedHashMap<String, Object>> searchNearMe(@RequestParam(required = false, defaultValue = "") String name,
                                                            @RequestParam(required = false, defaultValue = "0") double latitude,
                                                            @RequestParam(required = false, defaultValue = "0") double longitude,
                                                            @RequestParam(required = false, defaultValue = "0") int distance) {

        // 1. Có tất cả tên và Vị trí gần nhất
        if (!name.isEmpty() && (latitude >= 1 || longitude >= 1 || distance >= 1)) {
            List<Garage> garages = garageService.findByNameContaining(name);
            return this.filterNearMe(garages, latitude, longitude, distance).stream().map(Garage::toApiResponse).toList();
        }

        // 2. Chỉ có tên
        if (!name.isEmpty()) {
            return garageService.findByNameContaining(name).stream().map(Garage::toApiResponse).toList();
        }

        // 3. Nếu chỉ có Vị trí gần nhất
        if (latitude >= 1 || longitude >= 1 || distance >= 1) {
            List<Garage> garages = garageService.findAll(); //TODO: hiệu năng kém
            return this.filterNearMe(garages, latitude, longitude, distance).stream().map(Garage::toApiResponse).toList();
        }

        //Mặc định getAll()
        return garageService.findAll().stream().map(Garage::toApiResponse).toList();
    }

    //Danh sách tiệm sửa xe nổi bật
    @GetMapping(path = {"/featured", "/featured/"})
    public List<LinkedHashMap<String, Object>> garagesFeatured(@RequestParam(required = false, defaultValue = "true") Boolean isFeatured) {
        return garageService.findAllByIsFeatured(isFeatured).stream().map(Garage::toApiResponse).toList();
    }

    // Member viết đánh giá garage -
    @PostMapping(path = {"/{garageId}/ratingGarage", "/{garageId}/ratingGarage/"})
    public LinkedHashMap<String, Object> reviewGarage(@RequestBody RatingGarage ratingGarage, @PathVariable int garageId) {
        ratingGarage.setId(0);

        Garage garage = garageService.findById(garageId);
        ratingGarage.setGarage(garage);

        return ratingGarageService.save(ratingGarage).toApiResponse();
    }


    // = = = = = = = = = = = = = = = For Partner = = = = = = = = = = = = = = = //

    // Danh sách tiệm sửa xe đang quản lý - V2 (Hiếu iceTea)
    @GetMapping(path = {"/byPartner/{partnerId}", "/byPartner/{partnerId}/"})
    public List<LinkedHashMap<String, Object>> byPartner(@PathVariable int partnerId) {
        return garageService.findAllByUserPartnerId(partnerId).stream().map(Garage::toApiResponse).toList();
    }

    // Tạm dừng hoạt động garage
    @PutMapping(path = {"/{id}/setActive", "/{id}/setActive"})
    public String repair_delete(@PathVariable int id, @RequestParam boolean active) {
        Garage garage = garageService.findById(id);
        garage.setActive(active);

        garageService.save(garage);

        return "Garage id: " + garage.getId() + " - Set active: " + active;
    }
    //endregion


    //region - Common Method -

    // Tính khoảng cách
    private double calculateDistanceInMeters(double lat1, double long1, double lat2, double long2) {
        return org.apache.lucene.util.SloppyMath.haversinMeters(lat1, long1, lat2, long2);
    }

    // Lọc theo vị trí gần tôi
    private List<Garage> filterNearMe(List<Garage> garages, double latitude, double longitude, int distance) {
        List<Garage> garageNearMe = new ArrayList<>();

        for (Garage garage : garages) {
            double value = calculateDistanceInMeters(garage.getLatitude(), garage.getLongitude(), latitude, longitude);
            if (value <= distance) {
                garageNearMe.add(garage);
            }
        }

        return garageNearMe;
    }

    //endregion

}