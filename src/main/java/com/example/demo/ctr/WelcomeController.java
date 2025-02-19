package com.example.demo.ctr;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.model.Account;

@Controller
public class WelcomeController {

    @GetMapping("/welcome")
    public String welcome(Model m) {
    	m.addAttribute("account", new Account());
        return "welcome";
    }
    
    
}
