package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.HashMap;

@Entity
@Table(name = "authorities")
public class Authority extends BaseModel {

    //region - Define Fields -
    private String authority;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
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


    //region - Relationship Helper -

    /**
     * Hàm này trả về cấu trúc nguyên thủy của entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 23-10-2021<br/>
     * Thời gian: 22:22<br/>
     *
     * @return
     */
    public HashMap<String, Object> toHashMap() {
        HashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("username", user.getUsername());
        hashMap.put("authority", authority);

        return hashMap;
    }

    @JsonProperty("user")
    public HashMap<String, Object> getUserHashMap() {
        return user != null ? user.toHashMap() : null;
    }
    //endregion

}
