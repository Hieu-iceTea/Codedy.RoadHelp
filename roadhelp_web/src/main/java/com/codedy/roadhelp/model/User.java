package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.UserGender;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

@Entity
@Table(name = "users")
/*@JsonIdentityInfo(
        scope = User.class,
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")*/
public class User extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    @Size(min = 6, max = 64)
    @Column(name = "username")
    private String username;

    @Email
    @Size(max = 128)
    private String email;

    @Size(min = 6)
    private String password;
    @Size(max = 128)
    private String image;
    @Column(name = "gender")
    private UserGender gender;

    @Size(min = 2, max = 64)
    private String firstName;

    @Size(min = 2, max = 64)
    private String lastName;

    @Size(min = 10)
    private String phone;

    //    @NotNull
    private Boolean active;
    //endregion

    //region - Relationship -
    @OneToMany(mappedBy = "partner", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    private List<Garage> garages;

    @OneToMany(mappedBy = "userPartners", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "issuesPartnerDetails")
    private List<Issue> issuePartnerDetails;

    @OneToMany(mappedBy = "userMembers", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    //@JsonBackReference(value = "issueMemberDetails")
    private List<Issue> issueMemberDetails;

    @OneToMany(mappedBy = "userMember")
    private List<RatingGarage> ratingGarages;

    @OneToMany(mappedBy = "userMember")
    //@JsonBackReference(value = "ratingIssues")
    private List<RatingIssues> ratingIssues;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Authority> authorities;
    //endregion

    //region - Getter & Setter -

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }

    public List<RatingIssues> getRatingIssues() {
        return ratingIssues;
    }

    public void setRatingIssues(List<RatingIssues> ratingIssues) {
        this.ratingIssues = ratingIssues;
    }

    public List<Issue> getIssuesPartnerDetails() {
        return issuePartnerDetails;
    }

    public void setIssuesPartnerDetails(List<Issue> issuePartnerDetails) {
        this.issuePartnerDetails = issuePartnerDetails;
    }

    public List<Issue> getIssuesMemberDetails() {
        return issueMemberDetails;
    }

    public void setIssuesMemberDetails(List<Issue> issueMemberDetails) {
        this.issueMemberDetails = issueMemberDetails;
    }

    public List<RatingIssues> getRatingPartners() {
        return ratingIssues;
    }

    public void setRatingPartners(List<RatingIssues> ratingIssues) {
        this.ratingIssues = ratingIssues;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public UserGender getGender() {
        return gender;
    }

    public void setGender(UserGender gender) {
        this.gender = gender;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public List<Authority> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List<Authority> authorities) {
        this.authorities = authorities;
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

        hashMap.put("username", username);
        hashMap.put("email", email);
        hashMap.put("password", password);
        hashMap.put("image", image);
        hashMap.put("gender", gender);
        hashMap.put("firstName", firstName);
        hashMap.put("lastName", lastName);
        hashMap.put("phone", phone);
        //hashMap.put("address", address); //TODO
        hashMap.put("active", active);

        return hashMap;
    }

    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.put("authorities", getAuthoritiesHashMap());
        hashMap.put("garages", getGaragesHashMap());
        hashMap.put("memberIssues", getMemberIssuesHashMap());
        hashMap.put("partnerIssues", getPartnerIssuesHashMap());
        hashMap.put("ratingGarages", getRatingGaragesHashMap());
        hashMap.put("ratingIssues", getRatingIssuesHashMap());

        return hashMap;
    }


    //@JsonProperty("authorities")
    private List<LinkedHashMap<String, Object>> getAuthoritiesHashMap() {
        return authorities != null ? authorities.stream().map(Authority::toHashMap).toList() : null;
    }

    //@JsonProperty("garages")
    private List<LinkedHashMap<String, Object>> getGaragesHashMap() {
        return garages != null ? garages.stream().map(Garage::toHashMap).toList() : null;
    }

    //@JsonProperty("memberIssues")
    private List<LinkedHashMap<String, Object>> getMemberIssuesHashMap() {
        return issueMemberDetails != null ? issueMemberDetails.stream().map(Issue::toHashMap).toList() : null;
    }

    //@JsonProperty("partnerIssues")
    private List<LinkedHashMap<String, Object>> getPartnerIssuesHashMap() {
        return issuePartnerDetails != null ? issuePartnerDetails.stream().map(Issue::toHashMap).toList() : null;
    }

    //@JsonProperty("ratingGarages")
    private List<LinkedHashMap<String, Object>> getRatingGaragesHashMap() {
        return ratingGarages != null ? ratingGarages.stream().map(RatingGarage::toHashMap).toList() : null;
    }

    //@JsonProperty("ratingIssues")
    private List<LinkedHashMap<String, Object>> getRatingIssuesHashMap() {
        return ratingIssues != null ? ratingIssues.stream().map(RatingIssues::toHashMap).toList() : null;
    }

    //endregion

}
