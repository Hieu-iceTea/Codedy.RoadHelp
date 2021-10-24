package com.codedy.roadhelp.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.LinkedHashMap;

@Entity
@Table(name = "garageimage")
//@JsonIdentityInfo(
//        scope = GarageImage.class,
//        generator = ObjectIdGenerators.PropertyGenerator.class,
//        property = "id")
public class GarageImage extends BaseModel implements Serializable {

    @Size(max = 256)
    private String image;
    //region - Relationship -
    @ManyToOne
    @JoinColumn(name = "garage_id") //updatable = false, insertable = false
    /*@JsonIdentityInfo(
            scope = Garage.class,
            generator = ObjectIdGenerators.PropertyGenerator.class,
            property = "id")*/
    private Garage garage;
    //endregion

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

        hashMap.put("image", image);

        return hashMap;
    }

    public LinkedHashMap<String, Object> toApiResponse() {
        LinkedHashMap<String, Object> hashMap = this.toHashMap();

        hashMap.remove("garageId");

        hashMap.put("garage", getGarageHashMap());

        return hashMap;
    }

    //@JsonProperty("garage")
    private LinkedHashMap<String, Object> getGarageHashMap() {
        return garage != null ? garage.toHashMap() : null;
    }
    //endregion

}
