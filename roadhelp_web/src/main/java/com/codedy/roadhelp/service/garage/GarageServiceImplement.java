package com.codedy.roadhelp.service.garage;


import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.GarageRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;

import java.util.List;


@Service
public class GarageServiceImplement extends BaseServiceImplement<Garage, Integer> implements GarageService {

    //region Initialization - Autowired
    @Autowired
    private GarageRepository garageRepository;

    public GarageServiceImplement(GarageRepository repository) {
        super(repository);
    }

    @Override
    public List<Garage> findAllByProvinceAndDistrictAndWardIsOrName(Province province, District district, Ward ward, String name) {
        return garageRepository.findAllByProvinceIsAndDistrictIsAndWardIsOrName(province, district, ward, name);
    }

    @Override
    public List<Garage> findAllByName(String name) {
        return garageRepository.findAllByName(name);
    }
    //endregion
}
