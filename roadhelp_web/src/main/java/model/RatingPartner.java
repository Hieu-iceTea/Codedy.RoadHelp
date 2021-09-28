package model;


import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "ratingPartner")
public class RatingPartner extends BaseModel implements Serializable{
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;

    @ManyToOne
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private Partner partners;

    @ManyToOne
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private User users;

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

    public Partner getPartners() {
        return partners;
    }

    public void setPartners(Partner partners) {
        this.partners = partners;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }
}
