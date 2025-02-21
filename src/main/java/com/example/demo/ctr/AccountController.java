package com.example.demo.ctr;

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

@Controller
public class AccountController {
	
	@Autowired
	AccountRepository ar;
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	
	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, @RequestParam String userType, Model model) {
	    // Verifica che il tipo di utente sia valido
	    if ("admin".equals(userType)) {
	        return loginAdmin(username, password, model);  // Login per il dipendente
	    } else if ("user".equals(userType)) {
	        return loginUser(username, password, model);   // Login per l'utente normale
	    } else {
	        model.addAttribute("error", "Tipo di utente non valido");
	        return "welcome";  // Redirezione in caso di tipo utente non valido
	    }
	}

	public String loginAdmin(String username, String password, Model model) {
	    Account accountEsistente = ar.findByUsername(username);
	    if (accountEsistente != null) {
	        System.out.println("Username trovato: " + accountEsistente.getUsername());
	        if (passwordEncoder.matches(password, accountEsistente.getPassword())) {
	            System.out.println("Password corretta");
	            return "areaDipendente";  // Redirezione all'area dipendente
	        } else {
	            System.out.println("Password errata");
	        }
	    } else {
	        System.out.println("Username non trovato");
	    }
	    model.addAttribute("error", "Username o password errati");
	    return "welcome";  // Redirezione alla pagina di login in caso di errore
	}

	public String loginUser(String username, String password, Model model) {
	    Account accountEsistente = ar.findByUsername(username);
	    if (accountEsistente != null) {
	        System.out.println("Username trovato: " + accountEsistente.getUsername());
	        if (passwordEncoder.matches(password, accountEsistente.getPassword())) {
	            System.out.println("Password corretta");
	            return "areaUtente";  // Redirezione all'area utente
	        } else {
	            System.out.println("Password errata");
	        }
	    } else {
	        System.out.println("Username non trovato");
	    }
	    model.addAttribute("error", "Username o password errati");
	    return "welcome";  // Redirezione alla pagina di login in caso di errore
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
    
    @GetMapping("/account/list")
    @ResponseBody
    public List<Account> getAllAccounts() {
        return (List<Account>) ar.findAll();
    }

    
}

