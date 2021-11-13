package com.codedy.roadhelp.service.user;


import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.service.base.BaseService;

import java.util.List;

public interface UserService extends BaseService<User, Integer> {

    User findByEmail(String email);
  
    List<User> findAllByRequestBecomePartner(boolean requestBecomePartner);

}
