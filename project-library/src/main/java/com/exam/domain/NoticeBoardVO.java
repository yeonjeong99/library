package com.exam.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
    private int noticeNo;
    private String memberId;
    private String subject;
    private String content;
    private Date date;
}
