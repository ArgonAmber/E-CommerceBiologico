package com.example.demo.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.model.Account;
import com.example.demo.repo.AccountRepository;

@Controller
public class AccountController {
	
	@Autowired
	AccountRepository ar;

    @GetMapping("/preLog")
    public String preLog(Model model) {
        model.addAttribute("account", new Account());
        return "/views/login.jsp";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Account account, Model model) {
    	Account accountEsistente = ar.findByUsername(account.getUsername());
        // Per ora puoi aggiungere un semplice controllo dummy
    	if (accountEsistente != null && accountEsistente.getPassword().equals(account.getPassword())) {
    	    return "/views/success.jsp";
        } else {
        model.addAttribute("error", "Username o password errati");
        return "/views/login.jsp";
        }
    }
    
    @GetMapping("/preReg")
    public String preRegister(Model m) {
    	Account a = new Account();
        m.addAttribute("account", a);
		System.out.println("step preRegistrazione: ok");
        return "/views/register.jsp";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Account a, Model model) {
        ar.save(a);
	    System.out.println("step registrazione: ok");
	    return "/views/success.jsp";
    }
}

