package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Authority;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
import com.codedy.roadhelp.service.authority.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/authorities")
public class AuthorityRestController {

    //region - Autowired Service -
    @Autowired
    private AuthorityService authorityService;
    //endregion


    //region - Base -
    // List All
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return authorityService.findAll().stream().map(Authority::toApiResponse).toList();
    }

    // Detail
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Authority authority = authorityService.findById(id);

        if (authority == null) {
            throw new RestNotFoundException("Authority id not found - " + id);
        }

        return authority.toApiResponse();
    }

    // Create
    @PostMapping(path = {"", "/"})
    public LinkedHashMap<String, Object> store(@RequestBody Authority authority) {
        authority.setId(0);
        return authorityService.save(authority).toApiResponse();
    }

    // Update
    @PutMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> update(@RequestBody Authority authority, @PathVariable int id) {

        if (!authorityService.existsById(id)) {
            throw new RestNotFoundException("Authority id not found - " + id);
        }

        authority.setId(id);

        return authorityService.save(authority).toApiResponse();
    }

    // Delete
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (!authorityService.existsById(id)) {
            throw new RestNotFoundException("Authority id not found - " + id);
        }

        authorityService.deleteById(id);

        return "Deleted authorityService id - " + id;
    }
    //endregion

}
