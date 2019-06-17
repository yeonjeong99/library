package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.AdminVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.MemberVO;

public interface AdminMapper {
    public List<MemberVO> adminMemberList();
    
    public List<MemberVO> adminMemberIdSearch(@Param("memberId") String memberId);

    public BookReservationVO selectbookReservationAndTime(String BookCode);
    /*============================ 공지사항 게시판 관련 =============================*/
    public Integer getSeqBoardNum();
    
    public int insertBoard(AdminVO adminVO);
    //update나 delete는 행의 개수가 두개 이상이 될 수 있지만 insert는 하나만 나오기 때문에 void로 받을 수 있다.
    
    public List<AdminVO> getBoards (
            @Param("startRow") int startRow, 
            @Param("amount") int amount,
               @Param("search") String search);
    
    //@Select("SELECT COUNT(*) FROM board")
    public int getBoardCount( @Param("search") String search);
    
    
    //@Update("UPDATE board SET readcount = readcount+1 WHERE num=#{num}")
    public int updateReadcount(int num);
    
    //@Select("SELECT * FROM board WHERE num = #{num}")
    public AdminVO getBoard(int num);
    
    public int updateBoard(AdminVO admin);
    
    public int deleteBoard(int num); // 글번호가 넘어가야함
    
    public int updateReplyGroupSeq(@Param("reRef") int reRef, @Param("reSeq") int reSeq);
    /*============================ 공지사항 게시판 관련 =============================*/
}

