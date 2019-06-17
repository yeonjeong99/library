package com.exam.service;

import com.exam.domain.BookReservationVO;
import com.exam.domain.ResTimeVO;

public interface BookReservationService {
    
    public Object getItemsFromOpenApi(String pageNum, String type, String keyword) throws Exception;
    //db 구현 후 db 가져오는 메서드필요함
    
    public int insertBookReservation(BookReservationVO bookReservationVO);
    
    public int insertBookReservationAndRental(BookReservationVO bookReservationVO,ResTimeVO resTimeVO);

}
