package com.example.demo.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Account;

@Repository
public interface AccountRepository extends CrudRepository <Account, Integer> { 
//	<Account, Integer> il primo è un riferimento nome tabella - classe,
//  il secondo è riferito a che tipo di dato è la primary key della tabella interpellata

	Account findByUsername(String username);
}
