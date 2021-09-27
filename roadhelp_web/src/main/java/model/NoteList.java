package model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "note_lists")
public class NoteList extends BaseModel {

    @Size(min = 2, max = 64)
    private String description;

    @OneToMany(mappedBy = "note_list") //updatable = false, insertable = false
    private List<NoteList> NoteLists;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<NoteList> getNoteLists() {
        return NoteLists;
    }

    public void setNoteLists(List<NoteList> noteLists) {
        NoteLists = noteLists;
    }
}
