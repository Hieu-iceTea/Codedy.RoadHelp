package service.partner;


import model.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.PartnerRepository;
import service.base.BaseServiceImplement;


@Service
public class PartnerServiceImplement extends BaseServiceImplement<Partner, Integer> implements PartnerService {

    //region Initialization - Autowired
    @Autowired
    private PartnerRepository partnerRepository;

    public PartnerServiceImplement(PartnerRepository repository) {
        super(repository);
    }
    //endregion

}
