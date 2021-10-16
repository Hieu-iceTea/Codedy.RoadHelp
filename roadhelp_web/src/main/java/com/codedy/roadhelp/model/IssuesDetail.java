package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.IssueCategory;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "issue")
public class IssuesDetail extends BaseModel implements Serializable {

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

    public IssueCategory getCategory() {
        return category;
    }

    public void setCategory(IssueCategory category) {
        this.category = category;
    }

    public User getMembers() {
        return members;
    }

    public void setMembers(User members) {
        this.members = members;
    }

    public User getPartners() {
        return partners;
    }

    public void setPartners(User partners) {
        this.partners = partners;
    }

    private IssueCategory category;

//endregion

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_member_id") //updatable = false, insertable = false
    private User members;

    @ManyToOne
    @JoinColumn(name = "user_partner_id") //updatable = false, insertable = false
    private User partners;


    public RatingPartner getRatingPartner() {
        return ratingPartner;
    }

    public void setRatingPartner(RatingPartner ratingPartner) {
        this.ratingPartner = ratingPartner;
    }

    @OneToOne(mappedBy="issues")
    @JsonIgnore
    private RatingPartner ratingPartner;
//endregion

    //region - Getter & Setter -

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

    @Override
    public String toString() {
        return "IssuesDetail{" +
                "longitude=" + longitude +
                ", latitude=" + latitude +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", category=" + category +
                ", members=" + members +
                ", partners=" + partners +
                '}';
    }


//endregion

}
