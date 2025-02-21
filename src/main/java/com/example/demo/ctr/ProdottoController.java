package com.example.demo.ctr;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
     
     @PostMapping("/insert")
     public ResponseEntity<?> insertProdotto(@RequestBody Prodotto prodotto) {
         try {            
             String categoria = prodotto.getCategoria().toLowerCase();
             String directoryPath = "src/main/resources/static/images/prodotti/" + categoria; 
             File directory = new File(directoryPath);
             
             // DEBUG: Controllo creazione cartella
             if (!directory.exists()) {
                 boolean dirCreated = directory.mkdirs();
                 System.out.println("📂 Cartella creata? " + dirCreated + " -> " + directoryPath);
             }

             // Nome del file immagine
             String fileName = prodotto.getCodProd() + ".jpg";
             String filePath = directory.getAbsolutePath() + File.separator + fileName;

             // DEBUG: Stampa percorso file
             System.out.println("🖼️ File Path: " + filePath);

             // Decodifica immagine
             String base64Image = prodotto.getImmagine().split(",")[1]; 
             byte[] imageBytes = Base64.getDecoder().decode(base64Image);

             // Scrive l'immagine
             try (FileOutputStream fos = new FileOutputStream(filePath)) {
                 fos.write(imageBytes);
                 System.out.println("✅ Immagine salvata correttamente!");
             }

             // Salva percorso nel DB
             prodotto.setImmagine("/images/prodotti/" + categoria + "/" + fileName);
             prodottoRepository.save(prodotto);

             return ResponseEntity.ok("Prodotto inserito con successo!");
         } catch (IOException e) {
             System.err.println("❌ Errore IO: " + e.getMessage());
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Errore durante il salvataggio dell'immagine: " + e.getMessage());
         } catch (Exception e) {
             System.err.println("❌ Errore Generico: " + e.getMessage());
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Errore durante l'inserimento del prodotto: " + e.getMessage());
         }
     }


     
     @PostMapping("/update")
     public Prodotto updateProdotto(@RequestBody Prodotto prodotto) {
         return prodottoRepository.save(prodotto);
     }
     
     @PostMapping("/delete")
     public ResponseEntity<String> deleteProdotto(@RequestBody Prodotto prodotto) {
    	 System.out.println("🗑️ Tentativo di eliminazione del prodotto con ID: " + prodotto.getId());
         if (prodottoRepository.existsById(prodotto.getId())) {
             Prodotto prodottoDaEliminare = prodottoRepository.findById(prodotto.getId()).orElse(null);
             
             if (prodottoDaEliminare != null) {
                 String imagePath = "src/main/resources/static" + prodottoDaEliminare.getImmagine(); // Percorso assoluto
                 
                 File file = new File(imagePath);
                 if (file.exists()) {
                	 // vai piano tigre, questo cancella veramente i file!!
                     boolean deleted = file.delete();
                     System.out.println("🗑️ Immagine eliminata? " + deleted + " -> " + imagePath);
                 } else {
                     System.out.println("⚠️ Immagine non trovata: " + imagePath);
                 }
             }
     
             prodottoRepository.deleteById(prodotto.getId());

             return ResponseEntity.ok("Prodotto e immagine rimossi con successo.");
         } else {
             return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Prodotto non trovato.");
         }
     }


}
