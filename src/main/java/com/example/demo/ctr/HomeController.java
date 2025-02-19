package com.example.demo.ctr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String home() {
    return "home";
    }
    
    @GetMapping("/payment")
    public String payment() {
    return "payment";
    }
    
}  
