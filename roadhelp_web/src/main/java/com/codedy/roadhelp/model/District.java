package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "district")
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
    @JsonBackReference(value = "wards")
    private List<Ward> wards;

    @OneToMany(mappedBy = "district", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "garages")
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



    @Override
    public String toString() {
        return "District{" +
                "name='" + name + '\'' +
                ", prefix='" + prefix + '\'' +
                '}';
    }
    //endregion
}
