package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.IssueCategory;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.fasterxml.jackson.annotation.*;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "issue")
public class Issue extends BaseModel implements Serializable {

    //region - Define Fields -

    private double longitude;

    private double latitude;

    @Size(min = 10)
    private String phone;

    @Size(max = 128)
    private String address;

    @Size(max = 500)
    private String description;

    private IssueStatus status;

    private IssueCategory category;

//endregion

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_member_id")
    private User userMembers;

    @ManyToOne
    @JoinColumn(name = "user_partner_id")
    private User userPartners;

    @OneToOne(mappedBy="issue")
    private RatingIssues ratingIssues;
//endregion

    //region - Getter & Setter -
    public IssueCategory getCategory() {
        return category;
    }

    public void setCategory(IssueCategory category) {
        this.category = category;
    }

    public User getUserMembers() {
        return userMembers;
    }

    public void setUserMembers(User userMembers) {
        this.userMembers = userMembers;
    }

    public User getUserPartners() {
        return userPartners;
    }

    public void setUserPartners(User userPartners) {
        this.userPartners = userPartners;
    }

    public RatingIssues getRatingIssues() {
        return ratingIssues;
    }

    public void setRatingIssues(RatingIssues ratingIssues) {
        this.ratingIssues = ratingIssues;
    }

    public RatingIssues getRatingPartner() {
        return ratingIssues;
    }

    public void setRatingPartner(RatingIssues ratingIssues) {
        this.ratingIssues = ratingIssues;
    }

    public IssueStatus getStatus() {
        return status;
    }

    public void setStatus(IssueStatus status) {
        this.status = status;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//endregion

}
