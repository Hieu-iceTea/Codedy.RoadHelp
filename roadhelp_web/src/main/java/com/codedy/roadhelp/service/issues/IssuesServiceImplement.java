package com.codedy.roadhelp.service.issues;


import com.codedy.roadhelp.model.Issue;
import com.codedy.roadhelp.model.enums.IssueStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.IssueRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;

import java.util.List;


@Service
public class IssuesServiceImplement extends BaseServiceImplement<Issue, Integer> implements IssuesService {

    //region Initialization - Autowired
    @Autowired
    private IssueRepository issueRepository;

    public IssuesServiceImplement(IssueRepository repository) {
        super(repository);
    }

    @Override
    public List<Issue> findIssueByStatus(IssueStatus status) {
        return issueRepository.findIssueByStatus(status);
    }
    //endregion


    @Override
    public List<Issue> findAllByUserMemberId(int userMember_id) {
        return issueRepository.findAllByUserMemberId(userMember_id);
    }

    @Override
    public List<Issue> findAllByUserPartnerId(int userPartner_id) {
        return issueRepository.findAllByUserPartnerId(userPartner_id);
    }

}
