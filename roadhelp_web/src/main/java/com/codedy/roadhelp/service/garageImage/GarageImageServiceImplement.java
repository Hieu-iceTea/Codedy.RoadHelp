package com.codedy.roadhelp.service.garageImage;

import com.codedy.roadhelp.model.GarageImage;


import com.codedy.roadhelp.repository.GarageImageRepository;

import com.codedy.roadhelp.service.base.BaseServiceImplement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GarageImageServiceImplement extends BaseServiceImplement<GarageImage, Integer> implements GarageImageService {

    @Autowired
    private GarageImageRepository garageImageRepository;

    public GarageImageServiceImplement(GarageImageRepository repository) {
        super(repository);
    }
}
