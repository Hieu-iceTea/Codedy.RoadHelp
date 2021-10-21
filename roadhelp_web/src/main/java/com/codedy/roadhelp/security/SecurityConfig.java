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
                .authorizeRequests().antMatchers(HttpMethod.POST,"/auth/**").permitAll()
                .antMatchers(HttpMethod.POST, "/auth/register").permitAll()
                .antMatchers(HttpMethod.POST, "/rescue/send").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/rescue/send/confirmation").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.POST, "/rescue/send/confirmation").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.POST, "/rescue/send/post-reviews").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/rescue/receive").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/rescue/receive/details").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.POST, "/rescue/receive/details").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/rescue/receive/show-reviews").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/repair-place").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/repair-place/details").hasAuthority("ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/repair-place-manage").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.POST, "/repair-place-manage").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/repair-place-manage/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PUT, "/repair-place-manage/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PATCH, "/repair-place-manage/**").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PUT, "/repair-place-manage/**/enable").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.PATCH, "/repair-place-manage/**/enable").hasAuthority("ROLE_PARTNER")
                .antMatchers(HttpMethod.GET, "/my-account/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.PUT, "/my-account/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.PATCH, "/my-account/**").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.PATCH, "/my-account/**/change-password").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.PUT, "/my-account/**/change-password").hasAnyAuthority("ROLE_PARTNER", "ROLE_MEMBER")
                .antMatchers(HttpMethod.GET, "/my-account-partner/**/review-about-me").hasAuthority("ROLE_PARTNER")
                .anyRequest().authenticated();

        http.addFilterBefore(authenticationJwtTokenFilter(), UsernamePasswordAuthenticationFilter.class);
    }
}
