package model;

import javax.persistence.Entity;
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


}
