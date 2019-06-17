package com.exam.mapper;

import com.exam.domain.ResTimeVO;

public interface TimeMapper {
    
    public int rentalBook(ResTimeVO resTimeVO);

    public int deskReservation(ResTimeVO resTimeVO);
    
    public void deleteDeskReservTime();
    
    public int extensionDeskReservTime(String memberId);
    
    public ResTimeVO selectExtensionTime(String memberId);
    
    public int deleteResTime(String timeCode); // amdin에서 도서 반납 후 ResTime테이블을 비울 때 사용.
}
