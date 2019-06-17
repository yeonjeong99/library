package com.exam.service;

import com.exam.domain.ResTimeVO;

public interface ResTimeService {
    
    public int rentalBook(ResTimeVO resTimeVO);
    
    public int deleteResTime(String timeCode);

}
