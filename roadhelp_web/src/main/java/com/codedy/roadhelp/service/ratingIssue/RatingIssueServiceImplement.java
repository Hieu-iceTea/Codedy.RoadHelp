package com.codedy.roadhelp.service.ratingIssue;


import com.codedy.roadhelp.model.RatingIssue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.RatingIssueRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


@Service
public class RatingIssueServiceImplement extends BaseServiceImplement<RatingIssue, Integer> implements RatingIssueService {

    //region Initialization - Autowired
    @Autowired
    private RatingIssueRepository ratingIssueRepository;

    public RatingIssueServiceImplement(RatingIssueRepository repository) {
        super(repository);
    }
    //endregion

}
