package model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "issues")
public class Issues extends BaseModel implements Serializable{

    @Size(min = 2, max = 64)
    private String issues_detail_id;

    @Size(min = 2, max = 64)
    private String total_issue;

    @ManyToOne
    @JoinColumn(name = "id") //updatable = false, insertable = false
    private IssuesDetail issuesdetails;

    @OneToMany(mappedBy = "issues_details") //updatable = false, insertable = false
    private List<IssuesDetail> issuesDetailList;

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

    public IssuesDetail getIssuesdetails() {
        return issuesdetails;
    }

    public void setIssuesdetails(IssuesDetail issuesdetails) {
        this.issuesdetails = issuesdetails;
    }

    public List<IssuesDetail> getIssuesDetailList() {
        return issuesDetailList;
    }

    public void setIssuesDetailList(List<IssuesDetail> issuesDetailList) {
        this.issuesDetailList = issuesDetailList;
    }
}
