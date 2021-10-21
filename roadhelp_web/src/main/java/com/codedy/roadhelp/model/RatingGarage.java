package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ratinggarage")
@JsonIdentityInfo(
        scope = RatingGarage.class,
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
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
    private User userMember;
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

    public Garage getGarage() {
        return garage;
    }

    public void setGarage(Garage garage) {
        this.garage = garage;
    }

    public User getUserMember() {
        return userMember;
    }

    public void setUserMember(User userMember) {
        this.userMember = userMember;
    }
//endregion

}
