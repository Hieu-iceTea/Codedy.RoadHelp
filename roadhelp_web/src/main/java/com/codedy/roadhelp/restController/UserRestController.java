package com.codedy.roadhelp.restController;


import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.payload.response.MessageResponse;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;


@RestController
@RequestMapping(path = "/api/v1/users")
public class UserRestController {

    @Autowired
    PasswordEncoder encoder;

    //TODO: Sửa lỗi vòng lặp đệ quy khi xử lý JSON, lý do relationship giữa các bảng.

    //region - Autowired Service -
    @Autowired
    private UserService userService;
    //endregion


    //region - Display -
    @GetMapping(path = {"", "/", "/index"})
    public List<User> index() {

        return userService.findAll();

    }

    @GetMapping(path = {"/{id}", "/{id}/"})
    public User show(@PathVariable int id) {

        User user = userService.findById(id);

        if (user == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        return user;

    }
    //endregion


    //region - Create -
    @PostMapping(path = {"", "/"})
    public User store(@RequestBody User user) {

        user.setId(0);

        User newUser = userService.save(user);

        return userService.findById(newUser.getId());

    }
    //endregion


    //region - Edit -
    @PutMapping(path = {"/{id}", "/{id}/"})
    public User update(@RequestBody User user, @PathVariable int id) {

        if (userService.findById(id) == null) {
            throw new RestNotFoundException("User id not found - " + id);
            //throw new RuntimeException("User id not found - " + id);
        }

        user.setId(id);

        userService.save(user);

        return userService.findById(user.getId());

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
    public ResponseEntity<?> changePassword(@Valid @RequestBody HashMap<String, String> requestBody, @PathVariable int id){
        User user = userService.findById(id);
        String password = requestBody.get("password");
        user.setPassword(encoder.encode(password));

        userService.save(user);
        return ResponseEntity.ok(new MessageResponse("Change password successfully!"));
    }
    //endregion
}
