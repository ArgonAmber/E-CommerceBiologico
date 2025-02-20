package com.example.demo.ctr;

import com.example.demo.model.CarrelloItem;
import com.example.demo.model.Prodotto;
import com.example.demo.repo.ProdottoRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("carrello")
public class CarrelloController {

    @Autowired
    private ProdottoRepository prodottoRepository;

    // Aggiunge un prodotto al carrello
    @PostMapping("/aggiungi")
    public ResponseEntity<String> aggiungiAlCarrello(@RequestParam int idProdotto, HttpSession session) {
        List<CarrelloItem> carrello = (List<CarrelloItem>) session.getAttribute("carrello");
        if (carrello == null) {
            carrello = new ArrayList<>();
        }

        Prodotto prodotto = prodottoRepository.findById(idProdotto).orElse(null);
        if (prodotto != null) {
            boolean trovato = false;
            for (CarrelloItem item : carrello) {
                if (item.getProdotto().getId() == idProdotto) {
                    item.incrementaQuantita();
                    trovato = true;
                    break;
                }
            }
            if (!trovato) {
                carrello.add(new CarrelloItem(prodotto, 1));
            }
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Prodotto non trovato");
        }

        session.setAttribute("carrello", carrello);
        return ResponseEntity.ok("Prodotto aggiunto al carrello");
    }
    // Recupera i prodotti nel carrello
    @GetMapping("/")
    public List<CarrelloItem> visualizzaCarrello(HttpSession session) {
        List<CarrelloItem> carrello = (List<CarrelloItem>) session.getAttribute("carrello");
        return (carrello != null) ? carrello : new ArrayList<>();
    }

    // Rimuove un prodotto dal carrello
    @PostMapping("/rimuovi")
    public void rimuoviDalCarrello(@RequestParam int idProdotto, HttpSession session) {
        List<CarrelloItem> carrello = (List<CarrelloItem>) session.getAttribute("carrello");
        if (carrello != null) {
            carrello.removeIf(item -> item.getProdotto().getId() == idProdotto);
            session.setAttribute("carrello", carrello);
        }
    }

    // Svuota il carrello
    @PostMapping("/svuota")
    public void svuotaCarrello(HttpSession session) {
        session.removeAttribute("carrello");
    }
}
