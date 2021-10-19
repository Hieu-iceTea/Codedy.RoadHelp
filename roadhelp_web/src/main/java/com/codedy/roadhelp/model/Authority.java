package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "authorities")
public class Authority extends BaseModel implements Serializable {

    //region - Define Fields -
    private String authority;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "username", referencedColumnName = "username")
    private User user;
    //endregion


    //region - Getter & Setter -
    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    //endregion


    @Override
    public String toString() {
        return "Authority{" +
                "authority='" + authority + '\'' +
                ", user=" + user +
                '}';
    }

}
