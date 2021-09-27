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
    private String userId;

    @NotNull
    @Size(min = 2, max = 64)
    private String commune;

    @ManyToOne
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private User userIds;

    // - - - - -
    private Date emailVerifiedAt;
    private String verificationCode;
    private String resetPasswordCode;
    private String rememberToken;


    // - - - - -
    @Size(max = 64)
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
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private NoteList noteListsIds;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public User getUserIds() {
        return userIds;
    }

    public void setUserIds(User userIds) {
        this.userIds = userIds;
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

    public String getNote_list_id() {
        return note_list_id;
    }

    public void setNote_list_id(String note_list_id) {
        this.note_list_id = note_list_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public NoteList getNoteListsIds() {
        return noteListsIds;
    }

    public void setNoteListsIds(NoteList noteListsIds) {
        this.noteListsIds = noteListsIds;
    }

    // - - - - -
    //endregion
}
