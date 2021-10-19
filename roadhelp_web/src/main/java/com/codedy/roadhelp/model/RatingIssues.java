package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ratingissues")
public class RatingIssues extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_member_id")
    private User users;

    @OneToOne
    @JoinColumn(name="issue_id")
    private Issues issues;
    //endregion

    //region - Getter & Setter -
    public Issues getIssues() {
        return issues;
    }

    public void setIssues(Issues issues) {
        this.issues = issues;
    }
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
                ", users=" + users +
                '}';
    }
    //endregion

}
