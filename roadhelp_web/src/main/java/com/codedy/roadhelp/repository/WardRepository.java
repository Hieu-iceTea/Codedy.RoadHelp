package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;

import java.util.List;

public interface WardRepository extends BaseRepository<Ward, Integer>{

    //Danh sách Xã trong Huyện
    List<Ward> findAllByDistrictId(int district_id); // 1. Nếu chỉ truyền ID_huyện
    List<Ward> findAllByDistrictIdAndProvinceId(int district_id, int province_id); // 2. Nếu truyền cả ID_huyện & ID_tỉnh

}
