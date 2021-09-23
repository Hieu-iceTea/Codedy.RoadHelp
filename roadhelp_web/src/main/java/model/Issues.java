package model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "issues")
public class Issues extends BaseModel implements Serializable{

    @Size(min = 2, max = 64)
    private String issues_detail_id;

    @Size(min = 2, max = 64)
    private String total_issue;

    @ManyToOne
    @JoinColumn(name = "issues_detail") //updatable = false, insertable = false
    private IssuesDetail issues_details;
}
