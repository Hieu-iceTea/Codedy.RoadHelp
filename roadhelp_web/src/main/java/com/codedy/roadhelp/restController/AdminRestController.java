package com.codedy.roadhelp.restController;

import com.codedy.roadhelp.model.Admin;
import com.codedy.roadhelp.model.Garage;
import com.codedy.roadhelp.restController.exception.RestNotFoundException;
import com.codedy.roadhelp.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/garages")
public class AdminRestController {

    @Autowired
    private AdminService adminService;

    // List Admin
    @GetMapping(path = {"", "/", "/index"})
    public List<Admin> index() {
        return adminService.findAll();
    }

    // Detail Admin
    @GetMapping(path = {"/{id}", "/{id}/"})
    public Admin show(@PathVariable int id) {
        Admin admin = adminService.findById(id);
        if (admin == null) {
            throw new RestNotFoundException("Admin id not found - " + id);
        }
        return admin;
    }

    // Create Admin
    @PostMapping(path = {"", "/"})
    public Admin store(@RequestBody Admin admin) {
        admin.setId(0);
        Admin newAdmin = adminService.save(admin);
        return adminService.findById(newAdmin.getId());
    }

    // Update Admin
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Admin update(@RequestBody Admin admin, @PathVariable int id) {

        if (adminService.findById(id) == null) {
            throw new RestNotFoundException("Admin id not found - " + id);
        }

        admin.setId(0);
        adminService.save(admin);
        return adminService.findById(admin.getId());
    }

    // Delete Admin
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (adminService.findById(id) == null) {
            throw new RestNotFoundException("Admin id not found - " + id);
        }

        adminService.deleteById(id);
        return "Deleted admin id - " + id;
    }
}
