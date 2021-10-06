package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.NoteList;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.noteList.NoteListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/notelist")
public class NoteListRestController {

    @Autowired
    private NoteListService noteListService;

    // List Note List
    @GetMapping(path = {"", "/", "/index"})
    public List<NoteList> index() {
        return noteListService.findAll();
    }

    // Detail Note List
    @GetMapping(path = {"/{id}", "/{id}/"})
    public NoteList show(@PathVariable int id) {
        NoteList noteList = noteListService.findById(id);
        if (noteList == null) {
            throw new RestNotFoundException("Note list id not found - " + id);
        }
        return noteList;
    }

    // Create Not List
    @PostMapping(path = {"", "/"})
    public NoteList store(@RequestBody NoteList noteList) {
        noteList.setId(0);
        NoteList newNoteList = noteListService.save(noteList);
        return noteListService.findById(newNoteList.getId());
    }

    // Update Note List
    @PutMapping(path = {"/{id}", "/{id}/"})
    public NoteList update(@RequestBody NoteList noteList, @PathVariable int id) {

        if (noteListService.findById(id) == null) {
            throw new RestNotFoundException("Note list id not found - " + id);
        }

        noteList.setId(0);
        noteListService.save(noteList);
        return noteListService.findById(noteList.getId());
    }

    // Delete Note List
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (noteListService.findById(id) == null) {
            throw new RestNotFoundException("Note list id not found - " + id);
        }

        noteListService.deleteById(id);
        return "Deleted note list id - " + id;
    }
}
