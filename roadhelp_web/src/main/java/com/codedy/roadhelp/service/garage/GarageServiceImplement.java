package com.codedy.roadhelp.service.garage;


import com.codedy.roadhelp.model.Garage;
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
    public List<Garage> findByName(String name) {
        return garageRepository.findByName(name);
    }
    //endregion

}
