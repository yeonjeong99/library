package com.exam.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ResTimeVO {
    String timeCode;
    Date startTime;
    Date endTime;
}
