package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.District;

import java.util.List;

public interface DistrictRepository extends BaseRepository<District, Integer>{

    //Danh sách Huyện trong Tỉnh: Lấy danh sách District theo ProvinceId
    List<District> findAllByProvinceId(int province_id);

}
