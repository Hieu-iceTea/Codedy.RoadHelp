package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "issues")
public class Issues extends BaseModel implements Serializable {

    //region - Define Fields -

    private int total_issue;
    //endregion


    //region - Relationship -

    @ManyToOne
    @JoinColumn(name = "issues_id")
    private IssuesDetail issuesDetail;

    //endregion


    //region - Getter & Setter -

    public int getTotal_issue() {
        return total_issue;
    }

    public void setTotal_issue(int total_issue) {
        this.total_issue = total_issue;
    }

    public IssuesDetail getIssuesDetail() {
        return issuesDetail;
    }

    public void setIssuesDetail(IssuesDetail issuesDetail) {
        this.issuesDetail = issuesDetail;
    }

    @Override
    public String toString() {
        return "Issues{" +
                "total_issue='" + total_issue + '\'' +
                ", issuesDetail=" + issuesDetail +
                '}';
    }

    //endregion
}

