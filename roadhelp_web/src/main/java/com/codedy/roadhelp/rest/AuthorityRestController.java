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

    @Autowired
    private AuthorityService authorityService;

    // List Authority
    @GetMapping(path = {"", "/", "/index"})
    public List<LinkedHashMap<String, Object>> index() {
        return authorityService.findAll().stream().map(Authority::toApiResponse).toList();
    }

    // Detail Authority
    @GetMapping(path = {"/{id}", "/{id}/"})
    public LinkedHashMap<String, Object> show(@PathVariable int id) {
        Authority authority = authorityService.findById(id);
        if (authority == null) {
            throw new RestNotFoundException("Authority id not found - " + id);
        }
        return authority.toApiResponse();
    }

    // Create Authority
    @PostMapping(path = {"", "/"})
    public Authority store(@RequestBody Authority authority) {
        authority.setId(0);
        Authority newAuthority = authorityService.save(authority);
        return authorityService.findById(newAuthority.getId());
    }

    // Update Authority
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Authority update(@RequestBody Authority authority, @PathVariable int id) {

        if (authorityService.findById(id) == null) {
            throw new RestNotFoundException("Authority id not found - " + id);
        }

        authority.setId(id);
        authorityService.save(authority);
        return authorityService.findById(authority.getId());
    }

    // Delete Authority
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {
        if (authorityService.findById(id) == null) {
            throw new RestNotFoundException("Authority id not found - " + id);
        }

        authorityService.deleteById(id);
        return "Deleted authorityService id - " + id;
    }
}