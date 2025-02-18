package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.example.demo.model.Account;
import com.example.demo.repo.AccountRepository;

@Configuration
public class UserDetailsServiceConfig {

    @Bean
    UserDetailsService userDetailsService(AccountRepository ar) {
        return username -> {
            Account account = ar.findByUsername(username);
            if (account == null) {
                throw new UsernameNotFoundException("User not found");
            }
            return User.withUsername(account.getUsername())
                       .password(account.getPassword())
                       .roles("USER")
                       .build();
        };
    }
}
