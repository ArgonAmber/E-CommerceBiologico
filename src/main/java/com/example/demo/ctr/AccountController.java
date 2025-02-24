package com.example.demo.ctr;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Account;
import com.example.demo.repo.AccountRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
	
	@Autowired
	AccountRepository ar;
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	
	@PostMapping("/login")	
	public String login(@RequestParam String username, 
	                    @RequestParam String password, 
	                    @RequestParam String userType, 
	                    Model model, 
	                    HttpSession session) { // Aggiunto HttpSession
	    // Verifica che il tipo di utente sia valido
	    if ("admin".equals(userType)) {
	    	System.out.println("Accesso come dipendente");
	        return loginAdmin(username, password, model, session);  // Passiamo anche la sessione
	    } else if ("user".equals(userType)) {
	    	System.out.println("Accesso come utente");
	        return loginUser(username, password, model, session);   // Passiamo anche la sessione
	    } else {
	        model.addAttribute("error", "Tipo di utente non valido");
	        return "welcome";  // Redirezione in caso di tipo utente non valido
	    }
	}
	public String loginUser(String username, String password, Model model, HttpSession session) {
	    Account accountEsistente = ar.findByUsername(username);
	    if (accountEsistente != null) {
	        System.out.println("Username trovato: " + accountEsistente.getUsername());
	        if (passwordEncoder.matches(password, accountEsistente.getPassword())) {
	            System.out.println("Password corretta");
	            session.setAttribute("utente", accountEsistente.getUsername()); // Salva in sessione
	            return "redirect:/areaUtente"; // Redireziona all'area utente
	        } else {
	            System.out.println("Password errata");
	        }
	    } else {
	        System.out.println("Username non trovato");
	    }
	    model.addAttribute("error", "Username o password errati");
	    return "welcome"; // Ritorna alla pagina di login in caso di errore
	}

	public String loginAdmin(String username, String password, Model model, HttpSession session) {
	    Account accountEsistente = ar.findByUsername(username);
	    if (accountEsistente != null) {
	        System.out.println("Username trovato: " + accountEsistente.getUsername());
	        if (passwordEncoder.matches(password, accountEsistente.getPassword())) {
	            System.out.println("Password corretta");
	            session.setAttribute("utente", accountEsistente.getUsername()); // Salva in sessione
	            return "redirect:/areaDipendente"; // Redireziona all'area dipendente
	        } else {
	            System.out.println("Password errata");
	        }
	    } else {
	        System.out.println("Username non trovato");
	    }
	    model.addAttribute("error", "Username o password errati");
	    return "welcome"; // Ritorna alla pagina di login in caso di errore
	}

    
    @GetMapping("/preReg")
    public String preRegister(Model m) {
    	Account a = new Account();
        m.addAttribute("account", a);
		System.out.println("step preRegistrazione: ok");
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Account account, @RequestParam String confirmPassword, Model model) {
    	System.out.println("step Registrazione: ok");
    	  // Controllo se la password e la conferma corrispondono
        if (!account.getPassword().equals(confirmPassword)) {
            model.addAttribute("error", "Le password non coincidono. Riprova.");
            return "register";
        }
    	
        Account accountEsistente = ar.findByUsername(account.getUsername());
        Account emailEsistente = ar.findByEmail(account.getEmail());
        // controlla che il nome utente non sia già utilizzato
        if (accountEsistente != null || emailEsistente != null) {
            model.addAttribute("error", "Il nome utente o l'email sono già in uso. Scegli un altro nome utente.");
            return "register";
        } else {
        	//cripta la password prima di salvarla
            account.setPassword(passwordEncoder.encode(account.getPassword()));
            ar.save(account);
            return "home";
        }
    }
    


    @PostMapping("/checkUsername")
    @ResponseBody
    public boolean checkUsername(@RequestParam String username) {
        Account accountEsistente = ar.findByUsername(username);
        return accountEsistente != null;
    }
        
         
    @GetMapping("/areaUtente")
    public String areaUtente(Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/login"; // Se non è autenticato, lo rimanda al login
        }
        model.addAttribute("username", principal.getName());
        return "areaUtente"; // Se è loggato, entra nell'area utente
    }
    
    @GetMapping("/areaDipendente")
    public String areaDipendente(Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/login";
        }
        model.addAttribute("username", principal.getName());
        return "areaDipendente";
    }
    
    @GetMapping("/account/list")
    @ResponseBody
    public List<Account> getAllAccounts() {
        return (List<Account>) ar.findAll();
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalida la sessione, facendo il logout effettivo
        return "redirect:/welcome"; // Torna alla pagina di login
    }

    
}

