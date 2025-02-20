package com.example.demo.ctr;

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

@Controller
public class AccountController {
	
	@Autowired
	AccountRepository ar;
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	@PostMapping("/login")
	public String login(@ModelAttribute Account account, Model model) {
	    Account accountEsistente = ar.findByUsername(account.getUsername());
	    if (accountEsistente != null) {
	        System.out.println("Username trovato: " + accountEsistente.getUsername());
	        if (passwordEncoder.matches(account.getPassword(), accountEsistente.getPassword())) {
	            System.out.println("Password corretta");
	            return "areaUtente";
	        } else {
	            System.out.println("Password errata");
	        }
	    } else {
	        System.out.println("Username non trovato");
	    }
	    model.addAttribute("error", "Username o password errati");
	    return "welcome";
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
            return "areaUtente";
        }
    }
    


    @PostMapping("/checkUsername")
    @ResponseBody
    public boolean checkUsername(@RequestParam String username) {
        Account accountEsistente = ar.findByUsername(username);
        return accountEsistente != null;
    }
        
         
    @GetMapping("/areaUtente")
    public String areaUtente() {
        return "areaUtente"; 
    }
    
    @GetMapping("/areaDipendente")
    public String areaDipendente() {
        return "areaDipendente"; 
    }
    
    
    
}

