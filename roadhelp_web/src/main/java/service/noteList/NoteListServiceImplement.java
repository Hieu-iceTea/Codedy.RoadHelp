package service.noteList;


import model.NoteList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.NoteListRepository;
import service.base.BaseServiceImplement;


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
