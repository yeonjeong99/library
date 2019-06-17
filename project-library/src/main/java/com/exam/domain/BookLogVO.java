package com.exam.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BookLogVO {

    private int bookLogNo;         // auto increment 번호
    private String bookNo;     // 책 번호. bookCode
    private String author;     // 책 저자
    private String title;  // 책 제목
    private String vol;  // 책 권차
    private String publisher; // 출판사
    private String memberId; // 대여한 유저 아이디
    private Timestamp returnDate;  // 반납일
    private int rentalCount; //대여한 수
}
