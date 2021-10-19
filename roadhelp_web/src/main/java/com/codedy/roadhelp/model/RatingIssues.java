package com.codedy.roadhelp.model;

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
    private User userMember;

    @OneToOne
    @JoinColumn(name = "issue_id")
    private Issues issues;
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

    public User getUserMember() {
        return userMember;
    }

    public void setUserMember(User userMember) {
        this.userMember = userMember;
    }

    public Issues getIssues() {
        return issues;
    }

    public void setIssues(Issues issues) {
        this.issues = issues;
    }
    //endregion

    @Override
    public String toString() {
        return "RatingIssues{" +
                "ratePoint=" + ratePoint +
                ", comment='" + comment + '\'' +
                ", users=" + userMember +
                ", issues=" + issues +
                '}';
    }

}
