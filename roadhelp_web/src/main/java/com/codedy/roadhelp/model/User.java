package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.UserGender;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "users")
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

    private String address;

    @Size(min = 10)
    private String phone;

    //    @NotNull
    private Boolean active;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Authority> authorities;

    @JsonIgnore
    @OneToMany(mappedBy = "userPartner", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Garage> garages;

    @JsonIgnore
    @OneToMany(mappedBy = "userMember", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Issue> memberIssues;

    @JsonIgnore
    @OneToMany(mappedBy = "userPartner", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Issue> partnerIssues;

    @JsonIgnore
    @OneToMany(mappedBy = "userMember", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<RatingGarage> ratingGarages;

    @JsonIgnore
    @OneToMany(mappedBy = "userMember", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<RatingIssue> ratingIssues;
    //endregion


    //region - Getter & Setter -
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

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public List<Authority> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List<Authority> authorities) {
        this.authorities = authorities;
    }

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }

    public List<Issue> getMemberIssues() {
        return memberIssues;
    }

    public void setMemberIssues(List<Issue> memberIssues) {
        this.memberIssues = memberIssues;
    }

    public List<Issue> getPartnerIssues() {
        return partnerIssues;
    }

    public void setPartnerIssues(List<Issue> partnerIssues) {
        this.partnerIssues = partnerIssues;
    }

    public List<RatingGarage> getRatingGarages() {
        return ratingGarages;
    }

    public void setRatingGarages(List<RatingGarage> ratingGarages) {
        this.ratingGarages = ratingGarages;
    }

    public List<RatingIssue> getRatingIssues() {
        return ratingIssues;
    }

    public void setRatingIssues(List<RatingIssue> ratingIssues) {
        this.ratingIssues = ratingIssues;
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

        hashMap.put("username", username);
        hashMap.put("email", email);
        hashMap.put("password", password);
        hashMap.put("image", image);
        hashMap.put("gender", gender);
        hashMap.put("firstName", firstName);
        hashMap.put("lastName", lastName);
        hashMap.put("phone", phone);
        hashMap.put("address", address);
        hashMap.put("active", active);

        return hashMap;
    }


    @JsonProperty("authorities")
    public List<HashMap<String, Object>> getAuthoritiesHashMap() {
        return authorities != null ? authorities.stream().map(Authority::toHashMap).toList() : null;
    }

    @JsonProperty("garages")
    public List<HashMap<String, Object>> getGaragesHashMap() {
        return garages != null ? garages.stream().map(Garage::toHashMap).toList() : null;
    }

    @JsonProperty("memberIssues")
    public List<HashMap<String, Object>> getMemberIssuesHashMap() {
        return memberIssues != null ? memberIssues.stream().map(Issue::toHashMap).toList() : null;
    }

    @JsonProperty("partnerIssues")
    public List<HashMap<String, Object>> getPartnerIssuesHashMap() {
        return partnerIssues != null ? partnerIssues.stream().map(Issue::toHashMap).toList() : null;
    }

    @JsonProperty("ratingGarages")
    public List<HashMap<String, Object>> getRatingGaragesHashMap() {
        return ratingGarages != null ? ratingGarages.stream().map(RatingGarage::toHashMap).toList() : null;
    }

    @JsonProperty("ratingIssues")
    public List<HashMap<String, Object>> getRatingIssuesHashMap() {
        return ratingIssues != null ? ratingIssues.stream().map(RatingIssue::toHashMap).toList() : null;
    }

    //endregion

}
