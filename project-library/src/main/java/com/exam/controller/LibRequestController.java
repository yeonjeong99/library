package com.exam.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.APISearchVO;
import com.exam.domain.BookRequestVO;
import com.exam.service.BookReqService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/libRequest/*")
@Log4j
public class LibRequestController {
    @Setter(onMethod_ = @Autowired)
    private BookReqService bookService;
    
    
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/bookRequest")
    public String login() {
        return "libRequest/bookRequest";
    } // 희망도서 신청 화면
    
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/bookRequestSearch")
    public String bookRequestSearch() {
        return "libRequest/bookRequestSearch";
    } // 도서검색 api 화면
   
    @PostMapping("/getData")
    @ResponseBody
    public Object getData(@RequestBody  APISearchVO vo) throws Exception {
        log.info("getData !!!!!!!!");
        String pageNum = vo.getPageNum();
        String type = vo.getType();
        String keyword = vo.getKeyword();
        Object response =  bookService.getItemsFromOpenApi(pageNum, type, keyword);
        return response;
    }
    
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/bookRequest")
    public String bookRequest(BookRequestVO bookRequestVO) {
        bookRequestVO.setWishStatus(0);
        
        log.info(bookRequestVO);
        
        bookService.insertWishBook(bookRequestVO);
        
        return "redirect:/libRequest/bookRequestResult";
    } // 도서검색 api 화면
    
    
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/bookRequestResult")
    public String bookRequestResult() {
        return "libRequest/bookRequestResult";
    }
    
    @PostMapping("/bookRequestResult")
    @ResponseBody
    public List<BookRequestVO> bookRequestResult(@RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(required = false) String memberId,
            @RequestParam(required = false) String search) {
        System.out.println("여기왔음?");
        String id = "";
        
        if(memberId != null) {
            id = memberId;
        }
        System.out.println("id=?"+id+", "+pageNum+", "+search);
        // =========================================
        // 한 페이지에 해당하는 글목록 구하기 작업
        // =========================================
        int amount = 5; // 한 페이지 당 보여줄 글(레코드) 갯수
        int startRow = (pageNum -1)*amount;
        
        List<BookRequestVO> list = bookService.getWishList(startRow, amount, id, search);
        
        System.out.println(list.size());
        
        return list;
    }
    
    @PostMapping("/bookRequestCancel")
    @ResponseBody
    public int updateWishList(BookRequestVO requestVO) {
        
        String str = "사용자가 신청을 취소함";
        requestVO.setWishResult(str);
        requestVO.setWishStatus(1);
        
        int isSuccess = bookService.updateWishList(requestVO);
        return isSuccess;
    }
    
    @PostMapping("/bookRequestCount")
    @ResponseBody
    public int getWishListCount(@RequestParam(required = false) String memberId,
            @RequestParam(required = false) String search) {
        return bookService.getWishListCount(memberId, search);
    }
}
