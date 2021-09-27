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
@Table(name = "ratings")
public class Rating extends BaseModel implements Serializable {
    @NotNull
    private int ratePoint;

    @Size(max = 256)
    private String comment;

    @ManyToOne
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private Garage garages;

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

    public Garage getGarages() {
        return garages;
    }

    public void setGarages(Garage garages) {
        this.garages = garages;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }
}