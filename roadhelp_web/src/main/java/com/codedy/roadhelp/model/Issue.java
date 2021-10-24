package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.IssueCategory;
import com.codedy.roadhelp.model.enums.IssueStatus;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.LinkedHashMap;

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

    private IssueCategory category;

    private IssueStatus status;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_member_id")
    private User userMember;

    @ManyToOne
    @JoinColumn(name = "user_partner_id")
    private User userPartner;

    @OneToOne(mappedBy = "issue")
    private RatingIssue ratingIssue;
    //endregion


    //region - Getter & Setter -
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

    public RatingIssue getRatingIssues() {
        return ratingIssue;
    }

    public void setRatingIssues(RatingIssue ratingIssue) {
        this.ratingIssue = ratingIssue;
    }

    public RatingIssue getRatingPartner() {
        return ratingIssue;
    }

    public void setRatingPartner(RatingIssue ratingIssue) {
        this.ratingIssue = ratingIssue;
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
    protected LinkedHashMap<String, Object> toHashMap() {
        LinkedHashMap<String, Object> hashMap = super.toHashMap();

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

    /**
     * Hàm này trả về định dạng hiển thị dữ liệu API cho entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 24-10-2021<br/>
     * Thời gian: 10:15<br/>
     *
     * @return
     */
    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.remove("userMemberId");
        hashMap.remove("userPartnerId");

        hashMap.put("userMember", getUserMemberHashMap());
        hashMap.put("userPartner", getUserPartnerHashMap());
        hashMap.put("ratingIssue", getRatingIssueHashMap());

        return hashMap;
    }

    //@JsonProperty("userMember")
    private LinkedHashMap<String, Object> getUserMemberHashMap() {
        return userMember != null ? userMember.toHashMap() : null;
    }

    //@JsonProperty("userPartner")
    private LinkedHashMap<String, Object> getUserPartnerHashMap() {
        return userPartner != null ? userPartner.toHashMap() : null;
    }

    //@JsonProperty("ratingIssue")
    private LinkedHashMap<String, Object> getRatingIssueHashMap() {
        return ratingIssue != null ? ratingIssue.toHashMap() : null;
    }
    //endregion

}
