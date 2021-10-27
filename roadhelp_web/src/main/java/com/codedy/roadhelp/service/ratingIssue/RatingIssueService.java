package com.codedy.roadhelp.service.ratingIssue;


import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.service.base.BaseService;

public interface RatingIssueService extends BaseService<RatingIssue, Integer> {

    //Xem đánh giá sau khi hỗ trợ xong: lấy RatingIssue theo issueId
    RatingIssue findByIssueId(int issueId);

    @Override
    RatingIssue save(RatingIssue item);

}
