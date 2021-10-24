package com.codedy.roadhelp.service.district;


import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.repository.DistrictRepository;
import com.codedy.roadhelp.repository.GarageRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DistrictServiceImplement extends BaseServiceImplement<District, Integer> implements DistrictService {

    //region Initialization - Autowired
    @Autowired
    private DistrictRepository districtRepository;

    public DistrictServiceImplement(DistrictRepository repository) {
        super(repository);
    }

    @Override
    public List<District> findAllByProvinceId(int province_id) {
        return districtRepository.findAllByProvinceId(province_id);
    }

    //endregion

}
