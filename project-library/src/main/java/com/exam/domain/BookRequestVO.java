package com.exam.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookRequestVO {
    private int wishNo; 
    private String memberId; 
    private String isbn;
    private String wishCause;
    private String wishResult;
    private int wishStatus;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regDate;
    
    private String bookTitle;
    private String bookAuthor;
    private String bookPublisher;
}
