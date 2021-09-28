package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "garage")
public class Garage extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    @Size(min = 2, max = 64)
    private String username;

    @NotNull
    @Email
    @Size(min = 2, max = 64)
    private String email;

    //@NotNull
    //@Size(min = 2, max = 128)
    private String password;

    // - - - - -
    private Date emailVerifiedAt;
    private String verificationCode;
    private String resetPasswordCode;
    private String rememberToken;

    // - - - - -
    @Size(max = 128)
    private String image;

    @Size(min = 2, max = 64)
    private String rate;

    @Size(min = 2, max = 64)
    private String address;

    @Size(min = 2, max = 16)
    private String phone;

    @Size(min = 2, max = 128)
    private String commune;

    @Size(max = 64)
    private String longitude;

    @Size(max = 64)
    private String latitude;

    @Size(min = 2, max = 500)
    private String description;

    // - - - - -
    @NotNull
    private Boolean active;
    //endregion


    //region - Relationship -
    /*@ManyToOne
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private Partner partner;

    @OneToMany(mappedBy = "ratings") //updatable = false, insertable = false
    private List<RatingGarage> NoteLists;*/
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

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
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

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
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

    /*public Partner getPartner() {
        return partner;
    }

    public void setPartner(Partner partner) {
        this.partner = partner;
    }

    public List<RatingGarage> getNoteLists() {
        return NoteLists;
    }

    public void setNoteLists(List<RatingGarage> noteLists) {
        NoteLists = noteLists;
    }*/
    //endregion

}
