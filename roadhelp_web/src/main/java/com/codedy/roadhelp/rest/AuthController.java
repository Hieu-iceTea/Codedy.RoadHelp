package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Authority;
import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.payload.request.LoginRequest;
import com.codedy.roadhelp.payload.response.JwtResponse;
import com.codedy.roadhelp.payload.response.MessageResponse;
import com.codedy.roadhelp.security.jwt.JwtUtils;
import com.codedy.roadhelp.service.authority.AuthorityService;
import com.codedy.roadhelp.service.user.UserDetailsImpl;
import com.codedy.roadhelp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    AuthorityService authorityService;

    @Autowired
    UserService userService;

    @Autowired
    JwtUtils jwtUtils;

    @Value("${bezkoder.app.jwtExpirationMs}")
    private int jwtExpirationMs;

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        Date date = new Date();
        long iat = date.getTime();
        Date exp = new Date(iat + jwtExpirationMs);
        int expiresIn = jwtExpirationMs / 1000;

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<String> roles = userDetails.getAuthorities().stream()
                .map(item -> item.getAuthority())
                .collect(Collectors.toList());

        return ResponseEntity.ok(new JwtResponse(jwt,
                userDetails.getId(),
                userDetails.getUsername(),
                exp,
                expiresIn,
                roles));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody User userRequest) {
        // Create new user's account
        User user = new User();
        user.setUsername(userRequest.getUsername());
        user.setPhone(userRequest.getPhone());
        user.setEmail(userRequest.getEmail());
        user.setPassword(BCrypt.hashpw(userRequest.getPassword(), BCrypt.gensalt(12)));

        // Create new authority
        Authority authority = new Authority();
        authority.setUser(user);
        authority.setAuthority("ROLE_MEMBER");

        List<Authority> authorities = new ArrayList<>();
        authorities.add(authority);

        user.setAuthorities(authorities);

        userService.save(user);


        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    @PutMapping(path = {"/become-to-partner/{id}/setPartner", "/become-to-partner/{id}/setPartner/"})
    public ResponseEntity<?> becomeToPartner(@PathVariable int id){

        User user = userService.findById(id);
        Authority authority = user.getAuthorities().get(0);
        authority.setUser(user);
        authority.setAuthority("ROLE_PARTNER");

        List<Authority> authorities = new ArrayList<>();
        authorities.add(authority);
        authority.setId(authority.getId());
        authorityService.save(authority);
        return ResponseEntity.ok(new MessageResponse("Become to partner successfully!"));
    }
}
