package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookSearchDTO;
import com.exam.domain.BookVO;
import com.exam.service.AttachService;
import com.exam.service.BookService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/bookSearch/*")
@Log4j
public class BookController {
    
    @Setter(onMethod_ = @Autowired)
    private BookService bookService;
    

    @PostMapping("/bookRank")
    @ResponseBody
    public List<BookLogVO> bookRank() {
        return bookService.getBookRentalRank();
    }
    
    @GetMapping("/booklistSearch")
    public String bookRequestSearch(@RequestParam(defaultValue = "1") int pageNum,
            BookSearchDTO bookSearchDTO, 
            Model model)  {
        log.info("bookSearch/bookReservation 도서검색 () get 호출");
     // =========================================
        // 한 페이지에 해당하는 글목록 구하기 작업
        // =========================================
        int amount = 10; // 한 페이지 당 보여줄 글(레코드) 갯수
        int startRow = (pageNum - 1) * amount;
        
        List<BookVO> list = bookService.getBookList(startRow, amount, bookSearchDTO);
        
        // =========================================
        //  페이지 블록 구하기 작업
        // =========================================
        int allRowCount = 0; // 전체 행 갯수
        
        allRowCount = bookService.getBookCount(bookSearchDTO);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        // 1페이지 ~ maxPage 페이지까지 존재함.
        // -> 페이지 블록단위로 끊어줌

        // 시작페이지번호(1)             끝페이지번호(10)
        // 1 2 3 4 5 6 7 8 9 10             -- [블록구성 10개]
        
        // 시작페이지번호(11)             끝페이지번호(20)
        // 11 12 13 14 15 16 17 18 19 20   -- [블록구성 10개]
        
        // 시작페이지번호(21)             끝페이지번호(23)
        // 21 22 23                         -- [블록구성 3개]
        
        // 한 페이지블록을 구성하는 페이지갯수
        int pageBlockSize = 5;
        
        // 시작페이지번호 구하기
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        // 끝페이지번호 구하기
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝페이지번호 구하기
            endPage = maxPage;
        }
        
        Map<String, Integer> pageInfoMap = new HashMap<>();
        pageInfoMap.put("startPage", startPage); // 시작페이지번호
        pageInfoMap.put("endPage", endPage);     // 끝페이지번호
        pageInfoMap.put("pageBlockSize", pageBlockSize);//페이지블록크기
        pageInfoMap.put("maxPage", maxPage);     // 전체 페이지수
        pageInfoMap.put("allRowCount", allRowCount); // 전체 행갯수
        pageInfoMap.put("pageNum", pageNum); // 사용자가 요청한 페이지번호
        
        // model에 저장하면 스프링이 request 영역객체에 옮겨담아줌
        model.addAttribute("list", list); // 글목록 list 
        model.addAttribute("pageInfoMap", pageInfoMap); // 페이지블록 출력관련 데이터
        
        model.addAttribute("search", bookSearchDTO); // 검색어
//        
        return "libReservation/bookReservation";
    }
    
}
