package com.exam.service;

import java.util.List;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.MemberVO;
import com.exam.domain.NoticeBoardVO;
import com.exam.domain.ReadingRoomVO;
import com.exam.domain.ResTimeVO;

public interface ReservationService {
    
    public int insertBookReservation(BookReservationVO bookReservationVO);
    
    public int insertBookReservationAndRental(BookReservationVO bookReservationVO,ResTimeVO resTimeVO);
    
    public int updateDeskReservationAndTime(ReadingRoomVO roomVO, ResTimeVO timeVO);
    
    public void endDeskReservationAndTime();
    
    public List<ReadingRoomVO> getReadingRoom();
    
    public int extensionDeskReservTime(String memberId);
    
    public int countReadingRoomById (String memberId);
    
    public ResTimeVO selectExtensionTime(String memberId);
    
    // 6월11일 전지웅
    public List<BookReservationVO> overdueMemberId();
    
    // 6월 11일 추가 전지웅
    public void insertOverdueNotice(List<NoticeBoardVO> noticeList);
    
    public int deleteReservation(String bookCode);
    
    // 6월12일 memberOverdue batch로 update
    public List<BookReservationVO> getOverdueMemberIdRentalBook();
    // 6월12일 memberOverdue batch로 update
    public int increaseMemberOverdue(List<MemberVO> memberList);
    // 6월13일 도서대여화면 현재 대여중인목록 가져오기
    public List<BookReservationVO> reservationMemberAllSearch();
    // 6월13일 도서반납화면 최근 반납도서목록 가져오기
    public List<BookLogVO> getAllBookHistoryList();
    //6월 14일 도서대여화면 중복대여방지
    public int getBookisRental(String bookCode);
    //6월 14일 도서대여화면 6권이상 대여방지
    public int getMemberRentalCount(String memberId);

}
