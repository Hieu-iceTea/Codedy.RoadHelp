package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "ward")
public class Ward extends BaseModel {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_prefix")
    private String prefix;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @OneToMany(mappedBy = "ward", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Garage> garages;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "_province_id") //updatable = false, insertable = false
    private Province province;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "_district_id") //updatable = false, insertable = false
    private District district;
    //endregion


    //region - Getter & Setter -
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
    public HashMap<String, Object> toHashMap() {
        HashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("provinceId", province != null ? province.getId() : null);
        hashMap.put("districtId", district != null ? district.getId() : null);

        hashMap.put("name", name);
        hashMap.put("prefix", prefix);

        return hashMap;
    }

    @JsonProperty("garages")
    public List<HashMap<String, Object>> getGarageHashMap() {
        return garages != null ? garages.stream().map(Garage::toHashMap).toList() : null;
    }

    @JsonProperty("province")
    public HashMap<String, Object> getProvinceHashMap() {
        return province != null ? province.toHashMap() : null;
    }

    @JsonProperty("district")
    public HashMap<String, Object> getDistrictHashMap() {
        return district != null ? district.toHashMap() : null;
    }
    //endregion

}
