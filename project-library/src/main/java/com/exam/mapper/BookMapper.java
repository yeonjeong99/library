package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookSearchDTO;
import com.exam.domain.BookVO;

public interface BookMapper {
    public List<BookVO> getBookList (
            @Param("startRow") int startRow, 
            @Param("amount") int amount,
               @Param("bookSearchDTO") BookSearchDTO bookSearchDTO);
    
    public int getBookCount( @Param("bookSearchDTO") BookSearchDTO bookSearchDTO);
    
    public BookVO getBookInfo(String bookCode);
    
    public int bookLogInsert(BookLogVO bookLogVO);
    
    public List<BookVO> getBookRentalInfo(@Param("bookCode")String bookCode);
    
    public List<BookLogVO> getBookRentalRank();
}
