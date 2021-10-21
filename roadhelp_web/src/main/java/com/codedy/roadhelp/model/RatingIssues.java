package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ratingissues")
@JsonIdentityInfo(
        scope = RatingIssues.class,
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
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
    @JoinColumn(name="issue_id")
    private Issue issue;
    //endregion

    //region - Getter & Setter -
    public Issue getIssues() {
        return issue;
    }

    public void setIssues(Issue issue) {
        this.issue = issue;
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
        return userMember;
    }

    public void setUsers(User users) {
        this.userMember = users;
    }

    //endregion

}
