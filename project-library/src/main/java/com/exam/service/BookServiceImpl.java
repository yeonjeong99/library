package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.domain.BookLogVO;
import com.exam.domain.BookSearchDTO;
import com.exam.domain.BookVO;
import com.exam.mapper.BookMapper;

import lombok.Setter;
@Service
public class BookServiceImpl implements BookService {
    
    @Setter(onMethod_ = @Autowired)
    private BookMapper bookMapper;

    @Override
    public List<BookVO> getBookList(int startRow, int amount, BookSearchDTO bookSearchDTO) {
        return bookMapper.getBookList(startRow, amount, bookSearchDTO);
    }

    @Override
    public int getBookCount(BookSearchDTO bookSearchDTO) {
        return bookMapper.getBookCount(bookSearchDTO);
    }

    @Override
    public BookVO getBookInfo(String bookCode) {
        return bookMapper.getBookInfo(bookCode);
    }

    @Override
    public List<BookVO> getBookRentalInfo(String bookCode) {
        return bookMapper.getBookRentalInfo(bookCode);
    }

    @Override
    public List<BookLogVO> getBookRentalRank() {
        return bookMapper.getBookRentalRank();
    }

}
