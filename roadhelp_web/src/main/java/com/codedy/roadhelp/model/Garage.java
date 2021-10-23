package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "garage")
public class Garage extends BaseModel {

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
    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "partner_id") //updatable = false, insertable = false
    private User userPartner;

    @JsonIgnore
    @OneToMany(mappedBy = "garage", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<RatingGarage> ratingGarages;

    @JsonIgnore
    @OneToMany(mappedBy = "garage", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<GarageImage> garageImages;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "province_id") //updatable = false, insertable = false
    private Province province;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "district_id") //updatable = false, insertable = false
    private District district;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "ward_id") //updatable = false, insertable = false
    private Ward ward;
    //endregion


    //region - Getter & Setter -
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Boolean getFeatured() {
        return isFeatured;
    }

    public void setFeatured(Boolean featured) {
        isFeatured = featured;
    }

    public User getUserPartner() {
        return userPartner;
    }

    public void setUserPartner(User userPartner) {
        this.userPartner = userPartner;
    }

    public List<RatingGarage> getRatingGarages() {
        return ratingGarages;
    }

    public void setRatingGarages(List<RatingGarage> ratingGarages) {
        this.ratingGarages = ratingGarages;
    }

    public List<GarageImage> getGarageImages() {
        return garageImages;
    }

    public void setGarageImages(List<GarageImage> garageImages) {
        this.garageImages = garageImages;
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
    //endregion


    //region - Relationship Helper -

    /**
     * Hàm này trả về cấu trúc nguyên thủy của entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 23-10-2021<br/>
     * Thời gian: 22:22<br/>
     *
     * @return
     */
    public HashMap<String, Object> toHashMap() {
        HashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("partnerId", userPartner != null ? userPartner.getId() : null);
        hashMap.put("provinceId", province != null ? province.getId() : null);
        hashMap.put("districtId", district != null ? district.getId() : null);
        hashMap.put("wardId", ward != null ? ward.getId() : null);

        hashMap.put("name", name);
        hashMap.put("phone", phone);
        hashMap.put("rateAvg", rateAvg);
        hashMap.put("address", address);
        hashMap.put("longitude", longitude);
        hashMap.put("latitude", latitude);
        hashMap.put("description", description);
        hashMap.put("active", active);
        hashMap.put("isFeatured", isFeatured);

        return hashMap;
    }

    @JsonProperty("userPartner")
    public HashMap<String, Object> getUserPartnerHashMap() {
        return userPartner != null ? userPartner.toHashMap() : null;
    }

    @JsonProperty("ratingGarages")
    public List<HashMap<String, Object>> getRatingGaragesHashMap() {
        return ratingGarages != null ? ratingGarages.stream().map(RatingGarage::toHashMap).toList() : null;
    }

    @JsonProperty("garageImages")
    public List<HashMap<String, Object>> getGarageImagesHashMap() {
        return garageImages != null ? garageImages.stream().map(GarageImage::toHashMap).toList() : null;
    }

    @JsonProperty("province")
    public HashMap<String, Object> getProvinceHashMap() {
        return province != null ? province.toHashMap() : null;
    }

    @JsonProperty("district")
    public HashMap<String, Object> getDistrictHashMap() {
        return district != null ? district.toHashMap() : null;
    }

    @JsonProperty("ward")
    public HashMap<String, Object> getWardHashMap() {
        return ward != null ? ward.toHashMap() : null;
    }
    //endregion

}
