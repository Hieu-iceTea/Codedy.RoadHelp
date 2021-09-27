package service.issues;


import model.Issues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.IssuesRepository;
import service.base.BaseServiceImplement;


@Service
public class IssuesServiceImplement extends BaseServiceImplement<Issues, Integer> implements IssuesService {

    //region Initialization - Autowired
    @Autowired
    private IssuesRepository issuesRepository;

    public IssuesServiceImplement(IssuesRepository repository) {
        super(repository);
    }
    //endregion

}
