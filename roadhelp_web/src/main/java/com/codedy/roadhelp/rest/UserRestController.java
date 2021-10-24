package com.codedy.roadhelp.rest;


import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.payload.response.MessageResponse;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;


@RestController
@RequestMapping(path = "/api/v1/users")
public class UserRestController {

    //TODO: Sửa lỗi vòng lặp đệ quy khi xử lý JSON, lý do relationship giữa các bảng.

    //region - Autowired Service -
    @Autowired
    private UserService userService;
    //endregion


    //region - Display -
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {

        return userService.findAll().stream().map(User::toApiResponse).toList();

    }

    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {

        User user = userService.findById(id);

        if (user == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        return user.toApiResponse();

    }
    //endregion


    //region - Create -
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody User user) {

        user.setId(0);

        User newUser = userService.save(user);

        return userService.findById(newUser.getId()).toApiResponse();

    }
    //endregion


    //region - Edit -
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody User user, @PathVariable int id) {

        if (userService.findById(id) == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        user.setId(id);

        userService.save(user);

        return userService.findById(user.getId()).toApiResponse();

    }
    //endregion


    //region - Delete -
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {

        if (userService.findById(id) == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        // 02. Xóa bản ghi database
        userService.deleteById(id);

        return "Deleted user id - " + id;

    }
    //endregion

    //region - Change Password -
    @PutMapping(path = {"/my-account/{id}/change-password", "/my-account/{id}/change-password/"})
    public ResponseEntity<?> changePassword(@Valid @RequestBody HashMap<String, String> requestBody, @PathVariable int id) {
        User user = userService.findById(id);
        String password = requestBody.get("password");
        user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));

        userService.save(user);
        return ResponseEntity.ok(new MessageResponse("Change password successfully!"));
    }
    //endregion
}
