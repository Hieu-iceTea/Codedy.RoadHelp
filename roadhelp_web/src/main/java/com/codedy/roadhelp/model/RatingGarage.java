package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.LinkedHashMap;

@Entity
@Table(name = "ratinggarage")
public class RatingGarage extends BaseModel implements Serializable {

    //region - Define Fields -
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;
    //endregion


    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    //@JsonIdentityInfo(scope = Authority.class, generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
    private Garage garage;

    @ManyToOne
    @JoinColumn(name = "user_id") //updatable = false, insertable = false
    private User userMember;
    //endregion


    //region - Getter & Setter -
    public int getRatePoint() {
        return ratePoint;
    }

    public void setRatePoint(int ratePoint) {
        this.ratePoint = ratePoint;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Garage getGarage() {
        return garage;
    }

    public void setGarage(Garage garage) {
        this.garage = garage;
    }

    public User getUserMember() {
        return userMember;
    }

    public void setUserMember(User userMember) {
        this.userMember = userMember;
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

        hashMap.put("garageId", garage != null ? garage.getId() : null);
        hashMap.put("userMemberId", userMember != null ? userMember.getId() : null);

        hashMap.put("ratePoint", ratePoint);
        hashMap.put("comment", comment);

        return hashMap;
    }

    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.remove("garageId");
        hashMap.remove("userMemberId");

        hashMap.put("garage", getGarageHashMap());
        hashMap.put("userMember", getUserMemberHashMap());

        return hashMap;
    }

    //@JsonProperty("garage")
    private LinkedHashMap<String, Object> getGarageHashMap() {
        return garage != null ? garage.toHashMap() : null;
    }

    //@JsonProperty("userMember")
    private LinkedHashMap<String, Object> getUserMemberHashMap() {
        return userMember != null ? userMember.toHashMap() : null;
    }
    //endregion

}
