package service.admin;


import model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.AdminRepository;
import service.base.BaseServiceImplement;


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
