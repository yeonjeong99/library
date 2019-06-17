package com.exam.controller;

import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.domain.APISearchVO;
import com.exam.domain.BookRequestVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.ReadingRoomVO;
import com.exam.domain.ResTimeVO;
import com.exam.service.BookReqService;
import com.exam.service.ResTimeService;
import com.exam.service.ReservationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@PreAuthorize("isAuthenticated()")
@Controller
@Log4j
@RequestMapping("/libReservation/*")
public class ReservationController {
    
    
    @Setter(onMethod_ = @Autowired)
    private BookReqService bookService; // db 구현이 안되어있어서 오픈api 그대로 들고옴. 그걸 그냥 값을 넣는데 사용할 생각임.
                                        // 나중에 db 구현이 완료되면 구현된 db로 service 다시 만들고 구현해야함.
    @Setter(onMethod_ = @Autowired)
    private ReservationService resService;
    
    @Setter(onMethod_ = @Autowired)
    private ResTimeService resTimeService;
    
    @Setter(onMethod_ = @Autowired)
    private ServletContext application;
    
    @GetMapping("/bookRequestSearch")
    public String bookRequestSearch() {
        log.info("libRequest/bookRequestSearch 도서검색 api() 호출");
        return "libRequest/bookRequestSearch";
    } // 도서검색 api 화면
    
    @GetMapping("/readingRoomReservation")
    public String readingRoomReservation() {
        return "/libReservation/readingRoomReservation";
    }
    
    @PostMapping("/readingRoomReservation")
    @ResponseBody
    public List<ReadingRoomVO> ReadingRoomReservation(){
        
        return resService.getReadingRoom();
        
    }
    
    @PostMapping("/deskReservation")
    @ResponseBody
    public int deskReReservation(ReadingRoomVO roomVO) {
        
        System.out.println("좌석 예약!!!!!!!!!!!!!!!!");
        
        System.out.println(roomVO.getMemberId());
        ResTimeVO resTimeVO = new ResTimeVO();
        roomVO.setDeskStatus(1);
        
        resTimeVO.setTimeCode("desk"+roomVO.getDeskNo());
        
        int isSuccess = resService.updateDeskReservationAndTime(roomVO, resTimeVO);
        return isSuccess;
    }
    
    @PostMapping("/extesionDesk")
    @ResponseBody
    public int extensionDeskReservTime(String memberId) {
        log.info(memberId);
        return resService.extensionDeskReservTime(memberId);
    }
    
    @PostMapping("/memberReadingRoom")
    @ResponseBody
    public int countReadingRoomById(String memberId) {
        return resService.countReadingRoomById(memberId);
    }
    
    @PostMapping("/extensionTime")
    @ResponseBody
    public int selectExtensionTime(String memberId) {
        int count = 0;
        
        ResTimeVO resTimeVO = resService.selectExtensionTime(memberId);
        
        Date startTime = resTimeVO.getStartTime();
        Date endTime = resTimeVO.getEndTime();
        
        long tempTime = endTime.getTime() - startTime.getTime(); 
        
        if (tempTime == 14400000) {
            count = 1;
        }
        
        log.info("몇시간이냐?"+tempTime);
        
        return count;
    }
    
}
