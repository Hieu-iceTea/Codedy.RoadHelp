package com.codedy.roadhelp.service.authority;

import com.codedy.roadhelp.model.Authority;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.repository.AuthorityRepository;
import com.codedy.roadhelp.repository.GarageRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import com.codedy.roadhelp.service.garage.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorityServiceImplement extends BaseServiceImplement<Authority, Integer> implements AuthorityService {

    //region Initialization - Autowired
    @Autowired
    private AuthorityRepository authorityRepository;

    public AuthorityServiceImplement(AuthorityRepository repository) {
        super(repository);
    }
    //endregion

}
