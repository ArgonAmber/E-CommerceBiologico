package com.example.demo.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Account;

public interface AccountRepository extends CrudRepository <Account, Integer> {
	
	Account findByUsername(String username);
	
}
