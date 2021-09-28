package com.codedy.roadhelp.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "note_list")
public class NoteList extends BaseModel {

    //region - Define Fields -
    @Size(min = 2, max = 64)
    private String description;
    //endregion


    //region - Relationship -
//    @OneToMany(mappedBy = "note_list") //updatable = false, insertable = false
//    private List<IssuesDetail> issuesDetails;

    //endregion


    //region - Getter & Setter -
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public List<IssuesDetail> getIssuesDetails() {
//        return issuesDetails;
//    }
//
//    public void setIssuesDetails(List<IssuesDetail> issuesDetails) {
//        this.issuesDetails = issuesDetails;
//    }

    //endregion

}
