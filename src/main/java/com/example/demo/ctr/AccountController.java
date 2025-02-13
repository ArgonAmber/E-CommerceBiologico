package com.example.demo.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.model.Account;
import com.example.demo.service.AccountService;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;


public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/login")
	public String preLog(Model m) {
		m.addAttribute("account", new Account());
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("account") Account account, Model m) {
		boolean isAuthenticated = accountService.authenticate(account.getUsername(), account.getPassword());
		if (isAuthenticated) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(30 * 60); // 30 minuti di timeout, modificabili cambiando il primo parametro
			return "redirect:/home";	
		} else {
			m.addAttribute("error", "Username o password non validi.");
			return "login";
		}
	}

}
