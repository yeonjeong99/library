package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.BookRequestVO;

public interface BookRequestMapper {
    public int insertWishBook(BookRequestVO requestVO);
    
    public List<BookRequestVO> getWishList(@Param("startRow") int startRow, @Param("amount") int amount,
            @Param("memberId")String memberId, @Param("search")String search);
    
    public int updateWishList(BookRequestVO requestVO);
    
    public int getWishListCount(@Param("memberId")String memberId, @Param("search")String search);
}
