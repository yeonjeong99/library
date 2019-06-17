package com.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.domain.AdminVO;
import com.exam.domain.AttachVO;
import com.exam.domain.BookLogVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.BookVO;
import com.exam.domain.MemberVO;
import com.exam.domain.ResTimeVO;
import com.exam.mapper.AdminMapper;
import com.exam.mapper.AttachMapper;
import com.exam.mapper.BookMapper;
import com.exam.mapper.MemberMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
    
    @Setter(onMethod_ = @Autowired)
    private AdminMapper mapper;
    
    @Setter(onMethod_ = @Autowired)
    private BookService bookService;
    
    @Setter(onMethod_ = @Autowired)
    private BookMapper bookMapper;
    
    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;
    
    @Setter(onMethod_ = @Autowired)
    private ReservationService reservationService;
    
    @Setter(onMethod_ = @Autowired)
    private ResTimeService resTimeService;
    
    @Setter(onMethod_ = @Autowired)
    private AttachMapper attachMapper;
    
    @Override
    public List<MemberVO> adminMemberList() {
        return mapper.adminMemberList();
    }

    @Override
    public BookReservationVO selectbookReservationAndTime(String BookCode) {
        return mapper.selectbookReservationAndTime(BookCode);
    }

    @Override
    @Transactional
    public int bookReturnProcess(String bookCode, String memberId, boolean isDuty) {
        
        
        BookVO bookVO = bookService.getBookInfo(bookCode);
        System.out.println("책정보 받아오기");
        BookLogVO bookLogVO = new BookLogVO();
        bookLogVO.setBookNo(bookCode);
        bookLogVO.setAuthor(bookVO.getAuthor());
        bookLogVO.setTitle(bookVO.getTitle());
        bookLogVO.setVol(bookVO.getVol());
        bookLogVO.setPublisher(bookVO.getPublisher());
        bookLogVO.setMemberId(memberId);
        
        bookMapper.bookLogInsert(bookLogVO);
        System.out.println("책정보 로그db에 넣기");
        
        reservationService.deleteReservation(bookCode);
        System.out.println("대여된 유저정보 db에서 삭제하기");
        
        resTimeService.deleteResTime(bookCode);
        System.out.println("대여된 시간정보 db에서 삭제하기");
        
        MemberVO memberVO = memberService.getMemberById(memberId);
        System.out.println("유저정보 가져오기");
        if (memberVO.getBookOverdue()>0) { // 맴버의 연체 정보가 있는 경우
            System.out.println("연체정보 업데이트");
            if (isDuty == true) {//체크박스 값이 연체 ok 인경우
                memberService.updateMemberOverDue(memberId);
                
               }
        } 
        System.out.println("성공!");
        return 1;
    }
    /*============================ 공지사항 게시판 관련 =============================*/
    @Override
    public List<MemberVO> adminMemberIdSearch(@Param("memberId") String memberId) {
        return mapper.adminMemberIdSearch(memberId);
    }
    
    @Override
    @Transactional
    public int bookRentalProcess(String bookCode, String memberId) {
        
        BookReservationVO bookReservationVO = new BookReservationVO();
        ResTimeVO resTimeVO = new ResTimeVO();
        String book_code = "book"+bookCode;
        
        bookReservationVO.setMemberId(memberId);
        bookReservationVO.setBookCode(book_code);
        bookReservationVO.setBookStatus(1);
        bookReservationVO.setBookExtension(0);
        System.out.println("bookReservationVO::"+bookReservationVO);
        
        resTimeVO.setTimeCode(book_code);
        System.out.println("resTimeVO::"+resTimeVO);
        
        reservationService.insertBookReservationAndRental(bookReservationVO, resTimeVO);
        
        return 1;
    }
    
    

    @Override
    public int getSeqBoardNum() {
        /*
         * Integer num = mapper.getSeqBoardNum(); if(num == null) { num = 1;
         * 
         * }
         * 
         * return num;
         */
        
        //기존 최대값 +1로 글번호 생성하기
        return mapper.getSeqBoardNum();
    } 
    
    @Override
    public int insert(AdminVO adminVO) {
        
        
        return mapper.insertBoard(adminVO); // 주글 등록
    }

    @Override
    public List<AdminVO> getBoards(int startRow, int amount, String search) {
        return mapper.getBoards(startRow, amount, search);
    }

    @Override
    public int getBoardCount(String search) {
        return mapper.getBoardCount(search);
    }

    @Override
    public int updateReadcount(int num) {
        return mapper.updateReadcount(num);
    }

    @Override
    public AdminVO getBoard(int num) {
        return mapper.getBoard(num);
    }

    @Override
    public boolean updateBoard(AdminVO admin) {
        boolean isSuccess = false;
        
        AdminVO dbAdmin = mapper.getBoard(admin.getNum());
        
        if (admin.getPass().equals(dbAdmin.getPass())) {
            mapper.updateBoard(admin);
            isSuccess = true;
        } else {
            isSuccess = false;
        }
        
        return isSuccess;
    }

    @Override
    public boolean deleteBoard(int num, String pass) {
        boolean isSuccess = false;
        
        AdminVO dbAdmin = mapper.getBoard(num);
        
        if (pass.equals(dbAdmin.getPass())) {
            mapper.deleteBoard(num);
            isSuccess = true;
        } else {
            isSuccess = false;
        }
        
        return isSuccess;
    }

    @Transactional
    @Override
    public void replyInsert(AdminVO admin) {
        // 1) 기존 답글들의 순서(re_seq) 재배치
        mapper.updateReplyGroupSeq(admin.getReRef(), admin.getReSeq());
        
        
        int num = mapper.getSeqBoardNum(); // 글번호
        admin.setNum(num);
        // re_lev 는 [답글을 다는 대상글]의 들여쓰기값 + 1
        admin.setReLev(admin.getReLev() + 1);
        // re_seq 는 [답글을 다는 대상글]의 글그룹 내 순번값 + 1
        admin.setReSeq(admin.getReSeq() + 1);
        // 답글 조회수 0
        admin.setReadcount(0);
        
        mapper.insertBoard(admin);
    }

    @Transactional
    @Override
    public void insertBoardAndAttach(AdminVO admin, List<AttachVO> attachList) {
        // 파일게시판 주글 등록
        mapper.insertBoard(admin);
        
        if (attachList.size() > 0) { // 첨부파일 있으면
            for (AttachVO attachVO : attachList) {
                // 첨부파일 정보 등록
                attachMapper.insert(attachVO);
            }
        }
    }// insertBoardAndAttach()

    @Override
    public List<AttachVO> findByBnum(int bnum) {
        return attachMapper.findByBnum(bnum);
    }

    @Transactional
    @Override
    public void deleteBoardAndAttach(int num) {
        mapper.deleteBoard(num);
        
        attachMapper.deleteByBoardNum(num);
        
    }
    /*============================ 공지사항 게시판 관련 =============================*/
}
