package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.demo.model.Account;
import com.example.demo.repo.AccountRepository;

public class AccountService {
	
	@Autowired
	private AccountRepository ar;
	
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	public boolean authenticate(String username, String password) {
		Account account = ar.findByUsername(username);
		if (account != null && account.getPassword().equals(encryptPassword(password))) {
			return true;
		}
		return false;
	}
	
	private String encryptPassword(String password) {
		//scrivere la logica della crittografia della password
		return passwordEncoder.encode(password);
	}

}
