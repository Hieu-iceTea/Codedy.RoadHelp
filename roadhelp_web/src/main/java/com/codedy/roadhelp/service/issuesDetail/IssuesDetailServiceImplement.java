package com.codedy.roadhelp.service.issuesDetail;


import com.codedy.roadhelp.model.IssuesDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.IssuesDetailRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


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
