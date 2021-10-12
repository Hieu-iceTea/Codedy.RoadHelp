package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "issue")
public class IssuesDetail extends BaseModel implements Serializable {

    //region - Define Fields -

    @NotNull
    @Size(min = 2, max = 64)
    private String commune;

    @Size(min = 2, max = 64)
    private String longitude;

    @Size(min = 2, max = 64)
    private String latitude;

    @Size(max = 16)
    private String phone;

    @Size(max = 128)
    private String address;

    @Size(min = 2, max = 500)
    private String description;

    private  int category;

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }


    private int status;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User users;

    @ManyToOne
    @JoinColumn(name = "partner_id")
    private Partner partner;


    public Partner getPartner() {
        return partner;
    }

    public void setPartner(Partner partner) {
        this.partner = partner;
    }

//    public RatingPartner getRatingPartner() {
//        return ratingPartner;
//    }
//
//    public void setRatingPartner(RatingPartner ratingPartner) {
//        this.ratingPartner = ratingPartner;
//    }
//
//
//
//    @OneToOne(mappedBy="issue")
//    private RatingPartner ratingPartner;
//endregion


    //region - Getter & Setter -

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
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

    public void setUserIds(User users) {
        this.users = users;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setUsers(User users) {
        this.users = users;
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
