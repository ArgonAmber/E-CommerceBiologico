package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;

@SpringBootApplication
@EnableJdbcRepositories(basePackages = "com.example.demo.repo")
public class ECommerceBiologicoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ECommerceBiologicoApplication.class, args);
    }
}
