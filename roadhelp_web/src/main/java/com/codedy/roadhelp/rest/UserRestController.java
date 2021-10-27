package com.codedy.roadhelp.rest;


import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.payload.response.MessageResponse;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;


@RestController
@RequestMapping(path = "/api/v1/users")
public class UserRestController {

    //region - Autowired Service -
    @Autowired
    private UserService userService;
    //endregion


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
    // Change Password
    @PutMapping(path = {"/my-account/{id}/change-password", "/my-account/{id}/change-password/"})
    public ResponseEntity<?> changePassword(@Valid @RequestBody HashMap<String, String> requestBody, @PathVariable int id) {

        User user = userService.findById(id);
        String password = requestBody.get("password");
        String oldPassword = requestBody.get("oldpassword");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String dbPassword = user.getPassword();

        if (passwordEncoder.matches(oldPassword, dbPassword)) {
            user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
            userService.save(user);
            return ResponseEntity.ok(new MessageResponse("Change password successfully!"));
        } else {
            return ResponseEntity.ok(new MessageResponse("Your old password is wrong"));
        }
    }
    //endregion

}
