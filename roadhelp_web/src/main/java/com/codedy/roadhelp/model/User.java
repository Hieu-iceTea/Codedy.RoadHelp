package com.codedy.roadhelp.model;

import com.codedy.roadhelp.model.enums.UserGender;
import com.fasterxml.jackson.annotation.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "users")
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
public class User extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    @Size(min = 6, max = 64)
    @Column(name = "username")
    private String username;

    @Email
    @Size(max = 128)
    private String email;

    @Size(min = 10)
    private String phone;

    @Size(min = 8)
    private String password;

    @Size(min = 2, max = 64)
    private String firstName;

    @Size(min = 2, max = 64)
    private String lastName;

    @Size(max = 128)
    private String image;

    private UserGender gender;

    @NotNull
    private Boolean active;
    //endregion


    //region - Relationship -
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    @JsonBackReference(value = "authorities")
    private List<Authority> authorities;

    @OneToMany(mappedBy = "userPartner")
    @JsonBackReference(value = "issuesPartnerDetails")
    private List<Issues> issuesPartnerDetails;

    @OneToMany(mappedBy = "userMember")
    @JsonBackReference(value = "issuesMemberDetails")
    private List<Issues> issuesMemberDetails;

    @OneToMany(mappedBy = "userPartner", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "garages")
    private List<Garage> garages;

    @OneToMany(mappedBy = "userMember")
    @JsonBackReference(value = "ratingGarages")
    private List<RatingGarage> ratingGarages;

    @OneToMany(mappedBy = "userMember")
    @JsonBackReference(value = "ratingIssues")
    private List<RatingIssues> ratingIssues;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public List<Issues> getIssuesPartnerDetails() {
        return issuesPartnerDetails;
    }

    public void setIssuesPartnerDetails(List<Issues> issuesPartnerDetails) {
        this.issuesPartnerDetails = issuesPartnerDetails;
    }

    public List<Issues> getIssuesMemberDetails() {
        return issuesMemberDetails;
    }

    public void setIssuesMemberDetails(List<Issues> issuesMemberDetails) {
        this.issuesMemberDetails = issuesMemberDetails;
    }

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }

    public List<RatingGarage> getRatingGarages() {
        return ratingGarages;
    }

    public void setRatingGarages(List<RatingGarage> ratingGarages) {
        this.ratingGarages = ratingGarages;
    }

    public List<RatingIssues> getRatingIssues() {
        return ratingIssues;
    }

    public void setRatingIssues(List<RatingIssues> ratingIssues) {
        this.ratingIssues = ratingIssues;
    }
    //endregion


    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", image='" + image + '\'' +
                ", gender=" + gender +
                ", active=" + active +
                ", authorities=" + authorities +
                ", issuesPartnerDetails=" + issuesPartnerDetails +
                ", issuesMemberDetails=" + issuesMemberDetails +
                ", garages=" + garages +
                ", ratingGarages=" + ratingGarages +
                ", ratingIssues=" + ratingIssues +
                '}';
    }

}
