package com.example.demo.ctr;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.model.Account;

@Controller
public class AccountController {

    @GetMapping("/preLog")
    public String preLog(Model model) {
        model.addAttribute("account", new Account());
        return "/views/login.jsp";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Account account, Model model) {
        // Qui puoi aggiungere la logica per l'autenticazione
        // Per ora puoi aggiungere un semplice controllo dummy
        if ("user".equals(account.getUsername()) && "password".equals(account.getPassword())) {
            return "redirect:/home.html";
        }
        model.addAttribute("error", "Username o password errati");
        return "/views/login.jsp";
    }
}

