package com.example.demo.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        String userType = request.getParameter("userType");
        String targetUrl = "/"; 

        // Decidi la redirezione in base al tipo di utente
        if ("admin".equals(userType)) {
            targetUrl = "/areaDipendente";  
        } else if ("user".equals(userType)) {
            targetUrl = "/areaUtente";  
        }

        response.sendRedirect(targetUrl);  
    }
}
