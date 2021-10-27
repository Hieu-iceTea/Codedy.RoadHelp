package com.codedy.roadhelp.service.ratingGarage;


import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.model.RatingGarage;
import com.codedy.roadhelp.repository.RatingGarageRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class RatingGarageServiceImplement extends BaseServiceImplement<RatingGarage, Integer> implements RatingGarageService {

    //region Initialization - Autowired
    @Autowired
    private RatingGarageRepository ratingGarageRepository;

    @Autowired
    private GarageService garageService;

    public RatingGarageServiceImplement(RatingGarageRepository repository) {
        super(repository);
    }

    @Override
    public List<RatingGarage> findAllByGarageId(int id) {
        return ratingGarageRepository.findAllByGarageId(id);
    }
    //endregion

    @Override
    @Transactional
    public RatingGarage save(RatingGarage item) {
        RatingGarage ratingGarage = super.save(item);

        this.updateGarageRateAvg(item.getGarage().getId());

        return ratingGarage;
    }

    private void updateGarageRateAvg(int garageId) {
        List<RatingGarage> ratingGarages = ratingGarageRepository.findAllByGarageId(garageId);

        int totalRatePoint = ratingGarages.stream()
                .map(RatingGarage::getRatePoint)
                .reduce(Integer::sum)
                .orElse(0);

        double rateAvg = ((double) totalRatePoint) / ratingGarages.size();

        Garage garage = garageService.findById(garageId);
        garage.setRateAvg(rateAvg);

        garageService.save(garage);
    }

}
