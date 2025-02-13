package com.example.demo.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repo.ProdottoRepository;

@Controller
@RequestMapping("prodotto") // il mapping dell'url con cui verrà richiamato il controller 
//(es dalla jsp inserisciProdotto.jsp chiameremo localhost.../E-CommerceBiologico/prodotto

public class ProdottoController {
	
	@Autowired
	private ProdottoRepository pr; // definiamo un'interfaccia privata ProdottoRepository con cui richiamiamo i metodi CRUD

	
	

}
