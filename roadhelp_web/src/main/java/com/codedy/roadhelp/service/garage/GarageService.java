package com.codedy.roadhelp.service.garage;


import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.service.base.BaseService;

import java.util.List;

public interface GarageService extends BaseService<Garage, Integer> {

    public List<Garage> findByName(String name);

}
