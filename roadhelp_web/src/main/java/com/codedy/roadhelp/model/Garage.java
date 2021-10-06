package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;
import java.util.regex.Pattern;

@Entity
@Table(name = "garage")
public class Garage extends BaseModel implements Serializable {

    //region - Define Fields -
    @Size(min = 2, max = 64)
    private String name;

    @Size(max = 128)
    private String image;

    private Boolean gender;

    private double rate;

    @Size(min = 2, max = 64)
    private String address;

    @Size(min = 2, max = 16)
    private String phone;

    @Size(min = 2, max = 128)
    private String commune;

    @Size(max = 64)
    private String longitude;

    @Size(max = 64)
    private String latitude;

    @Size(min = 2, max = 500)
    private String description;

    // - - - - -
    @NotNull
    private Boolean active;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "partner_id")
    private Partner partner;

    @OneToMany(mappedBy = "garage")
    private List<RatingGarage> ratingGarages;
    //endregion


    //region - Getter & Setter -
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Partner getPartner() {
        return partner;
    }

    public void setPartner(Partner partner) {
        this.partner = partner;
    }

    public List<RatingGarage> getRatingGarages() {
        return ratingGarages;
    }

    public void setRatingGarages(List<RatingGarage> ratingGarages) {
        this.ratingGarages = ratingGarages;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Garage{" +
                "name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", gender=" + gender +
                ", rate='" + rate + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", commune='" + commune + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", description='" + description + '\'' +
                ", active=" + active +
                ", partner=" + partner +
                ", ratingGarages=" + ratingGarages +
                '}';
    }

    //endregion

}
