package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.IssueCategory;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.HashMap;

@Entity
@Table(name = "issue")
public class Issue extends BaseModel {

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
    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "user_member_id")
    private User userMember;

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "user_partner_id")
    private User userPartner;

    @JsonIgnore
    @OneToOne(mappedBy = "issue", cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private RatingIssues ratingIssue;
    //endregion


    //region - Getter & Setter -
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

    public IssueStatus getStatus() {
        return status;
    }

    public void setStatus(IssueStatus status) {
        this.status = status;
    }

    public IssueCategory getCategory() {
        return category;
    }

    public void setCategory(IssueCategory category) {
        this.category = category;
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

    public RatingIssues getRatingIssue() {
        return ratingIssue;
    }

    public void setRatingIssue(RatingIssues ratingIssue) {
        this.ratingIssue = ratingIssue;
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

        hashMap.put("userMemberId", userMember != null ? userMember.getId() : null);
        hashMap.put("userPartnerId", userPartner != null ? userPartner.getId() : null);

        hashMap.put("longitude", longitude);
        hashMap.put("latitude", latitude);
        hashMap.put("phone", phone);
        hashMap.put("address", address);
        hashMap.put("category", category);
        hashMap.put("description", description);
        hashMap.put("status", status);

        return hashMap;
    }

    @JsonProperty("userMember")
    public HashMap<String, Object> getUserMemberHashMap() {
        return userMember != null ? userMember.toHashMap() : null;
    }

    @JsonProperty("userPartner")
    public HashMap<String, Object> getUserPartnerHashMap() {
        return userPartner != null ? userPartner.toHashMap() : null;
    }

    @JsonProperty("ratingIssue")
    public HashMap<String, Object> getRatingIssueHashMap() {
        return ratingIssue != null ? ratingIssue.toHashMap() : null;
    }
    //endregion

}
