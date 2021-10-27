package com.codedy.roadhelp.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

@Entity
@Table(name = "district")
//@JsonIdentityInfo(scope = Authority.class, generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class District extends BaseModel implements Serializable {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_prefix")
    private String prefix;
    //endregion


    //region - Relationship -
    @OneToMany(mappedBy = "district", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "garages")
    private List<Garage> garages;

    @ManyToOne
    @JoinColumn(name = "_province_id") //updatable = false, insertable = false
    private Province province;

    @OneToMany(mappedBy = "district", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "wards")
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
    protected LinkedHashMap<String, Object> toHashMap() {
        LinkedHashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("provinceId", province != null ? province.getId() : null);

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

        hashMap.put("garages", getGarageHashMap());
        hashMap.put("province", getProvinceHashMap());
        //hashMap.put("wards", getWardsHashMap());

        //Vì sanh sách quá nhiều, nên để giảm tải cho server, chỉ trả về List<ID> chứ không trả về List<Object>
        //hashMap.put("wardIds", getWardIdsHashMap());

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

    /*//@JsonProperty("wards")
    private List<LinkedHashMap<String, Object>> getWardsHashMap() {
        return wards != null ? wards.stream().map(Ward::toHashMap).toList() : null;
    }*/

    /*//@JsonProperty("wardIds")
    private List<Integer> getWardIdsHashMap() {
        return wards != null ? wards.stream().map(Ward::getId).toList() : null;
    }*/
    //endregion

}
