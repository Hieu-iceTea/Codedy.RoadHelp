package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "note_list")
public class NoteList extends BaseModel {

    //region - Define Fields -
    private String description;
    //endregion


    //region - Relationship -

    @OneToOne(mappedBy = "noteList")
    private IssuesDetail issuesDetail;

    //endregion


    //region - Getter & Setter -
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public IssuesDetail getIssuesDetail() {
        return issuesDetail;
    }

    public void setIssuesDetail(IssuesDetail issuesDetail) {
        this.issuesDetail = issuesDetail;
    }

    @Override
    public String toString() {
        return "NoteList{" +
                "description='" + description + '\'' +
                ", issuesDetail=" + issuesDetail +
                '}';
    }

    //endregion

}
