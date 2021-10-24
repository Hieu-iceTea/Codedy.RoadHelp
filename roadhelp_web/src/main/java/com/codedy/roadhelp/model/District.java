package com.codedy.roadhelp.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

@Entity
@Table(name = "district")
/*@JsonIdentityInfo(
        scope = District.class,
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")*/
public class District extends BaseModel implements Serializable {
    @Column(name = "_name")
    private String name;

    @Column(name = "_prefix")
    private String prefix;


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "_province_id") //updatable = false, insertable = false
    private Province province;

    @OneToMany(mappedBy = "district", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "wards")
    private List<Ward> wards;

    @OneToMany(mappedBy = "district", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "garages")
    private List<Garage> garages;
    //endregion
    //region - Getter & Setter -

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

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
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

        hashMap.put("name", name);
        hashMap.put("prefix", prefix);

        return hashMap;
    }

    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.remove("provinceId");

        hashMap.put("garages", getGarageHashMap());
        hashMap.put("province", getProvinceHashMap());
        hashMap.put("wards", getWardsHashMap());

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

    //@JsonProperty("wards")
    private List<LinkedHashMap<String, Object>> getWardsHashMap() {
        return wards != null ? wards.stream().map(Ward::toHashMap).toList() : null;
    }

    /*@JsonProperty("wardIds")
    public List<Integer> getWardIdsHashMap() {
        return wards != null ? wards.stream().map(Ward::getId).toList() : null;
    }*/
    //endregion

}
