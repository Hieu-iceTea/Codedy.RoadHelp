package com.codedy.roadhelp.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

@NoRepositoryBean
public interface BaseRepository<T, ID> extends CrudRepository<T, ID> {

    List<T> findAll();

    List<T> findAllByOrderByIdDesc();

    //T findById(ID var1);
}
