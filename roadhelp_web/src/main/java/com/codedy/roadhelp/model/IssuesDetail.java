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
    @Size(max = 128)
    private String commune;

    private double longitude;

    private double latitude;

    @Size(min = 10)
    private String phone;
    @Size(max = 128)
    private String address;

    @Size(max = 500)
    private String description;

    private IssueStatus status;

//endregion

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User users;

    @ManyToOne
    @JoinColumn(name = "partner_id")
    private Partner partner;


//todo
//    @OneToOne(mappedBy="issue")
//    private RatingPartner ratingPartner;
//endregion

    //region - Getter & Setter -

    public IssueStatus getStatus() {
        return status;
    }

    public void setStatus(IssueStatus status) {
        this.status = status;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
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

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public Partner getPartner() {
        return partner;
    }

    public void setPartner(Partner partner) {
        this.partner = partner;
    }

    @Override
    public String toString() {
        return "IssuesDetail{" +
                "commune='" + commune + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", users=" + users +
                '}';
    }
    //endregion

}
