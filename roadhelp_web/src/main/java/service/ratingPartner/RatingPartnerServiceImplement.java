package service.ratingPartner;


import model.RatingPartner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.RatingPartnerRepository;
import service.base.BaseServiceImplement;


@Service
public class RatingPartnerServiceImplement extends BaseServiceImplement<RatingPartner, Integer> implements RatingPartnerService {

    //region Initialization - Autowired
    @Autowired
    private RatingPartnerRepository ratingPartnerRepository;

    public RatingPartnerServiceImplement(RatingPartnerRepository repository) {
        super(repository);
    }
    //endregion

}
