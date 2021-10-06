package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ratingGarage")
public class RatingGarage extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    private Garage garage;

    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User users;
    //endregion


    //region - Getter & Setter -
    public int getRatePoint() {
        return ratePoint;
    }

    public void setRatePoint(int ratePoint) {
        this.ratePoint = ratePoint;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Garage getGarages() {
        return garage;
    }

    public void setGarages(Garage garages) {
        this.garage = garages;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public Garage getGarage() {
        return garage;
    }

    public void setGarage(Garage garage) {
        this.garage = garage;
    }

    @Override
    public String toString() {
        return "RatingGarage{" +
                "ratePoint=" + ratePoint +
                ", comment='" + comment + '\'' +
                ", garage=" + garage +
                ", users=" + users +
                '}';
    }

    //endregion

}
