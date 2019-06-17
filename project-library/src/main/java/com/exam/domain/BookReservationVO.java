package com.exam.domain;

import lombok.Data;

@Data
public class BookReservationVO {
    int bookResNo;
    String bookCode;
    String memberId;
    int bookExtension;
    int bookStatus;
    private ResTimeVO resTimeVO;
}
