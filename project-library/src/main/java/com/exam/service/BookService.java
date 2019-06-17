package com.exam.service;

import java.util.List;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookSearchDTO;
import com.exam.domain.BookVO;

public interface BookService {
    public List<BookVO> getBookList (int startRow, int amount, BookSearchDTO bookSearchDTO);
    
    public int getBookCount(BookSearchDTO bookSearchDTO);
    
    public BookVO getBookInfo(String bookCode); 
    
    public List<BookVO> getBookRentalInfo(String bookCode);
    
    public List<BookLogVO> getBookRentalRank();
}
