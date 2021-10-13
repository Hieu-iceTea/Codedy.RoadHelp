package com.codedy.roadhelp.service.issues;


import com.codedy.roadhelp.model.IssuesDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.IssuesRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


@Service
public class IssuesServiceImplement extends BaseServiceImplement<IssuesDetail, Integer> implements IssuesService {

    //region Initialization - Autowired
    @Autowired
    private IssuesRepository issuesRepository;

    public IssuesServiceImplement(IssuesRepository repository) {
        super(repository);
    }
    //endregion

}
