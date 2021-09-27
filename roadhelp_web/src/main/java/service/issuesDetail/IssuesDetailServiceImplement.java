package service.issuesDetail;


import model.IssuesDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.IssuesDetailRepository;
import service.base.BaseServiceImplement;


@Service
public class IssuesDetailServiceImplement extends BaseServiceImplement<IssuesDetail, Integer> implements IssuesDetailService {

    //region Initialization - Autowired
    @Autowired
    private IssuesDetailRepository issuesDetailRepository;

    public IssuesDetailServiceImplement(IssuesDetailRepository repository) {
        super(repository);
    }
    //endregion

}
