package com.exam.service;

import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.exam.domain.BookRequestVO;
import com.exam.mapper.BookRequestMapper;

import lombok.Setter;

@Service
public class BookReqServiceImpl implements BookReqService{
    
    @Setter(onMethod_ = @Autowired)
    private BookRequestMapper requestMapper;

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

    @Override
    public int insertWishBook(BookRequestVO requestVO) {
        return requestMapper.insertWishBook(requestVO);
    }

    @Override
    public List<BookRequestVO> getWishList(@Param("startRow") int startRow, @Param("amount") int amount,
            @Param("memberId")String memberId, @Param("search")String search) {
        
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+requestMapper.getWishList(startRow, amount, memberId, search));
        
        return requestMapper.getWishList(startRow, amount, memberId, search);
    }

    @Override
    public int updateWishList(BookRequestVO requestVO) {
        return requestMapper.updateWishList(requestVO);
    }

    @Override
    public int getWishListCount(String memberId, String search) {
        return requestMapper.getWishListCount(memberId, search);
    }
    
    

}
