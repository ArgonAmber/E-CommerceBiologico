package com.example.demo.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Prodotto;

@Repository
public interface ProdottoRepository extends CrudRepository <Prodotto, Integer> { 
//	<Prodotto, Integer> il primo è un riferimento nome tabella - classe,
//  il secondo è riferito a che tipo di dato è la primary key della tabella interpellata

}
