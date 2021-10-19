package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import java.io.Serializable;
@Entity
@Table(name = "garageimage")
public class GarageImage extends BaseModel implements Serializable {

    @Size(max = 256)
    private String image;
    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    private Garage garage;
    //endregion

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Garage getGarage() {
        return garage;
    }

    public void setGarage(Garage garage) {
        this.garage = garage;
    }

}
