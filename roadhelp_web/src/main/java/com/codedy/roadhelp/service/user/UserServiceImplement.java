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

import java.util.ArrayList;
import java.util.Collection;


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
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            log.error("User not found in the database");
            throw new UsernameNotFoundException("User not found in the database");
        } else {
            log.info("User found in the database: {}", username);
        }
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        user.getAuthorities().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
        });
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
    }
    //endregion


}
