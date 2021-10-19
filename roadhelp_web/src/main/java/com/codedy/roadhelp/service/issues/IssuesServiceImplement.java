package com.codedy.roadhelp.service.issues;


import com.codedy.roadhelp.model.Issue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.IssueRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


@Service
public class IssuesServiceImplement extends BaseServiceImplement<Issue, Integer> implements IssuesService {

    //region Initialization - Autowired
    @Autowired
    private IssueRepository issueRepository;

    public IssuesServiceImplement(IssueRepository repository) {
        super(repository);
    }
    //endregion

}
