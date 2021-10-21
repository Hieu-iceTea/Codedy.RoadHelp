package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "garage")
@JsonIdentityInfo(
        scope = Garage.class,
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
public class Garage extends BaseModel implements Serializable {

    //region - Define Fields -
    @Size(min = 2, max = 64)
    private String name;

    private double rateAvg;

    @Size(max = 128)
    private String address;

    @Size(min = 10)
    private String phone;

    private double longitude;

    private double latitude;

    @Size(max = 500)
    private String description;

    //@NotNull
    private Boolean active;
    private Boolean isFeatured;
//endregion

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "partner_id") //updatable = false, insertable = false
    private User partner;

    @OneToMany(mappedBy = "garage", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    private List<RatingGarage> ratingGarages;

    @OneToMany(mappedBy = "garage", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    private List<GarageImage> garageImages;

    @ManyToOne
    @JoinColumn(name = "province_id") //updatable = false, insertable = false
    private Province province;

    @ManyToOne
    @JoinColumn(name = "district_id") //updatable = false, insertable = false
    private District district;

    @ManyToOne
    @JoinColumn(name = "ward_id") //updatable = false, insertable = false
    private Ward ward;
    //endregion

    //region - Getter & Setter -

    public User getPartner() {
        return partner;
    }

    public void setPartner(User partner) {
        this.partner = partner;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
    }

    public List<GarageImage> getGarageImages() {
        return garageImages;
    }

    public void setGarageImages(List<GarageImage> garageImages) {
        this.garageImages = garageImages;
    }

    public Boolean getFeatured() {
        return isFeatured;
    }

    public void setFeatured(Boolean featured) {
        isFeatured = featured;
    }

    public double getRateAvg() {
        return rateAvg;
    }

    public void setRateAvg(double rateAvg) {
        this.rateAvg = rateAvg;
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

    //endregion

}
