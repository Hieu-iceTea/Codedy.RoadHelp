package com.codedy.roadhelp.service.user;


import com.codedy.roadhelp.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.codedy.roadhelp.repository.UserRepository;
import com.codedy.roadhelp.service.base.BaseServiceImplement;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@Service
@Slf4j
public class UserServiceImplement extends BaseServiceImplement<User, Integer> implements UserService, UserDetailsService {

    //region Initialization - Autowired
    @Autowired
    private UserRepository userRepository;

    public UserServiceImplement(UserRepository repository) {
        super(repository);
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + username));

        return UserDetailsImpl.build(user);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    //endregion

    @Override
    public List<User> findAllByRequestBecomePartner(boolean requestBecomePartner) {
        return userRepository.findAllByRequestBecomePartner(requestBecomePartner);
    }

}
