package com.codedy.roadhelp.service.issues;


import com.codedy.roadhelp.model.Issue;
import com.codedy.roadhelp.model.enums.IssueStatus;
import com.codedy.roadhelp.service.base.BaseService;

import java.util.List;

public interface IssuesService extends BaseService<Issue, Integer> {

    List<Issue> findIssueByStatus(IssueStatus status);
    List<Issue> findAllByUserMemberId(int userMember_id);
    List<Issue> findAllByUserPartnerId(int userPartner_id);
}
