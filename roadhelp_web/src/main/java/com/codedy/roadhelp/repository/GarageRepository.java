package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;

import javax.validation.constraints.Size;
import java.util.List;

public interface GarageRepository extends BaseRepository<Garage, Integer> {

    public List<Garage> findAllByProvinceIsAndDistrictIsAndWardIsOrName(Province province, District district, Ward ward, @Size(min = 2, max = 64) String name);

    public List<Garage> findAllByName(@Size(min = 2, max = 64) String name);

}
