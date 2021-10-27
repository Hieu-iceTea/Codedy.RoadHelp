package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.RatingIssue;

public interface RatingIssueRepository extends BaseRepository<RatingIssue, Integer> {

    //Xem đánh giá sau khi hỗ trợ xong: lấy RatingIssue theo issueId
    RatingIssue findByIssueId(int issue_id);

    //Partner - Xem tất cả đánh giá về mình:
    //List<RatingIssue> findAllByUserPartnerId(int userPartner_id); //TODO: cái này phải là UserPartnerId -> chưa dùng được, sẽ sửa sau

}
