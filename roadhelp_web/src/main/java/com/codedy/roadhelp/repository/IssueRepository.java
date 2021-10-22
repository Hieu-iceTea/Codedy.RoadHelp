package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.Issue;
import com.codedy.roadhelp.model.enums.IssueStatus;

import java.util.List;

public interface IssueRepository extends BaseRepository<Issue, Integer>{

    List<Issue> findIssueByStatus(IssueStatus status);
}
