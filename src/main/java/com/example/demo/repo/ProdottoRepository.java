package com.example.demo.repo;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Prodotto;

@Repository
public interface ProdottoRepository extends CrudRepository <Prodotto, Integer> { 
//    <Prodotto, Integer> il primo è un riferimento nome tabella - classe,
//  il secondo è riferito a che tipo di dato è la primary key della tabella interpellata
	

    @Query("SELECT * FROM prodotto")
    List<Prodotto> findAllProdotti();

    // Filtra per categoria
    @Query("SELECT * FROM prodotto WHERE LOWER(categoria) = LOWER(:categoria)")
    List<Prodotto> findByCategoria(@Param("categoria") String categoria);

    // Filtra per categoria e prezzo massimo
    @Query("SELECT * FROM prodotto WHERE categoria = :categoria AND prezzo <= :prezzoMax")
    List<Prodotto> findByCategoriaAndPrezzo(String categoria, double prezzoMax);

}