package com.exam.controller;


import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.domain.SampleDto;
import com.exam.domain.SampleDtoList;
import com.exam.service.MemberService;

import lombok.Setter;

//import lombok.extern.log4j.Log4j;

/*
 *  component-scan 태그에 의해서
 *  자동으로 빈 등록되는 애노테이션
 *      @Component
 *      @Controller     @Service        @Repository
 * */

@Controller
@RequestMapping("/sample/*")
//@Log4j
public class SampleController {
    
    private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
    
    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;
    
    
    @RequestMapping("")
    public void basic() {
        System.out.println("basic.......");
        logger.info("샘플의 베이직임요");
    }
    
    @RequestMapping(value = "/basic", method = RequestMethod.GET)
    public void basicGet() {
        logger.info("겟1의 베이직임");
    }
    
    @GetMapping("/basicOnlyGet")
    public void basicGet2() {
        logger.info("얘는 겟2호기");
    }
    
    @GetMapping("/ex01")
    public String ex01(SampleDto dto) {
        logger.info(""+dto);
        
        return "ex01";
    }
    
    @GetMapping("/ex02List")
    public String ex02List(@RequestParam("ids")ArrayList<String> ids) {
       logger.info("ids: " +ids);

       return "ex02List";
    }
    
    // list는 SampleDTOList의 필드이름(getter메소드명)과 동일해야 함!
    // ex02Bean?list[0].name=aaa&list[2].name=bbb
    // ex02Bean?list%5B0%5D.name=aaa&list%5B2%5D.name=bbb
    @GetMapping("/ex02Bean")
    public String ex02Bean(SampleDtoList list) {
        logger.info("list dtos: "+ list);
        
        return "ex02Bean";
    }
    
    // ex04?name=aaa&age=11&page=9
    @GetMapping("/ex04")
    public String ex04(@ModelAttribute("dto") SampleDto dto, @ModelAttribute("page") int page, Model model) {
        logger.info("dto: " +dto);
        logger.info("page: " +page);
        
        model.addAttribute("name", "홍길동");
        
        //return "redirect:/sample/basic";
        return "/sample/ex04";
    }
    
    @GetMapping("/libTest")
    public void libTest() {
        logger.info("얘는 겟2호기");
    }
}
