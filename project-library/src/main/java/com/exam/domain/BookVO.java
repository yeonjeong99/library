package com.exam.domain;

import java.util.List;

import lombok.Data;

@Data
public class BookVO {
    private int bookNo;
    private String bookId;
    private String author;
    private String title;
    private String vol;
    private String publisher;
    private int pubYear;
    private int price;
    private String isbn;
    private int isbnSubCode;
    private BookReservationVO bookReservationVO;
}
