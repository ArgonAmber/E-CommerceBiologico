package com.example.demo.ctr;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Ordine;
import com.example.demo.repo.OrdineRepository;

import jakarta.servlet.http.HttpSession;

@Controller

@RequestMapping("ordine")
public class OrdineController {
	
	@Autowired
	OrdineRepository ordineRepository;
	
	@GetMapping("/ordini")
	public List<Ordine> getOrdini() {
		return ordineRepository.findAllOrdini();
	}
	
	@PostMapping("/delete")
    public ResponseEntity<String> deleteOrdine(@RequestBody Ordine ordine) {
        if (ordineRepository.existsById(ordine.getId())) {
        	                     
            ordineRepository.deleteById(ordine.getId());
            return ResponseEntity.ok("Ordine rimosso con successo.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Ordine non trovato.");
        }
    }

	
	@PostMapping("/salva")
	public ResponseEntity<String> salvaOrdine(@RequestParam String nome, 
	                                          @RequestParam String email,
	                                          @RequestParam String metodoPagamento,
	                                          @RequestParam(required = false) String numeroCarta,
	                                          @RequestParam(required = false) String scadenza,
	                                          @RequestParam(required = false) String cvv,
	                                          @RequestParam(required = false) String paypalEmail,
	                                          HttpSession session) {
	    // Creiamo l'ordine con i dati ricevuti
	    Ordine ordine = new Ordine();
	    ordine.setUsername(nome);
	    ordine.setEmail(email);
	    ordine.setCodOrdine("ORD-" + System.currentTimeMillis()); // Codice univoco simulato
	    ordine.setMetodoPagamento(metodoPagamento);

	    if ("Carta".equals(metodoPagamento)) {
	        ordine.setNumeroCarta(numeroCarta);
	        ordine.setScadenza(scadenza);
	        ordine.setCvv(cvv);
	    } else if ("PayPal".equals(metodoPagamento)) {
	        ordine.setPaypalEmail(paypalEmail);
	    }

	    // Salviamo l'ordine nella sessione
	    session.setAttribute("ordine", ordine);

	    return ResponseEntity.ok("Ordine salvato con successo");
	}
	
	@GetMapping("/acquistoSuccess")
	public String mostraPaginaSuccesso(HttpSession session, Model model) {
	    // Recupera l'ordine dalla sessione
	    Ordine ordine = (Ordine) session.getAttribute("ordine");

	    // Se l'ordine non esiste, reindirizza alla home
	    if (ordine == null) {
	        return "redirect:/home";
	    }

	    // Passiamo l'ordine alla vista JSP
	    model.addAttribute("ordine", ordine);
	    
	    // SVUOTARE IL CARRELLO DOPO IL PAGAMENTO
	    session.removeAttribute("carrello");

	    // Mostra la JSP di conferma (che deve essere in WEB-INF/views/)
	    return "acquistoSuccess";
	}
}


