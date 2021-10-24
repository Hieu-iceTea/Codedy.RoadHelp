package com.codedy.roadhelp.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.sql.Timestamp;
import java.util.HashMap;

/**
 * <b>Hieu_iceTea</b> <br><br>
 * <p>
 * Chứa các trường hệ thống, dùng chung cho tất cả các bảng <br><br>
 * <p>
 * Created at: 14:45 2021-07-04
 */
@MappedSuperclass
public class BaseModel {

    //region - Define Fields -
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    //@CreatedBy
    private String createdBy;

    //@CreatedDate
    private Timestamp createdAt;

    //@LastModifiedBy
    private String updatedBy;

    //@LastModifiedDate
    private Timestamp updatedAt;

    //@Version
    private int version;

    private Boolean deleted;
    //endregion


    //region - Getter, Setter -
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }
    //endregion

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
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("id", id);
        hashMap.put("createdAt", createdAt);
        hashMap.put("createdBy", createdBy);
        hashMap.put("updatedAt", updatedAt);
        hashMap.put("updatedBy", updatedBy);
        hashMap.put("version", version);
        hashMap.put("deleted", deleted);

        return hashMap;
    }

}
