package com.codedy.roadhelp.service.user;


import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.service.base.BaseService;

import java.util.List;

public interface UserService extends BaseService<User, Integer> {

    List<User> findAllByRequestBecomePartner(boolean requestBecomePartner);

}
