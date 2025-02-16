package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.model.Account;
import com.example.demo.repo.AccountRepository;

@Service
public class AccountService implements UserDetailsService {

    @Autowired
    private AccountRepository ar;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = ar.findByUsername(username);
        if (account == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return User.withUsername(account.getUsername())
                .password(account.getPassword())
                .roles("USER") // Puoi definire ruoli personalizzati se necessario
                .build();
    }
}
