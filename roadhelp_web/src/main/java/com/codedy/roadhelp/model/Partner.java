package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

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
    @NotNull
    @Size(min = 6, max = 64)
    private String username;

    @NotNull
    @Email
    private String email;

    @NotNull
    @Size(min = 8)
    private String password;
    @Size(max = 128)
    private String image;

    private Boolean gender;

    @Size(min = 2, max = 64)
    private String firstName;

    @Size(min = 2, max = 64)
    private String lastName;

    @Size(min = 10)
    private String phone;

    private double rateAvg;

    @NotNull
    private Boolean active;
    //endregion

    //region - Relationship -
    @OneToMany(mappedBy = "partner", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference("garages")
    private List<Garage> garages;

    @OneToMany(mappedBy = "partner", cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH})
    @JsonBackReference("ratingPartners")
    private List<RatingPartner> ratingPartners;

    @OneToMany(mappedBy = "partner")
    @JsonBackReference("issuesDetails")
    private List<IssuesDetail> issuesDetails;
    //endregion

    //region - Getter & Setter -
    public List<IssuesDetail> getIssuesDetails() {
        return issuesDetails;
    }

    public void setIssuesDetails(List<IssuesDetail> issuesDetails) {
        this.issuesDetails = issuesDetails;
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
