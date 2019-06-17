package com.exam.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
    private int cno;
    private int bno;
    private String comment;
    private String writer;
    private int reRef;
    private int reLev;
    private int reSeq;
    private int commentCount;
    private Timestamp regDate;
}
