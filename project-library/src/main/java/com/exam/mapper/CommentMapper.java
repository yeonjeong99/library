package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.CommentVO;

public interface CommentMapper {

    //댓글개수
    public int commentCount();
    
    // 댓글목록
    public List<CommentVO> list(String bno);
    
    // 댓글작성
    public int create(CommentVO commentVO);
    
    // 댓글수정
    public int update(CommentVO commentVO);
    
    // 댓글삭제
    public int delete(int cno);
    
    // 댓글번호 증가
    public int replyCount(int cno);
    
    public int selectreply();
    
    // 댓글에 댓글달기
    public void updateReplyGroupSeq(@Param("reRef")int reRef, @Param("reSeq")int reSeq);

    
   
}
