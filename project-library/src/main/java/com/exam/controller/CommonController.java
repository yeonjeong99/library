package com.exam.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.BookLogVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
    
    @GetMapping("/")
    public String main() {
        System.out.println("main() 호출");
        return "main";
    }
    
    @GetMapping("welcome")
    public String welcome() {
        return "company/welcome";
    }
    
    @GetMapping("/accessError")
    public void accessDenied(Authentication auth, Model model) {
        log.info("access Denied!!!!!!!!!!!   "+ auth);
        model.addAttribute("msg", "   accessDenied");
        
    }
    
}
