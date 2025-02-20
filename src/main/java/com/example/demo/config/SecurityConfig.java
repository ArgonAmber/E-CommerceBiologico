package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.beans.factory.annotation.Autowired;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final UserDetailsService userDetailsService;
    private final PasswordEncoder passwordEncoder;

    public SecurityConfig(UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
        this.userDetailsService = userDetailsService;
        this.passwordEncoder = passwordEncoder;
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(authorizeRequests -> authorizeRequests
                                .requestMatchers("/areaUtente/**", "/areaDipendente/**").authenticated() // Specifica solo le pagine che richiedono autenticazione
                                .requestMatchers("/prodotto/update", "/prodotto/insert", "/prodotto/delete").authenticated()
                                .requestMatchers("/prodotto/prodotti").permitAll() // Permetti tutte le richieste all'endpoint /prodotto/update
                                .anyRequest().permitAll() // Tutte le altre richieste sono permesse senza autenticazione
                )
                .formLogin(formLogin -> formLogin
                                .loginPage("/welcome").permitAll()
                                .loginProcessingUrl("/login") // Specifica l'URL di elaborazione del login
                                .defaultSuccessUrl("/areaUtente", true)
                )
                .logout(logout -> logout.permitAll());
        
        return http.build();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }
}
