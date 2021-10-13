package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "partner")
public class Partner extends BaseModel implements Serializable {

    //region - Define Fields -
    //private int restaurantId; //Foreign key - Relationship

    // - - - - -
    @NotNull
    @Size(min = 2, max = 64)
    private String username;

    @NotNull
    @Email
    @Size(min = 2, max = 64)
    private String email;

    @Size(max = 128)
    private String password;

    // - - - - -
    private Date emailVerifiedAt;
    private String verificationCode;
    private String resetPasswordCode;
    private String rememberToken;


    // - - - - -
    @Size(max = 128)
    private String image;

    private Boolean gender;

    @Size(min = 2, max = 64)
    private String firstName;

    @Size(min = 2, max = 64)
    private String lastName;

    @Size(min = 2, max = 16)
    private String phone;

    private double rateAvg;

    @NotNull
    private Boolean active;
    //endregion


    //region - Relationship -
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "partner", cascade= {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    private List<Garage> garages;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "partner", cascade= {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    private List<RatingPartner> ratingPartners;

    public List<IssuesDetail> getIssuesDetails() {
        return issuesDetails;
    }

    public void setIssuesDetails(List<IssuesDetail> issuesDetails) {
        this.issuesDetails = issuesDetails;
    }

    @OneToMany(mappedBy="partner")
    private List<IssuesDetail> issuesDetails;


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

    public Date getEmailVerifiedAt() {
        return emailVerifiedAt;
    }

    public void setEmailVerifiedAt(Date emailVerifiedAt) {
        this.emailVerifiedAt = emailVerifiedAt;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getResetPasswordCode() {
        return resetPasswordCode;
    }

    public void setResetPasswordCode(String resetPasswordCode) {
        this.resetPasswordCode = resetPasswordCode;
    }

    public String getRememberToken() {
        return rememberToken;
    }

    public void setRememberToken(String rememberToken) {
        this.rememberToken = rememberToken;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public List<Garage> getGarages() {
        return garages;
    }

    public void setGarages(List<Garage> garages) {
        this.garages = garages;
    }

    public List<RatingPartner> getRatingPartners() {
        return ratingPartners;
    }

    public void setRatingPartners(List<RatingPartner> ratingPartners) {
        this.ratingPartners = ratingPartners;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public double getRateAvg() {
        return rateAvg;
    }

    public void setRateAvg(double rateAvg) {
        this.rateAvg = rateAvg;
    }

    @Override
    public String toString() {
        return "Partner{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", emailVerifiedAt=" + emailVerifiedAt +
                ", verificationCode='" + verificationCode + '\'' +
                ", resetPasswordCode='" + resetPasswordCode + '\'' +
                ", rememberToken='" + rememberToken + '\'' +
                ", image='" + image + '\'' +
                ", gender=" + gender +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", rateAvg=" + rateAvg +
                ", active=" + active +
                ", garages=" + garages +
                ", ratingPartners=" + ratingPartners +
                '}';
    }

    //endregion
}
