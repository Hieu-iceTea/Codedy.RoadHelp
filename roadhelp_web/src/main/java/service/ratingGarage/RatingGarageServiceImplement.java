package service.ratingGarage;


import model.RatingGarage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.RatingGarageRepository;
import service.base.BaseServiceImplement;


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
