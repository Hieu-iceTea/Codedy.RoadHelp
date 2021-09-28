package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "issues_detail")
public class IssuesDetail extends BaseModel {

    //region - Define Fields -
    @NotNull
    @Size(min = 2, max = 64)
    private int userId;

    @NotNull
    @Size(min = 2, max = 64)
    private String commune;

    // - - - - -

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
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "userId") //updatable = false, insertable = false
    private User userIds;

//    @ManyToOne
//    @JoinColumn(name = "id") //updatable = false, insertable = false
//    private NoteList noteListsIds;
    //endregion


    //region - Getter & Setter -


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public User getUserIds() {
        return userIds;
    }

    public void setUserIds(User userIds) {
        this.userIds = userIds;
    }

//    public NoteList getNoteListsIds() {
//        return noteListsIds;
//    }
//
//    public void setNoteListsIds(NoteList noteListsIds) {
//        this.noteListsIds = noteListsIds;
//    }
    //endregion

}
