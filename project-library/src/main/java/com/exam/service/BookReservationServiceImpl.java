package com.exam.service;

import java.net.URLDecoder;
import java.nio.charset.Charset;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.exam.domain.BookReservationVO;
import com.exam.domain.ResTimeVO;
import com.exam.mapper.ReservationMapper;
import com.exam.mapper.TimeMapper;

import lombok.Setter;

@Service
public class BookReservationServiceImpl implements BookReservationService {
    
    @Setter(onMethod_ = @Autowired)
    private ReservationMapper resMapper;
    
    @Setter(onMethod_ = @Autowired)
    private TimeMapper timeMapper;
    
    
                //@Transactional
    
    
    @Override
    
    public int insertBookReservation(BookReservationVO bookReservationVO) {
        return resMapper.insertBookReservation(bookReservationVO);
    }
    
    @Override
    @Transactional
    public int insertBookReservationAndRental(BookReservationVO bookReservationVO, ResTimeVO resTimeVO) {
        resMapper.insertBookReservation(bookReservationVO);
        timeMapper.rentalBook(resTimeVO);
        return 1;
    }
    

    @Override
    public Object getItemsFromOpenApi(String pageNum, String type, String keyword) throws Exception {

        String url = "http://seoji.nl.go.kr/landingPage/SearchApi.do";
        String serviceKey = "10bf4272107bef2cd672e8780fca87d8";
        String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
        
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));    //Response Header to UTF-8  
        
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("cert_key", decodeServiceKey)
                .queryParam("result_style", "json")
                .queryParam("page_no", pageNum)
                .queryParam("page_size", 10)
                .queryParam(type, keyword)
                .queryParam("ebook_yn", "N")
                .build(false);    //자동으로 encode해주는 것을 막기 위해 false
        
        System.out.println(builder.toUriString());
        
        Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.POST, new HttpEntity<String>(headers), String.class);
        return response;
        
    }




}
