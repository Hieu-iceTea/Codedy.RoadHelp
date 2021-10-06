package com.codedy.roadhelp.service.partner;


import com.codedy.roadhelp.model.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.PartnerRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


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
