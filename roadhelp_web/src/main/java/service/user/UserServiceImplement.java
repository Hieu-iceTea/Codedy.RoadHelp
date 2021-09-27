package service.user;


import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.UserRepository;
import service.base.BaseServiceImplement;


@Service
public class UserServiceImplement extends BaseServiceImplement<User, Integer> implements UserService {

    //region Initialization - Autowired
    @Autowired
    private UserRepository userRepository;

    public UserServiceImplement(UserRepository repository) {
        super(repository);
    }
    //endregion

}
