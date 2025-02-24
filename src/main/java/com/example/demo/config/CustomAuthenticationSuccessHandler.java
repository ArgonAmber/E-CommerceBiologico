package com.example.demo.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        HttpSession session = request.getSession(); // Ottieni la sessione attuale
        session.setAttribute("utente", authentication.getName()); // Salva il nome utente nella sessione

        String userType = request.getParameter("userType"); 
        String targetUrl = "/"; 

        // Decidi la redirezione in base al tipo di utente
        if ("admin".equals(userType)) {
            targetUrl = "/areaDipendente";  
        } else {
            targetUrl = "/areaUtente";  
        }

        response.sendRedirect(targetUrl);  
    }
}
