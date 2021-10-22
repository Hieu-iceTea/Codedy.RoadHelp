package com.codedy.roadhelp.repository;

import com.codedy.roadhelp.model.Garage;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GarageRepository extends BaseRepository<Garage, Integer>{
    @Query("SELECT g FROM Garage g WHERE g.name LIKE %?1%")
    public List<Garage> findByName(String name);
}
