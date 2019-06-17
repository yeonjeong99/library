package com.exam.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.CommentVO;
import com.exam.service.BoardService;
import com.exam.service.CommentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/comment/*")
@Log4j
public class CommentController {
    
    @Setter(onMethod_ = @Autowired)
    private BoardService boardService;
    
    @Setter(onMethod_ = @Autowired)
    private CommentService service;
    
    @PostMapping("/list") // 댓글 리스트
    @ResponseBody
    private List<CommentVO> commentList(String bno) {
        
        log.info("list() 호출"+bno);
        List<CommentVO> commentList = service.commentList(bno);
        for (CommentVO comment : commentList) {
            log.info(comment);
        }
        
//        return commentList;
        return service.commentList(bno);
    }
    
    /*
     * @RequestMapping("/insert")// 댓글작성
     */   
    @PostMapping("/insert")
    @ResponseBody
    private int commentCreate(CommentVO commentVO)  {
        log.info("commentCreate() 호출");
        
        int cno = service.selectreply();
        System.out.println("cno::::"+cno);
        commentVO.setBno(commentVO.getBno());
        commentVO.setReRef(cno);
        commentVO.setReLev(0);
        commentVO.setReSeq(0);
        System.out.println("commentVO.getBno():::"+commentVO.getBno());
        
        int result = service.create(commentVO);
        System.out.println("controller result : " + result);
        return result;
    }
    
    @PostMapping("/update") // 댓글수정
    @ResponseBody
    private int commentUpdate(@RequestParam int cno, @RequestParam String comment)  {
        log.info("commentUpdate() 호출");
        CommentVO commentVO = new CommentVO();
        commentVO.setCno(cno);
        commentVO.setComment(comment);
        
        return service.update(commentVO);
    }
    
    @PostMapping("/delete")
    @ResponseBody
    private int commentDelete(@RequestParam int cno)  {
        log.info("commentDelete() 호출");
        return service.delete(cno);
    }
    
    @PostMapping("/reply")
    @ResponseBody
    private int commentReply(CommentVO commentVO) {
        log.info("commentReply() 호출");
        
        int cno = service.selectreply();
        commentVO.setBno(commentVO.getBno());
        commentVO.setReRef(commentVO.getReRef());
        commentVO.setReLev(0);
        commentVO.setReSeq(0);
        
        return service.replyinsert(commentVO);
        
    }
    
    
    

}
