package com.codedy.roadhelp.service.ratingPartner;


import com.codedy.roadhelp.model.RatingPartner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.RatingPartnerRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


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
