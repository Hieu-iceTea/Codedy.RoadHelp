package com.codedy.roadhelp.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

@Entity
@Table(name = "ward")
//@JsonIdentityInfo(scope = Authority.class, generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Ward extends BaseModel implements Serializable {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_prefix")
    private String prefix;
    //endregion


    //region - Relationship -
    @OneToMany(mappedBy = "ward", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "garages")
    private List<Garage> garages;

    @ManyToOne
    @JoinColumn(name = "_province_id") //updatable = false, insertable = false
    private Province province;

    @ManyToOne
    @JoinColumn(name = "_district_id") //updatable = false, insertable = false
    private District district;
    //endregion


    //region - Getter & Setter -

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    //endregion


    //region - Relationship Helper -

    /**
     * Hàm này trả về cấu trúc nguyên thủy của entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 23-10-2021<br/>
     * Thời gian: 22:22<br/>
     *
     * @return
     */
    protected LinkedHashMap<String, Object> toHashMap() {
        LinkedHashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("provinceId", province != null ? province.getId() : null);
        hashMap.put("districtId", district != null ? district.getId() : null);

        hashMap.put("name", name);
        hashMap.put("prefix", prefix);

        return hashMap;
    }

    /**
     * Hàm này trả về định dạng hiển thị dữ liệu API cho entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 24-10-2021<br/>
     * Thời gian: 10:15<br/>
     *
     * @return
     */
    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.remove("provinceId");
        hashMap.remove("districtId");

        hashMap.put("garages", getGarageHashMap());
        hashMap.put("province", getProvinceHashMap());
        hashMap.put("district", getDistrictHashMap());

        return hashMap;
    }

    //@JsonProperty("garages")
    private List<LinkedHashMap<String, Object>> getGarageHashMap() {
        return garages != null ? garages.stream().map(Garage::toHashMap).toList() : null;
    }

    //@JsonProperty("province")
    private LinkedHashMap<String, Object> getProvinceHashMap() {
        return province != null ? province.toHashMap() : null;
    }

    //@JsonProperty("district")
    private LinkedHashMap<String, Object> getDistrictHashMap() {
        return district != null ? district.toHashMap() : null;
    }
    //endregion

}
