package com.codedy.roadhelp.service.ratingGarage;


import com.codedy.roadhelp.model.RatingGarage;
import com.codedy.roadhelp.service.base.BaseService;

import java.util.List;

public interface RatingGarageService extends BaseService<RatingGarage, Integer> {

    List<RatingGarage> findAllByGarageId(int id);

    @Override
    RatingGarage save(RatingGarage item);

}
