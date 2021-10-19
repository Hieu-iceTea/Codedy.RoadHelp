package com.codedy.roadhelp.service.province;


import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.repository.GarageRepository;
import com.codedy.roadhelp.repository.ProvinceRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProvinceServiceImplement extends BaseServiceImplement<Province, Integer> implements ProvinceService {

    //region Initialization - Autowired
    @Autowired
    private ProvinceRepository garageRepository;

    public ProvinceServiceImplement(ProvinceRepository repository) {
        super(repository);
    }
    //endregion

}
