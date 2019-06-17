package com.exam.service;

import java.util.List;

import com.exam.domain.CommentVO;

public interface CommentService {

    // 댓글목록
    public List<CommentVO> commentList(String bno) ;
    
    // 댓글입력
    public int create(CommentVO commentVO) ;
    
    // 댓글수정
    public int update(CommentVO commentVO) ;
    
    // 댓글삭제
    public int delete(int cno) ;
    
    // 댓글에 댓글달기
    public int selectreply();
    
    public int replyinsert(CommentVO commentVO);

    
}
