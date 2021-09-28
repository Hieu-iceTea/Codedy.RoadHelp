package com.codedy.roadhelp.service.admin;


import com.codedy.roadhelp.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.AdminRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


@Service
public class AdminServiceImplement extends BaseServiceImplement<Admin, Integer> implements AdminService {

    //region Initialization - Autowired
    @Autowired
    private AdminRepository adminRepository;

    public AdminServiceImplement(AdminRepository repository) {
        super(repository);
    }
    //endregion

}