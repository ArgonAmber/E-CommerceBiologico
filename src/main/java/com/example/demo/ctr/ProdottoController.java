package com.example.demo.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Prodotto;
import com.example.demo.repo.ProdottoRepository;

@RestController
@RequestMapping("prodotto") // il mapping dell'url con cui verrà richiamato il controller 
//(es dalla jsp inserisciProdotto.jsp chiameremo localhost.../E-CommerceBiologico/prodotto

public class ProdottoController {

    @Autowired
    private ProdottoRepository prodottoRepository; // definiamo un'interfaccia privata ProdottoRepository con cui richiamiamo i metodi CRUD

    @GetMapping("/prodotti")
    public List<Prodotto> getProdotti() {
        return prodottoRepository.findAllProdotti(); // Usa il metodo corretto dal Repository
    }

     @GetMapping("/prodotti/categoria")
        public List<Prodotto> getProdottiByCategoria(@RequestParam String categoria) {
            return prodottoRepository.findByCategoria(categoria);
        }
}