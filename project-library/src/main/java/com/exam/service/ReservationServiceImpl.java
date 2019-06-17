package com.exam.service;

import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.MemberVO;
import com.exam.domain.NoticeBoardVO;
import com.exam.domain.ReadingRoomVO;
import com.exam.domain.ResTimeVO;
import com.exam.mapper.ReservationMapper;
import com.exam.mapper.TimeMapper;

import lombok.Setter;

@Service
public class ReservationServiceImpl implements ReservationService {
    
    @Setter(onMethod_ = @Autowired)
    private ReservationMapper resMapper;
    
    @Setter(onMethod_ = @Autowired)
    private TimeMapper timeMapper;
    
    @Setter(onMethod_ = @Autowired)
    private ReservationMapper reservationMapper;
    @Override
    
    public int insertBookReservation(BookReservationVO bookReservationVO) {
        return resMapper.insertBookReservation(bookReservationVO);
    }
    
    @Override
    @Transactional
    public int insertBookReservationAndRental(BookReservationVO bookReservationVO, ResTimeVO resTimeVO) {
        resMapper.insertBookReservation(bookReservationVO);
        timeMapper.rentalBook(resTimeVO);
        return 1;
    }

    @Transactional
    @Override
    public int updateDeskReservationAndTime(ReadingRoomVO roomVO, ResTimeVO timeVO) {
        
        int desk = resMapper.updateDeskReservation(roomVO);
        int time = timeMapper.deskReservation(timeVO);
        
        System.out.println("=================== desk: "+desk+"============== time: "+time);
        int result = 0;
        if(desk!=0 && time !=0) {
            result = 1;
        }
        return result;
    }
    
    @Transactional
    @Override
    public void endDeskReservationAndTime() {
        resMapper.endDeskReservation();
        timeMapper.deleteDeskReservTime();
    }
    
    @Override
    public List<ReadingRoomVO> getReadingRoom() {
        return resMapper.getReadingRoom();
    }
    
    @Override
    public int extensionDeskReservTime(String memberId) {
        return timeMapper.extensionDeskReservTime(memberId);
    }

    @Override
    public int countReadingRoomById(String memberId) {
        return resMapper.countReadingRoomById(memberId);
    }
    
    @Override
    public ResTimeVO selectExtensionTime(String memberId) {
        return timeMapper.selectExtensionTime(memberId);
    }

    @Override
    public List<BookReservationVO> overdueMemberId() {
        return resMapper.overdueMemberId();
    }
    
    @Autowired
    SqlSessionTemplate batchSqlSessionTemplate;
    @Transactional
    @Override
    public void insertOverdueNotice(List<NoticeBoardVO> noticeList) {
        if (noticeList.size()>0) {
            
            for (NoticeBoardVO noticeBoardVO : noticeList) {
                batchSqlSessionTemplate.insert("com.exam.mapper.ReservationMapper.insertOverdueNotice", noticeBoardVO);
               
            }
            batchSqlSessionTemplate.flushStatements();
        }
    }
    
    @Override
    public int deleteReservation(String bookCode) {
        String tempbookCode = "book"+bookCode;
        reservationMapper.deleteReservation(tempbookCode);
        return 1;
    }
    
    @Override
    public List<BookReservationVO> getOverdueMemberIdRentalBook() {
        return reservationMapper.getOverdueMemberIdRentalBook();
    }

    @Override
    @Transactional
    public int increaseMemberOverdue(List<MemberVO> memberList) {
        int isSuccess=0;
        if (memberList.size()>0) {
            
            for (MemberVO memberVO : memberList) {
                isSuccess = batchSqlSessionTemplate.update("com.exam.mapper.ReservationMapper.increaseMemberOverdue", memberVO);
                if (isSuccess !=0){
                    isSuccess=1;
                }
            }
            batchSqlSessionTemplate.flushStatements();
        }
        
        return isSuccess;
    }

    @Override
    public List<BookReservationVO> reservationMemberAllSearch() {
        return reservationMapper.reservationMemberAllSearch();
    }

    @Override
    public List<BookLogVO> getAllBookHistoryList() {
        return reservationMapper.getAllBookHistoryList();
    }

    @Override
    public int getBookisRental(String bookCode) {
        return reservationMapper.getBookisRental(bookCode);
    }

    @Override
    public int getMemberRentalCount(String memberId) {
        return reservationMapper.getMemberRentalCount(memberId);
    }
    
    

}
