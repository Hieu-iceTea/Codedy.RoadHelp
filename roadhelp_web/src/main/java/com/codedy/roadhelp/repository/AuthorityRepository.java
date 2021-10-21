package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.Authority;
import com.codedy.roadhelp.model.GarageImage;

import java.util.Optional;

public interface AuthorityRepository extends BaseRepository<Authority, Integer>{
    Optional<Authority> findByAuthority(String authority);
}
