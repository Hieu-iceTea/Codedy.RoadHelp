package com.codedy.roadhelp.security;

import com.codedy.roadhelp.security.jwt.AuthEntryPointJwt;
import com.codedy.roadhelp.security.jwt.AuthTokenFilter;
import com.codedy.roadhelp.service.user.UserServiceImplement;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserServiceImplement userDetailsService;

    @Autowired
    private AuthEntryPointJwt unauthorizedHandler;

    @Bean
    public AuthTokenFilter authenticationJwtTokenFilter() {
        return new AuthTokenFilter();
    }

    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable()
                .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                .authorizeRequests()

                .antMatchers(HttpMethod.GET, "/").permitAll()
                .antMatchers(HttpMethod.GET, "/data-images/**").permitAll()
                .antMatchers(HttpMethod.POST, "/auth/**").permitAll()
                //.antMatchers("/api/v0/**").permitAll() //Test Only
                //.antMatchers("/api/v1/**").permitAll() //Test Only

                //Config:
                // Only PARTNER
                .antMatchers(HttpMethod.GET, "/api/v1/garages/byPartner/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/api/v1/issues/byStatusSent/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/api/v1/issues/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PUT, "/api/v1/issues/**/partner-confirm-member/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/api/v1/garages/byPartner/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.POST, "/api/v1/garages/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PUT, "/api/v1/garages/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PUT, "/api/v1/garages/**/setActive/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/api/v1/user/**/ratingIssue/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.POST, "/api/v1/garageImages/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PUT, "/api/v1/garageImages/**").hasAuthority("ROLE_PARTNER")


                // Only MEMBER
                .antMatchers(HttpMethod.POST, "/api/v1/issues/rescue/send/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.PUT, "/auth/become-to-partner/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.POST, "/api/v1/issues/issues/send/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/issues/**/userPartner/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.PUT, "/api/v1/issues/**/member-confirm-partner/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.PUT, "/api/v1/issues/**/setStatusSuccess/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.POST, "/api/v1/issues/**/ratingIssue/**").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/garages/**").hasAuthority("ROLE_MEMBER")


                // Both: MEMBER & PARTNER
                .antMatchers(HttpMethod.GET, "/api/v1/issues/**/ratingIssue/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers("/api/v1/garages/featured/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/garages/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.POST, "/api/v1/garages/**/ratingGarage/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/garages/**/ratingGarage/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/user/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.PUT, "/api/v1/user/**/change-password/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers("/api/v1/user/**/update-avatar/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/provinces/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/districts/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/api/v1/wards/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers("/api/v1/ratingGarages/byGarage/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")




                .anyRequest().authenticated();

        http.addFilterBefore(authenticationJwtTokenFilter(), UsernamePasswordAuthenticationFilter.class);
    }
}
