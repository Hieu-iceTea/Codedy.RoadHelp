package com.codedy.roadhelp.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

@Entity
@Table(name = "province")
//@JsonIdentityInfo(scope = Authority.class, generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Province extends BaseModel implements Serializable {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_code")
    private String code;
    //endregion


    //region - Relationship -
    @OneToMany(mappedBy = "province", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "districts")
    private List<District> districts;

    @OneToMany(mappedBy = "province", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "wards")
    private List<Ward> wards;

    @OneToMany(mappedBy = "province", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "garages")
    private List<Garage> garages;
    //endregion


    //region - Getter & Setter -

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

        hashMap.put("name", name);
        hashMap.put("code", code);

        return hashMap;
    }

    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.put("garages", getGaragesHashMap());
        hashMap.put("districts", getDistrictsHashMap());
        hashMap.put("wards", getWardsHashMap());
        /*hashMap.put("districtIds", getDistrictIdsHashMap());
        hashMap.put("wardIds", getWardIdsHashMap());*/

        return hashMap;
    }

    //@JsonProperty("garages")
    private List<LinkedHashMap<String, Object>> getGaragesHashMap() {
        return garages != null ? garages.stream().map(Garage::toHashMap).toList() : null;
    }

    //@JsonProperty("districts")
    private List<LinkedHashMap<String, Object>> getDistrictsHashMap() {
        return districts != null ? districts.stream().map(District::toHashMap).toList() : null;
    }

    //@JsonProperty("wards")
    private List<LinkedHashMap<String, Object>> getWardsHashMap() {
        return wards != null ? wards.stream().map(Ward::toHashMap).toList() : null;
    }

    /*//@JsonProperty("districtIds")
    private List<Integer> getDistrictIdsHashMap() {
        return districts != null ? districts.stream().map(District::getId).toList() : null;
    }*/

    /*//@JsonProperty("wardIds")
    private List<Integer> getWardIdsHashMap() {
        return wards != null ? wards.stream().map(Ward::getId).toList() : null;
    }*/
    //endregion

}
