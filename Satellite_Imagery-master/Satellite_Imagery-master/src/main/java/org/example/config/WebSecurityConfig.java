package org.example.config;

import org.example.database.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author dchernichkin 15.11.2020
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(bCryptPasswordEncoder);
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        //http.requiresChannel().anyRequest().requiresSecure();
        httpSecurity.httpBasic().disable()
                .csrf()
                .ignoringAntMatchers("/logout", "/login")
                .and()
                .authorizeRequests()
                .antMatchers("/photo/**", "/location/**", "/list/**").hasAnyRole("USER", "MODERATOR", "ADMIN")
                .antMatchers("/moderator/**").hasAnyRole("MODERATOR", "ADMIN")
                .antMatchers("/administrator/**").hasAnyRole("ADMIN")
                .antMatchers("/registration").not().fullyAuthenticated()
                .and()
                .formLogin()
                .loginPage("/login").failureUrl("/failure").permitAll()
                .and()
                .logout().logoutUrl("/logout").deleteCookies("JSESSIONID").logoutSuccessUrl("/");

                // httpSecurity.requiresChannel().anyRequest().requiresSecure();

    }
}
