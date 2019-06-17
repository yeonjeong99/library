package com.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.AdminVO;
import com.exam.domain.AttachVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.MemberVO;

public interface AdminService {
    
    public List<MemberVO> adminMemberList();
    
    public List<MemberVO> adminMemberIdSearch(@Param("memberId") String memberId);
    
    public BookReservationVO selectbookReservationAndTime(String BookCode);
    
    public int bookReturnProcess(String bookCode, String memberId, boolean isDuty);
    
    public int bookRentalProcess(String bookCode, String memberId);
    
    /*============================ 공지사항 게시판 관련 =============================*/
    public int insert(AdminVO adminVO);
    
    public int getSeqBoardNum();
    
    public List<AdminVO> getBoards(int startRow, int amount, String search);
    
    public int getBoardCount(String search);
    
    public int updateReadcount(int num);
    
    public AdminVO getBoard(int num);
    
    public boolean updateBoard(AdminVO adminVO);
    
    public boolean deleteBoard(int num, String pass);
    
    public void replyInsert(AdminVO adminVO);
    
    public void insertBoardAndAttach(AdminVO adminVO, List<AttachVO> attachList);
    
    public void deleteBoardAndAttach(int num);
    
    public List<AttachVO> findByBnum(int bnum);
    
    /*============================ 공지사항 게시판 관련 =============================*/
    
}
