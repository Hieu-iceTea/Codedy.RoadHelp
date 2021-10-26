package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.District;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.Province;
import com.codedy.roadhelp.model.Ward;
import org.springframework.data.jpa.repository.Query;

import javax.validation.constraints.Size;
import java.util.List;

public interface GarageRepository extends BaseRepository<Garage, Integer> {

    public List<Garage> findAllByProvinceIsAndDistrictIsAndWardIsOrName(Province province, District district, Ward ward, @Size(min = 2, max = 64) String name);

    //Tìm theo tên & Lọc theo tỉnh/huyện/xã:
//    @Query("SELECT g FROM Garage g WHERE g.name LIKE %?1%")
    public List<Garage> findByNameContaining(@Size(min = 2, max = 64) String name); // 1. Chỉ có tên
    public List<Garage> findAllByProvinceIdAndDistrictIdAndWardId(int province_id, int district_id, int ward_id); // 2. Chỉ có tỉnh/huyện/xã
    public List<Garage> findAllByProvinceIdAndDistrictIdAndWardIdAndNameContaining(int province_id, int district_id, int ward_id, @Size(min = 2, max = 64) String name); // 3. Có cả tên và tỉnh/huyện/xã

    //Danh sách tiệm sửa xe đang quản lý: Lấy danh sách Garage theo UserPartnerId
    public List<Garage> findAllByUserPartnerId(int userPartner_id);

    //Danh sách tiệm sửa xe nổi bật
    public List<Garage> findAllByIsFeatured(Boolean isFeatured);
}
