package com.example.demo.repo;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Ordine;

public interface OrdineRepository extends CrudRepository <Ordine, Integer>{
	
	@Query("SELECT * FROM Ordine")
	List<Ordine> findAllOrdini();
	
	@Query("SELECT * FROM Ordine WHERE idUtente = :idUtente")
	List<Ordine> findByIdUtente(@Param("idUtente") int idUtente);

	
}


