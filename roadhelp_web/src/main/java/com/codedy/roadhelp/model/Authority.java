package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.LinkedHashMap;

@Entity
@Table(name = "authorities")
//@JsonIdentityInfo(scope = Authority.class, generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
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
    protected LinkedHashMap<String, Object> toHashMap() {
        LinkedHashMap<String, Object> hashMap = super.toHashMap();

        hashMap.put("username", user.getUsername());
        hashMap.put("authority", authority);

        return hashMap;
    }

    /**
     * Hàm này trả về định dạng hiển thị dữ liệu API cho entity này.<br/><br/>
     * <p>
     * Viết bởi: Hiếu iceTea<br/>
     * Ngày: 24-10-2021<br/>
     * Thời gian: 10:15<br/>
     *
     * @return
     */
    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.remove("username");

        hashMap.put("user", getUserHashMap());
        hashMap.put("authority", authority);

        return hashMap;
    }

    //@JsonProperty("user")
    private LinkedHashMap<String, Object> getUserHashMap() {
        return user != null ? user.toHashMap() : null;
    }
    //endregion

}
