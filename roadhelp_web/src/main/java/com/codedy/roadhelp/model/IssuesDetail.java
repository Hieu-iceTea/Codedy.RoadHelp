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

    // - - - - -

    // - - - - -
    @Size(max = 64)
    private String longitude;

    @Size(min = 2, max = 64)
    private String latitude;

    @Size(max = 10)
    private String phone;

    @Size(max = 200)
    private String address;

    @Size(min = 2, max = 500)
    private String description;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User users;

    //    @OneToMany(mappedBy = "issues_detail") //updatable = false, insertable = false
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "issues_detail_id")
    private List<Issues> issues;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "note_list_id") //updatable = false, insertable = false
    private NoteList noteLists;
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
        return noteLists;
    }

    public void setNoteLists(NoteList noteLists) {
        this.noteLists = noteLists;
    }
    //endregion

}
