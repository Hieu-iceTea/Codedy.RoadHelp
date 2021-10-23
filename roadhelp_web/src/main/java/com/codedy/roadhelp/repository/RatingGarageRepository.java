package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.RatingGarage;

import java.util.List;

public interface RatingGarageRepository extends BaseRepository<RatingGarage, Integer>{

    List<RatingGarage> findAllByGarageId(int id);

}
