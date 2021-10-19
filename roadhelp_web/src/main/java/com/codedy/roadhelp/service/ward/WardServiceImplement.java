package com.codedy.roadhelp.service.ward;


import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Ward;
import com.codedy.roadhelp.repository.GarageRepository;
import com.codedy.roadhelp.repository.WardRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class WardServiceImplement extends BaseServiceImplement<Ward, Integer> implements WardService {

    //region Initialization - Autowired
    @Autowired
    private WardRepository wardRepository;

    public WardServiceImplement(WardRepository repository) {
        super(repository);
    }
    //endregion

}
