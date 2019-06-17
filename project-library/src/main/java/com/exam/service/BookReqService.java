package com.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.BookRequestVO;

public interface BookReqService {
    
    public Object getItemsFromOpenApi(String pageNum, String type, String keyword) throws Exception;
    
    public int insertWishBook(BookRequestVO requestVO);
    
    public List<BookRequestVO> getWishList(@Param("startRow") int startRow, @Param("amount") int amount,
            @Param("memberId")String memberId, @Param("search")String search);
    
    public int updateWishList(BookRequestVO requestVO);
    
    public int getWishListCount(String memberId, String search);
    
}
