package com.exam.controller;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reservation/*")
@Log4j
public class TimeController {
    @Setter(onMethod_ = @Autowired)
    private ServletContext application;
    
    @PostConstruct
    public void init() {
        log.info("book-init() @PostConstruct 호출됨");
        
        Timer timer = new Timer(true);
        application.setAttribute("timer", timer);
        log.info("book Timer 생성 후 등록");       
    }
    
    @PostMapping("/batch/process")                          //hh(12시간제) HH(24시간제)
    public String batchProcess(@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") Date datetime, 
            @RequestParam(required = false)Long period, RedirectAttributes rttr) {
        log.info("batchProcess Post 호출");
        log.info("datetime : " + datetime);
        log.info("period : " + period);
        
        TimerTask task1 = new TimerTask() {
            @Override
            public void run() {
                log.info("task1 ?????");
            }
        };
        Timer timer = (Timer) application.getAttribute("timer");
        timer.scheduleAtFixedRate(task1, datetime, period);
        
        application.setAttribute("task1", task1);
        
        rttr.addAttribute("message", "배치작업 수행 성공!");
        return "redirect:/libReservation/bookReservation";
    }
    
    @GetMapping("/batch/cancel") // 열람실 이용도중 취소하거나 뭐 그럴때.
    public String batchCancel(RedirectAttributes rttr) {
        log.info("batchCancel() Get 호출");
        TimerTask task1 = (TimerTask) application.getAttribute("task1");
        if (task1 != null) {
            task1.cancel();
        }
        rttr.addAttribute("message", "배치작업 취소됨.");
        return "redirect:/batch/form";
    }
    
}
