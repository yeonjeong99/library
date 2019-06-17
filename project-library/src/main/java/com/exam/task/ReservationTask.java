package com.exam.task;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.exam.domain.BookReservationVO;
import com.exam.domain.BookVO;
import com.exam.domain.MemberVO;
import com.exam.domain.NoticeBoardVO;
import com.exam.service.BookService;
import com.exam.service.ReservationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ReservationTask {
    
    @Setter(onMethod_ = @Autowired)
    private ReservationService reservService;
    
    @Setter(onMethod_ = @Autowired)
    private BookService bookService;
    
    @Scheduled(fixedDelay = 1000*30)
    public void deskReservationTask() throws Exception{
        log.warn("============좌석 타임 아웃 실행=============");
        reservService.endDeskReservationAndTime();
        log.warn("============좌석 타임 아웃 종료=============");
    }
    
    /* @Scheduled(cron = "0 59 23 * * *") */
    @Scheduled(cron = "0 48 11 * * *")
    public void bookReservationTaks() throws Exception{
        log.warn("============알림 타임 아웃 실행=============");
        List<BookReservationVO> bookReservationList = reservService.overdueMemberId();
        
        for (BookReservationVO vo : bookReservationList) {
            log.warn(vo);
        }
        
        List<NoticeBoardVO> noticeBoardList = new ArrayList<NoticeBoardVO>();
        
        for (BookReservationVO reservationVO : bookReservationList) {
            String bookCode = reservationVO.getBookCode().substring(4);
            BookVO bookVO = bookService.getBookInfo(bookCode);
            
            NoticeBoardVO noticeBoardVO = new NoticeBoardVO();
            
            noticeBoardVO.setMemberId(reservationVO.getMemberId());
            noticeBoardVO.setSubject("도서 '"+bookVO.getTitle()+"' 을(를) 연체중입니다.");
            noticeBoardVO.setContent("'"+reservationVO.getMemberId()+"' 님, 도서 '"+bookVO.getTitle()+"' 을(를) 연체중입니다. 빠른시일내에 반납 부탁드립니다.");
            noticeBoardList.add(noticeBoardVO);
        }
        
        reservService.insertOverdueNotice(noticeBoardList);
        log.warn("============알림 타임 아웃 종료=============");
        
        log.warn("============MemberOverDueUpdate 타임 아웃 실행=============");
        List<BookReservationVO> bookReservationMemberOverdueList = reservService.getOverdueMemberIdRentalBook();
        for (BookReservationVO vo : bookReservationMemberOverdueList) {
            log.warn(vo);
        }
        
        List<MemberVO> memberList = new ArrayList<MemberVO>();
        for (BookReservationVO reservationVO : bookReservationMemberOverdueList) {
            String memberId = reservationVO.getMemberId();
            MemberVO memberVO = new MemberVO();
            memberVO.setMemberId(memberId);
            memberList.add(memberVO);
        }
        reservService.increaseMemberOverdue(memberList);
        
        log.warn("============MemberOverDueUpdate 타임 아웃 종료=============");
    }
}
