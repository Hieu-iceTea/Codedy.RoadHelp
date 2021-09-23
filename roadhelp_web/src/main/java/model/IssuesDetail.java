package model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "issues_details")
public class IssuesDetail extends BaseModel {

    @NotNull
    @Size(min = 2, max = 64)
    private String user_id;

    @NotNull
    @Size(min = 2, max = 64)
    private String commune;

    // - - - - -
    private Date emailVerifiedAt;
    private String verificationCode;
    private String resetPasswordCode;
    private String rememberToken;


    // - - - - -
    @Size(max = 128)
    private String longitude;

    @Size(min = 2, max = 64)
    private String latitude;

    @Size( max = 10)
    private String phone;

    @Size(max = 200)
    private String address;

    @Size(min = 2, max = 16)
    private String note_list_id;

    @Size(min = 2, max = 500)
    private String description;

    @ManyToOne
    @JoinColumn(name = "note_list") //updatable = false, insertable = false
    private NoteList noteLists;

    public String getUser_id() {
        return user_id;
    }

    public String getCommune() {
        return commune;
    }

    public Date getEmailVerifiedAt() {
        return emailVerifiedAt;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public String getResetPasswordCode() {
        return resetPasswordCode;
    }

    public String getRememberToken() {
        return rememberToken;
    }

    public String getLongitude() {
        return longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getNote_list_id() {
        return note_list_id;
    }

    public String getDescription() {
        return description;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public void setEmailVerifiedAt(Date emailVerifiedAt) {
        this.emailVerifiedAt = emailVerifiedAt;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public void setResetPasswordCode(String resetPasswordCode) {
        this.resetPasswordCode = resetPasswordCode;
    }

    public void setRememberToken(String rememberToken) {
        this.rememberToken = rememberToken;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setNote_list_id(String note_list_id) {
        this.note_list_id = note_list_id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "IssuesDetail{" +
                "user_id='" + user_id + '\'' +
                ", commune='" + commune + '\'' +
                ", emailVerifiedAt=" + emailVerifiedAt +
                ", verificationCode='" + verificationCode + '\'' +
                ", resetPasswordCode='" + resetPasswordCode + '\'' +
                ", rememberToken='" + rememberToken + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", note_list_id='" + note_list_id + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    // - - - - -
    //endregion
}
