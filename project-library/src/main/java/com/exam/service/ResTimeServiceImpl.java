package com.exam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.domain.ResTimeVO;
import com.exam.mapper.TimeMapper;

import lombok.Setter;
@Service
public class ResTimeServiceImpl implements ResTimeService {
    
    @Setter(onMethod_ = @Autowired)
    private TimeMapper timeMapper;

    @Override
    public int rentalBook(ResTimeVO resTimeVO) {
        return timeMapper.rentalBook(resTimeVO);
    }

    @Override
    public int deleteResTime(String timeCode) {
        String bookTimeCode = "book"+timeCode;
        return timeMapper.deleteResTime(bookTimeCode);
    }

}

