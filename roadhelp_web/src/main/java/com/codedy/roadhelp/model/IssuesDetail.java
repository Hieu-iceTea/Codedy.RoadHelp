package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "issues_detail")
public class IssuesDetail extends BaseModel implements Serializable {

    //region - Define Fields -

    @NotNull
    @Size(min = 2, max = 64)
    private String commune;

    @Size(min = 2, max = 64)
    private String longitude;

    @Size(min = 2, max = 64)
    private String latitude;

    @Size(max = 16)
    private String phone;

    @Size(max = 128)
    private String address;

    @Size(min = 2, max = 500)
    private String description;

    private Boolean status;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User users;

    @OneToMany(mappedBy = "issuesDetail")
    private List<Issues> issues;

    @OneToOne
    @JoinColumn(name = "note_list_id")
    private NoteList noteList;
    //endregion


    //region - Getter & Setter -

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUsers() {
        return users;
    }

    public void setUserIds(User users) {
        this.users = users;
    }

    public List<Issues> getIssues() {
        return issues;
    }

    public void setIssues(List<Issues> issues) {
        this.issues = issues;
    }

    public NoteList getNoteLists() {
        return noteList;
    }

    public void setNoteLists(NoteList noteLists) {
        this.noteList = noteLists;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public NoteList getNoteList() {
        return noteList;
    }

    public void setNoteList(NoteList noteList) {
        this.noteList = noteList;
    }

    @Override
    public String toString() {
        return "IssuesDetail{" +
                "commune='" + commune + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", users=" + users +
                ", issues=" + issues +
                ", noteList=" + noteList +
                '}';
    }

    //endregion

}
