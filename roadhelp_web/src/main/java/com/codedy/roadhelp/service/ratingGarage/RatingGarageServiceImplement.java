package com.codedy.roadhelp.service.ratingGarage;


import com.codedy.roadhelp.model.RatingGarage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.RatingGarageRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


@Service
public class RatingGarageServiceImplement extends BaseServiceImplement<RatingGarage, Integer> implements RatingGarageService {

    //region Initialization - Autowired
    @Autowired
    private RatingGarageRepository ratingGarageRepository;

    public RatingGarageServiceImplement(RatingGarageRepository repository) {
        super(repository);
    }
    //endregion

}