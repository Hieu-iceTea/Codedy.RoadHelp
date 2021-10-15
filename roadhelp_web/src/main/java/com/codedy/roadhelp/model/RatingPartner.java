package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ratingpartner")
public class RatingPartner extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "partner_id") //updatable = false, insertable = false
    private Partner partner;

    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User users;

//TODO
//    @OneToOne
//    @JoinColumn(name="issue_id")
//    private IssuesDetail issues;
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

    public Partner getPartner() {
        return partner;
    }

    public void setPartner(Partner partners) {
        this.partner = partners;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "RatingPartner{" +
                "ratePoint=" + ratePoint +
                ", comment='" + comment + '\'' +
                ", partner=" + partner +
                ", users=" + users +
                '}';
    }
    //endregion

}
