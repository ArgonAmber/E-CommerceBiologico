package com.example.demo.repo;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Ordine;

public interface OrdineRepository extends CrudRepository <Ordine, Integer>{
	
	@Query("SELECT * FROM Ordine")
	List<Ordine> findAllOrdini();
}
