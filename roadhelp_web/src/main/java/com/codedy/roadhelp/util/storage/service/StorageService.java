package com.codedy.roadhelp.util.storage.service;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

    String store(MultipartFile file, String path);

    void delete(String fileName, String path);

}