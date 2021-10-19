package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.IssueCategory;
import com.codedy.roadhelp.model.enums.IssueStatus;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "issue")
public class Issues extends BaseModel implements Serializable {

    //region - Define Fields -
    @Size(max = 128)
    private String address;

    @Size(min = 10)
    private String phone;

    private double longitude;

    private double latitude;

    private IssueCategory category;

    @Size(max = 500)
    private String description;

    private IssueStatus status;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_member_id")
    private User userMember;

    @ManyToOne
    @JoinColumn(name = "user_partner_id")
    private User userPartner;

    @OneToOne(mappedBy = "issues")
    private RatingIssues ratingIssues;
    //endregion


    //region - Getter & Setter -
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public IssueCategory getCategory() {
        return category;
    }

    public void setCategory(IssueCategory category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public IssueStatus getStatus() {
        return status;
    }

    public void setStatus(IssueStatus status) {
        this.status = status;
    }

    public User getUserMember() {
        return userMember;
    }

    public void setUserMember(User userMember) {
        this.userMember = userMember;
    }

    public User getUserPartner() {
        return userPartner;
    }

    public void setUserPartner(User userPartner) {
        this.userPartner = userPartner;
    }

    public RatingIssues getRatingIssues() {
        return ratingIssues;
    }

    public void setRatingIssues(RatingIssues ratingIssues) {
        this.ratingIssues = ratingIssues;
    }
    //endregion


    @Override
    public String toString() {
        return "Issues{" +
                "address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", category=" + category +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", userMember=" + userMember +
                ", userPartner=" + userPartner +
                ", ratingIssues=" + ratingIssues +
                '}';
    }

}
