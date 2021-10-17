package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
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

    @Size(min = 8)
    private String password;
    @Size(max = 128)
    private String image;

    private int gender;

    @Size(min = 2, max = 64)
    private String firstName;

    @Size(min = 2, max = 64)
    private String lastName;

    @Size(min = 10)
    private String phone;

    @NotNull
    private Boolean active;
    //endregion

    //region - Relationship -
    @OneToMany(mappedBy = "partners", cascade = CascadeType.ALL)
    @JsonBackReference(value = "issuesPartnerDetails")
    private List<Issues> issuesPartnerDetails;

    @OneToMany(mappedBy = "members", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonBackReference(value = "issuesMemberDetails")
    private List<Issues> issuesMemberDetails;

    @OneToMany(mappedBy = "users", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "ratingGarages")
    private List<RatingGarage> ratingGarages;

    @OneToMany(mappedBy = "users", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference(value = "ratingPartners")
    private List<RatingIssue> ratingIssues;

    @OneToMany(mappedBy = "user")
    @JsonBackReference(value = "authorities")
    private List<Authority> authorities;
    //endregion

    //region - Getter & Setter -
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

    public List<RatingIssue> getRatingPartners() {
        return ratingIssues;
    }

    public void setRatingPartners(List<RatingIssue> ratingIssues) {
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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
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


    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", image='" + image + '\'' +
                ", gender=" + gender +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", active=" + active +
                ", ratingGarages=" + ratingGarages +
                ", ratingPartners=" + ratingIssues +
                '}';
    }
    //endregion
}
