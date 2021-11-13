package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends BaseRepository<User, Integer>{
    Optional<User> findByUsername(String username);

    //Xem thông tin người giúp mình: Lấy UserPartner theo partnerIssues_id //TODO chưa biết cái nào đúng, vì chưa có dữ liệu test
    User findByPartnerIssuesId(int partnerIssues_id);
    User findUserPartnerByPartnerIssuesId(int partnerIssues_id);
    User findUserPartnerByMemberIssuesId(int memberIssues_id);

    // Danh sách user đang yêu cầu trở thành partner
    List<User> findAllByRequestBecomePartner(boolean requestBecomePartner);
}
