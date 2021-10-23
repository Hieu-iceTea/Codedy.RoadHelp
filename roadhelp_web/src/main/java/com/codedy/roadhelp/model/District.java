package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "district")
public class District extends BaseModel {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_prefix")
    private String prefix;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @OneToMany(mappedBy = "district", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Garage> garages;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "_province_id") //updatable = false, insertable = false
    private Province province;

    @JsonIgnore
    @OneToMany(mappedBy = "district", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Ward> wards;
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

        hashMap.put("provinceId", province != null ? province.getId() : null);

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

    @JsonProperty("wards")
    public List<HashMap<String, Object>> getWardsHashMap() {
        return wards != null ? wards.stream().map(Ward::toHashMap).toList() : null;
    }

    /*@JsonProperty("wardIds")
    public List<Integer> getWardIdsHashMap() {
        return wards != null ? wards.stream().map(Ward::getId).toList() : null;
    }*/
    //endregion

}
