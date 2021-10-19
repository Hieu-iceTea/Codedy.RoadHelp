package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "province")
public class Province extends BaseModel implements Serializable {

    //region - Define Fields -
    @Column(name = "_name")
    private String name;

    @Column(name = "_code")
    private String code;
    //endregion


    //region - Relationship -
    @OneToMany(mappedBy = "province", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "districts")
    private List<District> districts;

    @OneToMany(mappedBy = "province", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "wards")
    private List<Ward> wards;

    @OneToMany(mappedBy = "province", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "garages")
    private List<Garage> garages;
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

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }
    //endregion


    @Override
    public String toString() {
        return "Province{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", districts=" + districts +
                ", wards=" + wards +
                ", garages=" + garages +
                '}';
    }

}
