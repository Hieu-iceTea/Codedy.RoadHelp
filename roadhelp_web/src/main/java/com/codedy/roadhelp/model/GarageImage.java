package com.codedy.roadhelp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.HashMap;

@Entity
@Table(name = "garageimage")
public class GarageImage extends BaseModel {

    //region - Define Fields -
    @Size(max = 256)
    private String image;
    //endregion


    //region - Relationship -
    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    private Garage garage;
    //endregion


    //region - Getter & Setter -
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Garage getGarage() {
        return garage;
    }

    public void setGarage(Garage garage) {
        this.garage = garage;
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

        hashMap.put("garageId", garage != null ? garage.getId() : null);

        hashMap.put("image", image);

        return hashMap;
    }

    @JsonProperty("garage")
    public HashMap<String, Object> getGarageHashMap() {
        return garage != null ? garage.toHashMap() : null;
    }
    //endregion

}
