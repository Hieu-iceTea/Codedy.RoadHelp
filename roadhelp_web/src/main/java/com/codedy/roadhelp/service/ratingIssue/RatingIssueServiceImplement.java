package com.codedy.roadhelp.service.ratingIssue;


import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.repository.RatingIssueRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class RatingIssueServiceImplement extends BaseServiceImplement<RatingIssue, Integer> implements RatingIssueService {

    //region Initialization - Autowired
    @Autowired
    private RatingIssueRepository ratingIssueRepository;

    public RatingIssueServiceImplement(RatingIssueRepository repository) {
        super(repository);
    }
    //endregion

    @Override
    public RatingIssue findByIssueId(int issueId) {
        return ratingIssueRepository.findByIssueId(issueId);
    }

    @Override
    @Transactional
    public RatingIssue save(RatingIssue item) {
        RatingIssue ratingIssue = super.save(item);

        //this.updateUserPartnerRateAvg(item.getIssue().getId()); //TODO: chờ cập nhật hàm này để sử dụng

        return ratingIssue;
    }

    /*private void updateUserPartnerRateAvg(int userPartnerId) {
        List<RatingIssue> ratingIssues = ratingIssueRepository.findAllByUserPartnerId(userPartnerId); //TODO: cái này phải là UserPartnerId -> chưa dùng được, sẽ sửa sau

        int totalRatePoint = ratingIssues.stream()
                .map(RatingIssue::getRatePoint)
                .reduce(Integer::sum)
                .orElse(0);

        double rateAvg = ((double) totalRatePoint) / ratingIssues.size();

        User user = userService.findById(userPartnerId);
        user.setRateAvg(Common.round(rateAvg, 1)); //Làm tròn

        userService.save(user);
    }*/

}
