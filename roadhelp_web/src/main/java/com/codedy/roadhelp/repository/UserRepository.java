package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.User;

import java.util.Optional;

public interface UserRepository extends BaseRepository<User, Integer>{
    Optional<User> findByUsername(String username);
}
