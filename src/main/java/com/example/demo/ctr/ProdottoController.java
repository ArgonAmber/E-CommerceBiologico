package com.example.demo.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repo.ProdottoRepository;

@Controller
@RequestMapping("prodotto") // il mapping dell'url con cui verrà richiamato il controller 
//(es dalla jsp inserisciProdotto.jsp chiameremo localhost.../E-CommerceBiologico/prodotto

public class ProdottoController {
	
	@Autowired
	private ProdottoRepository prodottoRepository; // definiamo un'interfaccia privata ProdottoRepository con cui richiamiamo i metodi CRUD

	 @GetMapping("/prodotti")
	    public String getProdotti(Model model) {
	        model.addAttribute("prodotti", prodottoRepository.findAll());
	        return "prodotti";
	    }
	
}
