package com.codedy.roadhelp.service.ward;


import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Ward;
import com.codedy.roadhelp.service.base.BaseService;

import java.util.List;

public interface WardService extends BaseService<Ward, Integer> {

    //
    List<Ward> findAllByDistrictId(int district_id); // 1. Nếu chỉ truyền ID_huyện
    List<Ward> findAllByDistrictIdAndProvinceId(int district_id, int province_id); // 2. Nếu truyền cả ID_huyện & ID_tỉnh
}
