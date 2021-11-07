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
import com.codedy.roadhelp.util.Common;
import com.codedy.roadhelp.util.email.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

    @Qualifier("emailServiceImplement_SpringMail")
    @Autowired
    private EmailService emailService;

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

        String notification = "Login successfully!";

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
                notification,
                roles));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody User userRequest, @RequestParam(value = "autoLogin", required = false, defaultValue = "false") boolean autoLogin) {
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


        // Tự động đăng nhập
        if (autoLogin == true) {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(userRequest.getUsername(), userRequest.getPassword()));

            Date date = new Date();
            long iat = date.getTime();
            Date exp = new Date(iat + jwtExpirationMs);
            int expiresIn = jwtExpirationMs / 1000;

            String notification = "User registered successfully!";

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
                    notification,
                    roles));
        }

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));

    }

    @PostMapping(path = {"/become-to-partner/{userMemberId}", "/become-to-partner/{userMemberId}/"})
    public ResponseEntity<?> becomeToPartner(@PathVariable int userMemberId) {

        User user = userService.findById(userMemberId);

        /*List<Authority> auths = user.getAuthorities();

        String role = "ROLE_PARTNER";

        Authority authority = new Authority();

        for (var auth : auths) {
            if (!Objects.equals(auth.getAuthority(), role)) {
                authority.setUser(user);
                authority.setAuthority("ROLE_PARTNER");

                List<Authority> authorities = new ArrayList<>();
                authorities.add(authority);
                authority.setId(authority.getId());

                authorityService.save(authority);

                return ResponseEntity.ok(new MessageResponse("Become to partner successfully!"));
            }
        }*/

        String verificationPartnerCode = String.valueOf(Common.random(1000, 9999));

        // 01. Cập nhật DB
        user.setVerificationPartnerCode(verificationPartnerCode);
        userService.save(user);

        // 02. Gửi mail
        Map<String, Object> mail_data = new HashMap<>() {{
            put("verificationPartnerCode", verificationPartnerCode);
        }};
        this.sendEmail_VerificationPartnerCode(user.getEmail(), mail_data);

        return ResponseEntity.ok(new MessageResponse("Become to partner successfully!"));

        //return ResponseEntity.ok(new MessageResponse("Become to partner failure!"));
    }

    private void sendEmail_VerificationPartnerCode(String toEmail, Map<String, Object> mailData) {

        toEmail = "DinhHieu8896@gmail.com"; //Test Only

        // Cách 1. Gửi mail đơn giản:
        emailService.sendSimpleMessage(toEmail, "Thông báo mã xác minh trở thành đối tác", "Mã xác minh của bạn là: " + mailData.get("verificationPartnerCode"));

    }

}
