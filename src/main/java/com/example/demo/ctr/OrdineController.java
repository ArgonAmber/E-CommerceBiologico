package com.example.demo.ctr;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Ordine;
import com.example.demo.repo.OrdineRepository;

@RestController
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

}
