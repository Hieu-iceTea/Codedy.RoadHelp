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

    public List<IssuesDetail> getIssuesDetails() {
        return issuesDetails;
    }

    public void setIssuesDetails(List<IssuesDetail> issuesDetails) {
        this.issuesDetails = issuesDetails;
    }

    @OneToMany(mappedBy = "noteList")
    private List<IssuesDetail> issuesDetails;

    //endregion


    //region - Getter & Setter -
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        return "NoteList{" +
                "description='" + description + '\'' +
                ", issuesDetail=" + issuesDetails +
                '}';
    }

    //endregion

}
