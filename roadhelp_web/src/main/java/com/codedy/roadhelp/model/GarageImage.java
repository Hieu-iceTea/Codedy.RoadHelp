package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "garageimage")
public class GarageImage extends BaseModel implements Serializable {

    //region - Define Fields -
    @Size(max = 256)
    private String image;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    private Garage garage;
    //endregion


    //region - Getter & Setter -
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
    //endregion


    @Override
    public String toString() {
        return "GarageImage{" +
                "image='" + image + '\'' +
                ", garage=" + garage +
                '}';
    }

}
