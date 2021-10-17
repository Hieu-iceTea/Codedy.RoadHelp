package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "ward")
public class Ward extends BaseModel implements Serializable {
    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_prefix")
    private String prefix;

//    @Column(name = "_province_id")
//    private int province_id;
//
//    @Column(name = "_district_id")
//    private int district_id;
    //endregion

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "_province_id") //updatable = false, insertable = false
    private Province province;

    @ManyToOne
    @JoinColumn(name = "_district_id") //updatable = false, insertable = false
    private District district;

    @OneToMany(mappedBy = "ward", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "garages")
    private List<Garage> garages;
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

//    public int getProvince_id() {
//        return province_id;
//    }
//
//    public void setProvince_id(int province_id) {
//        this.province_id = province_id;
//    }
//
//    public int getDistrict_id() {
//        return district_id;
//    }
//
//    public void setDistrict_id(int district_id) {
//        this.district_id = district_id;
//    }
    //endregion
}
