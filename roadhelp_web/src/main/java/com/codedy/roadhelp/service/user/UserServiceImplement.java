package com.codedy.roadhelp.service.user;


import com.codedy.roadhelp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.UserRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;


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
