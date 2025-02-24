package com.example.demo.config;

import org.springframework.security.core.Authentication;
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
        HttpSession session = request.getSession();
        session.setAttribute("utente", authentication.getName());

        // Recupera il valore di userType dal form
        String userType = request.getParameter("userType");

        // Controlla e reindirizza in base al valore di userType
        if ("admin".equals(userType)) {
            response.sendRedirect("/areaDipendente");
        } else {
            response.sendRedirect("/areaUtente");
        }
    }
}

