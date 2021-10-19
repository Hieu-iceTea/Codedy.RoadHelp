package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import org.hibernate.loader.custom.CustomLoader;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "authorities")

public class Authority extends BaseModel implements Serializable {
//
//    @Column(name = "username")
//    private String username;

    private String authority;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "username",referencedColumnName = "username")
    private User user;
    //endregion

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }


    @Override
    public String toString() {
        return "Authority{" +
                ", authority='" + authority + '\'' +
                ", user=" + user +
                '}';
    }
}
