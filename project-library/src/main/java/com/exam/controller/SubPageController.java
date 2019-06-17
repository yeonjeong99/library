package com.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SubPageController {
    
    //도서관 소개
    
    //인사말
    @GetMapping("/greeting") 
    public String greeting() {
        return "library_introduction/greeting";
    }
    
    //연혁
    @GetMapping("/history")
    public String history() {
        return "library_introduction/history";
    }
    
    //조직 현황
    @GetMapping("/organizationalStatus")
    public String OrganizationalStatus() {
        return "library_introduction/organizationalStatus";
    }
    
    //담당업무안내
    @GetMapping("/assignedTask")
    public String assignedTask() {
        return "library_introduction/assignedTask";
    }

    //시설 현황
    @GetMapping("/facilityStatus")
    public String facilityStatus() {
        return "library_introduction/facilityStatus";
    }
    
    //소장 자료 현황
    @GetMapping("/collectiveData")
    public String collectiveData() {
        return "library_introduction/collectiveData";
    }
    
    //오시는 길
    @GetMapping("/directions")
    public String directions() {
        return "library_introduction/directions";
    }
    
    //도서관 이용
    
    //이용 시간
    @GetMapping("/hoursOfUse")
    public String hoursOfUse() {
        return "library_use/hoursOfUse";
    }
    
    //자료실 소개
    @GetMapping("/referenceLibrary")
    public String referenceLibrary() {
        return "library_use/referenceLibrary";
    }
    
    //도서 회원가입
    @GetMapping("/bookMembership")
    public String bookMembership() {
        return "library_use/bookMembership";
    }
    
    
    //자료 이용 안내 - 관외 대출
    @GetMapping("/outsideLoan")
    public String outsideLoan() {
        return "library_use/outsideLoan";
    }
    
    //자료 이용 안내- 관외 열람
    @GetMapping("/outsideReading")
    public String outsideReading() {
        return "library_use/outsideReading";
    }
    
    //편의 시설
    @GetMapping("/amenities")
    public String amenities() {
        return "library_use/amenities";
    }
    
    
    //자료 찾기
    
    //자료찾기
    
    //도서 신청
    
    //새로 들어온 책
    @GetMapping("/newBook")
    public String newBook() {
        return "library_retrieveData/newBook";
    }
    
    
    //?
    @GetMapping("/item")
    public String item() {
        return "library_retrieveData/item";
    }
    
    
    //열린 마당
    
    //공지 사항
    @GetMapping("/announcement")
    public String announcement() {
        return "library_board/announcement";
    }
    
    //자주하는 질문
    @GetMapping("/questions")
    public String questions() {
        return "library_board/questions";
    }
    
    
    //자유게시판
    @GetMapping("/freeBoard")
    public String freeBoard() {
        return "library_board/freeBoard";
    }
    
    /*
     * //item
     * 
     * @GetMapping("/item") public String item() { return
     * "library_retrieveData/item"; }
     * 
     * //item
     * 
     * @GetMapping("/item") public String item() { return
     * "library_retrieveData/item"; }
     */
    
    //회원 정보
    
    //나의 도서 대출 정보
    @GetMapping("/loanInformation")
    public String loanInformation() {
        return "library_myPage/loanInformation";
    }
    
    //마이 페이지
    @GetMapping("/mypage")
    public String mypage() {
        return "library_myPage/mypage";
    }
    
    
    /*
     * //item
     * 
     * @GetMapping("/item") public String freeBoard() { return
     * "library_myPage/item"; }
     */
}
