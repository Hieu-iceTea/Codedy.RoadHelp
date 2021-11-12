package com.codedy.roadhelp.rest;


import com.codedy.roadhelp.model.RatingGarage;
import com.codedy.roadhelp.model.RatingIssue;
import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.payload.response.MessageResponse;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.ratingIssue.RatingIssueService;
import com.codedy.roadhelp.service.user.UserService;
import com.codedy.roadhelp.util.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;


@RestController
@RequestMapping(path = "/api/v1/users")
public class UserRestController {

    private final String _path = "src/main/resources/static/" + "data-images/user";


    //region - Autowired Service -
    @Autowired
    private UserService userService;

    @Autowired
    private StorageService storageService;
    //endregion
    @Autowired
    private RatingIssueService ratingIssueService;


    //region - Base -
    // List
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {

        return userService.findAll().stream().map(User::toApiResponse).toList();

    }

    // Details
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {

        User user = userService.findById(id);

        if (user == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        return user.toApiResponse();

    }
    // Partner Xem tất cả đánh giá về mình
    @GetMapping(path = {"/user/{id}/ratingIssue", "/user/{id}/ratingIssue/"})
    public List<LinkedHashMap<String, Object>> rating(@PathVariable int id) {

        User user = userService.findById(id);
        if (user == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        return user.getRatingIssues().stream().map(RatingIssue::toApiResponse).toList();

    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody User user) {

        user.setId(0);

        return userService.save(user).toApiResponse();

    }

    // update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody User user, @PathVariable int id) {

        if (!userService.existsById(id)) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        user.setId(id);

        return userService.save(user).toApiResponse();

    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {

        if (!userService.existsById(id)) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        userService.deleteById(id);

        return "Deleted user id - " + id;

    }
    //endregion


    //region - Extend -
    // Update Avatar
    @PutMapping(path = {"/{id}/update-avatar", "/{id}/update-avatar/"})
    public LinkedHashMap<String, Object> updateAvatar(@PathVariable int id, @RequestParam MultipartFile imageFile) {
        User user = userService.findById(id);

        if (user == null) {
            throw new RestNotFoundException("User id not found - " + id);
        }

        //Xử lý file
        if (!imageFile.isEmpty()) {
            // 01. Xóa file cũ nếu có:
            if (user.getImage() != null) {
                storageService.delete(user.getImage(), _path);
            }

            // 02. Lưu file mới:
            String fileName = storageService.store(imageFile, _path);
            user.setImage(fileName);
        }

        return this.update(user, id);
    }

    // Change Password
    @PutMapping(path = {"/{id}/change-password", "/{id}/change-password/"})
    public ResponseEntity<?> changePassword(@Valid @RequestBody HashMap<String, String> requestBody, @PathVariable int id) {
        User user = userService.findById(id);

        if (user == null) {
            throw new RestNotFoundException("User id not found - " + id);
        }

        String newPassword = requestBody.get("password");
        String oldPassword = requestBody.get("oldPassword");
        String dbPassword = user.getPassword();

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (!passwordEncoder.matches(oldPassword, dbPassword)) {
            return ResponseEntity.ok(new MessageResponse("Your old password is wrong"));
        }

        user.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt(12)));
        userService.save(user);

        return ResponseEntity.ok(new MessageResponse("Change password successfully!"));
    }
    //endregion

}
