package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;

import java.util.List;

public interface WardRepository extends BaseRepository<Ward, Integer>{

    //Danh sách Xã trong Huyện
    List<Ward> findAllByDistrictId(int district_id); // 1. Xã trong huyện
    List<Ward> findAllByDistrictIdAndProvinceId(int district_id, int province_id); // 2. Xã trong huyện & tỉnh

}
