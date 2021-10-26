package com.codedy.roadhelp.service.garage;


import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;
import com.codedy.roadhelp.service.base.BaseService;

import javax.validation.constraints.Size;
import java.util.List;

public interface GarageService extends BaseService<Garage, Integer> {

    public List<Garage> findAllByProvinceAndDistrictAndWardIsOrName(Province province, District district, Ward ward, @Size(min = 2, max = 64) String name);

    public List<Garage> findByNameContaining(@Size(min = 2, max = 64) String name); // 1. Chỉ có tên

    public List<Garage> findAllByProvinceIdAndDistrictIdAndWardId(int province_id, int district_id, int ward_id); // 2. Chỉ có tỉnh/huyện/xã

    public List<Garage> findAllByProvinceIdAndDistrictIdAndWardIdAndNameContaining(int province_id, int district_id, int ward_id, @Size(min = 2, max = 64) String name); // 3. Có cả tên và tỉnh/huyện/xã

    public List<Garage> findAllByIsFeatured(Boolean isFeatured);
}
