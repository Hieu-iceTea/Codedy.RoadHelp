package com.codedy.roadhelp.security;

import com.codedy.roadhelp.filter.CustomAuthenticationFilter;
import com.codedy.roadhelp.filter.CustomAuthorizationFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        CustomAuthenticationFilter customAuthenticationFilter = new CustomAuthenticationFilter(authenticationManagerBean());
        customAuthenticationFilter.setFilterProcessesUrl("/auth/login");
        http.csrf().disable();
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        // phân quyền
      //  http.authorizeRequests().antMatchers(HttpMethod.POST, "/auth/login/**").permitAll();
//        // phân quyền Emergency rescue
//        http.authorizeRequests().antMatchers(HttpMethod.POST, "/rescue/send").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/rescue/send/confirmation").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.POST, "/rescue/send/confirmation").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.POST, "/rescue/send/post-reviews").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/rescue/receive").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/rescue/receive/details").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.POST, "/rescue/receive/details").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/rescue/receive/show-reviews").hasAuthority("ROLE_PARTNER");
//        // phân quyền Repair place
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/repair-place").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/repair-place/details").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/repair-place-manage").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.POST, "/repair-place-manage").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/repair-place-manage/**").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PUT, "/repair-place-manage/**").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PATCH, "/repair-place-manage/**").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PUT, "/repair-place-manage/**/enable").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PATCH, "/repair-place-manage/**/enable").hasAuthority("ROLE_PARTNER");
//        // phân quyền My account
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/my-account-member/**").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.PUT, "/my-account-member/**").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.PATCH, "/my-account-member/**").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.PATCH, "/my-account-member/**/change-password").hasAuthority("ROLE_MEMBER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/my-account-partner/**").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PUT, "/my-account-partner/**").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PATCH, "/my-account-partner/**").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.PATCH, "/my-account-partner/**/change-password").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().antMatchers(HttpMethod.GET, "/my-account-partner/**/review-about-me").hasAuthority("ROLE_PARTNER");
//        http.authorizeRequests().anyRequest().authenticated();
//        // gọi tới filter
//        http.addFilter(customAuthenticationFilter);
//        http.addFilterBefore(new CustomAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
}
