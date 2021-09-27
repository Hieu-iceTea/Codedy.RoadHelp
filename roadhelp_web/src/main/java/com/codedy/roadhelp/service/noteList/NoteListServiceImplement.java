package com.codedy.roadhelp.service.noteList;


import com.codedy.roadhelp.model.NoteList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.NoteListRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


@Service
public class NoteListServiceImplement extends BaseServiceImplement<NoteList, Integer> implements NoteListService {

    //region Initialization - Autowired
    @Autowired
    private NoteListRepository noteListRepository;

    public NoteListServiceImplement(NoteListRepository repository) {
        super(repository);
    }
    //endregion

}
