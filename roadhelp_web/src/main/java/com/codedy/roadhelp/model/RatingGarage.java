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
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    private Garage garages;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
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
        return garages;
    }

    public void setGarages(Garage garages) {
        this.garages = garages;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }
    //endregion

}
