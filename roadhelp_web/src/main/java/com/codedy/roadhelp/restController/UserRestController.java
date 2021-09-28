package com.codedy.roadhelp.restController;


import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

        return userService.save(user);

    }
    //endregion


    //region - Edit -
    @PutMapping(path = {"/{id}", "/{id}/"})
    public User update(@RequestBody User user) {

        return userService.save(user);

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

}
