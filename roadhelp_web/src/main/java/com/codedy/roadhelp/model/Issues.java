package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "issues")
public class Issues extends BaseModel implements Serializable{

    //region - Define Fields -

    @Size(min = 2, max = 64)
    private String total_issue;
    //endregion


    //region - Relationship -
//    @ManyToOne
//    @JoinColumn(name = "issues_detail_id") //updatable = false, insertable = false
//    private IssuesDetail issuesDetail;

    //endregion


    //region - Getter & Setter -

    public String getTotal_issue() {
        return total_issue;
    }

    public void setTotal_issue(String total_issue) {
        this.total_issue = total_issue;
    }

//    public IssuesDetail getIssuesDetail() {
//        return issuesDetail;
//    }
//
//    public void setIssuesDetail(IssuesDetail issuesDetail) {
//        this.issuesDetail = issuesDetail;
//    }
}

    //endregion

