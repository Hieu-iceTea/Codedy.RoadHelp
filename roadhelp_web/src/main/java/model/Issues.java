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

    public String getIssues_detail_id() {
        return issues_detail_id;
    }

    public void setIssues_detail_id(String issues_detail_id) {
        this.issues_detail_id = issues_detail_id;
    }

    public String getTotal_issue() {
        return total_issue;
    }

    public void setTotal_issue(String total_issue) {
        this.total_issue = total_issue;
    }

    public IssuesDetail getIssues_details() {
        return issues_details;
    }

    public void setIssues_details(IssuesDetail issues_details) {
        this.issues_details = issues_details;
    }
}
