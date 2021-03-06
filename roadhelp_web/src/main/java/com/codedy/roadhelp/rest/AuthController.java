package com.codedy.roadhelp.rest;

import com.codedy.roadhelp.model.Authority;
import com.codedy.roadhelp.model.User;
import com.codedy.roadhelp.payload.request.LoginRequest;
import com.codedy.roadhelp.payload.response.JwtResponse;
import com.codedy.roadhelp.payload.response.MessageResponse;
import com.codedy.roadhelp.rest.exception.RestNotFoundException;
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

    //region - Autowired Service -
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
    //endregion


    //region - Config -
    @Value("${bezkoder.app.jwtExpirationMs}")
    private int jwtExpirationMs;
    //endregion


    //region - Base -
    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        Date date = new Date();
        long iat = date.getTime();
        Date exp = new Date(iat + jwtExpirationMs);
        int expiresIn = jwtExpirationMs / 1000 * 7;

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


        // T??? ?????ng ????ng nh???p
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
    //endregion


    //region - Extend -
    @PostMapping(path = {"/become-to-partner/{userMemberId}", "/become-to-partner/{userMemberId}/"})
    public ResponseEntity<?> becomeToPartner(@PathVariable int userMemberId) {

        User user = userService.findById(userMemberId);

        String verificationPartnerCode = String.valueOf(Common.random(1000, 9999));

        // 01. C???p nh???t DB
        user.setVerificationPartnerCode(verificationPartnerCode);
        userService.save(user);

        // 02. G???i mail
        Map<String, Object> mail_data = new HashMap<>() {{
            put("verificationPartnerCode", verificationPartnerCode);
        }};
        this.sendEmail_VerificationPartnerCode(user.getEmail(), mail_data);

        return ResponseEntity.ok(new MessageResponse("Successfully! Please check email and verification code"));
    }

    @PostMapping(path = {"/become-to-partner/{userMemberId}/verification/{verificationPartnerCode}", "/become-to-partner/{userMemberId}/verification/{verificationPartnerCode}/"})
    public ResponseEntity<?> becomeToPartnerVerification(@PathVariable int userMemberId, @PathVariable String verificationPartnerCode) {

        User user = userService.findById(userMemberId);

        if (!user.getVerificationPartnerCode().equals(verificationPartnerCode)) {
            throw new RuntimeException("M?? x??c th???c kh??ng kh???p.");
        }

        user.setRequestBecomePartner(true);
        user.setVerificationPartnerCode(null); //X??a m??
        userService.save(user);

        return ResponseEntity.ok(new MessageResponse("Request become partner successfully"));
    }

    @PostMapping(path = {"/confirm-become-to-partner/{userMemberId}", "/confirm-become-to-partner/{userMemberId}/"})
    public ResponseEntity<?> confirmBecomeToPartner(@PathVariable int userMemberId) {

        User user = userService.findById(userMemberId);

        if (!user.isRequestBecomePartner()) {
            throw new RuntimeException("T??i kho???n n??y kh??ng trong tr???ng th??i 'y??u c???u tr??? th??nh ?????i t??c'");
        }

        List<Authority> auths = user.getAuthorities();

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

                //C???p nh???t user
                user.setRequestBecomePartner(false);
                userService.save(user);

                // 02. G???i mail th??ng b??o admin ???? x??c nh???n n??ng c???p t??i kho???n parter:
                Map<String, Object> mail_data = new HashMap<>() {{
                    //put("key", "value");
                }};
                this.sendEmail_NotificationNewPartnerAccount(user.getEmail(), mail_data);

                return ResponseEntity.ok(new MessageResponse("Become to partner successfully!"));
            }
        }

        return ResponseEntity.ok(new MessageResponse("Become to partner failure!"));
    }

    // Danh s??ch user ??ang y??u c???u tr??? th??nh partner - Admin - L??m t???m
    @GetMapping(path = {"/userRequestBecomePartner", "/userRequestBecomePartner/"})
    public List<LinkedHashMap<String, Object>> userRequestBecomePartner() {

        return userService.findAllByRequestBecomePartner(true).stream().map(User::toApiResponse).toList();

    }
    //endregion


    private void sendEmail_VerificationPartnerCode(String toEmail, Map<String, Object> mailData) {

        //toEmail = "DinhHieu8896@gmail.com"; //Test Only

        // C??ch 1. G???i mail ????n gi???n:
        emailService.sendSimpleMessage(toEmail, "Th??ng b??o m?? x??c minh tr??? th??nh ?????i t??c", "M?? x??c minh c???a b???n l??: " + mailData.get("verificationPartnerCode"));

    }

    private void sendEmail_NotificationNewPartnerAccount(String toEmail, Map<String, Object> mailData) {

        // C??ch 1. G???i mail ????n gi???n:
        emailService.sendSimpleMessage(toEmail, "B???n ???? tr??? th??nh ?????i t??c c???a RoadHelp Codedy", "Ch??ng t??i ???? xem x??t v?? ph?? duy???t y??u c???u n??ng c???p t??i kho???n ?????i t??c c???a b???n. H??y kh???i ?????ng l???i ???ng d???ng ????? tr???i nghi???m ?????y ????? t??nh n??ng c???a t??i kho???n ?????i t??c. C???m ??n b???n.");

    }

    @PostMapping(path = {"/reset-password", "/reset-password/"})
    public ResponseEntity<?> resetPassword(@RequestParam(required = false, defaultValue = "") String email){

        User user = userService.findByEmail(email);

        if (user == null) {
            throw new RestNotFoundException("Email not found - " + email);
        }

        String resetPasswordCode = String.valueOf(Common.random(1000, 9999));

        // 01. C???p nh???t DB
        user.setResetPasswordCode(resetPasswordCode);
        userService.save(user);

        // 02. G???i mail
        Map<String, Object> mail_data = new HashMap<>() {{
            put("resetPasswordCode", resetPasswordCode);
        }};
        this.sendEmail_ResetPasswordCode(user.getEmail(), mail_data);

        return ResponseEntity.ok(new MessageResponse("Successfully! Please check email and verification code"));

    }

    @PostMapping(path = {"/reset-password/{email}/verification/{resetPasswordCode}", "/reset-password/{email}/verification/{resetPasswordCode}/"})
    public ResponseEntity<?> resetPasswordVerification(@PathVariable String email, @PathVariable String resetPasswordCode) {

        User user = userService.findByEmail(email);

        if (!user.getResetPasswordCode().equals(resetPasswordCode)) {
            throw new RuntimeException("M?? x??c th???c kh??ng kh???p.");
        }

        user.setResetPasswordCode(null); //X??a m??
        userService.save(user);

        return ResponseEntity.ok(new MessageResponse("Reset password successfully"));
    }

    @PutMapping(path = {"/confirm-reset-password/{email}", "/confirm-reset-password/{email}/"})
    public ResponseEntity<?> confirmResetPassword(@Valid @RequestBody HashMap<String, String> requestBody, @PathVariable String email) {
        User user = userService.findByEmail(email);
        String password = requestBody.get("password");
        user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));

        userService.save(user);
        return ResponseEntity.ok(new MessageResponse("Reset password successfully!"));
    }

    private void sendEmail_ResetPasswordCode(String toEmail, Map<String, Object> mailData) {
        emailService.sendSimpleMessage(toEmail, "Th??ng b??o m?? x??c minh", "M?? x??c minh c???a b???n l??: " + mailData.get("resetPasswordCode"));


    }
}
