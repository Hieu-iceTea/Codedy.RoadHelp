package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "province")
public class Province extends BaseModel {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_code")
    private String code;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @OneToMany(mappedBy = "province", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Garage> garages;

    @JsonIgnore
    @OneToMany(mappedBy = "province", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<District> districts;

    @JsonIgnore
    @OneToMany(mappedBy = "province", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Ward> wards;
    //endregion


    //region - Getter & Setter -
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }

    public List<District> getDistricts() {
        return districts;
    }

    public void setDistricts(List<District> districts) {
        this.districts = districts;
    }

    public List<Ward> getWards() {
        return wards;
    }

    public void setWards(List<Ward> wards) {
        this.wards = wards;
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

        hashMap.put("name", name);
        hashMap.put("code", code);

        return hashMap;
    }

    @JsonProperty("garages")
    public List<HashMap<String, Object>> getGaragesHashMap() {
        return garages != null ? garages.stream().map(Garage::toHashMap).toList() : null;
    }

    @JsonProperty("districts")
    public List<HashMap<String, Object>> getDistrictsHashMap() {
        return districts != null ? districts.stream().map(District::toHashMap).toList() : null;
    }

    @JsonProperty("wards")
    public List<HashMap<String, Object>> getWardsHashMap() {
        return wards != null ? wards.stream().map(Ward::toHashMap).toList() : null;
    }

    /*@JsonProperty("districtIds")
    public List<Integer> getDistrictIdsHashMap() {
        return districts != null ? districts.stream().map(District::getId).toList() : null;
    }*/

    /*@JsonProperty("wardIds")
    public List<Integer> getWardIdsHashMap() {
        return wards != null ? wards.stream().map(Ward::getId).toList() : null;
    }*/
    //endregion

}
