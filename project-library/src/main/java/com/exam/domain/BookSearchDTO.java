package com.exam.domain;

import lombok.Data;

@Data
public class BookSearchDTO {
   private String searchTypeA;
   private String searchKeywordA;
   private String searchJoinA;
   
   private String searchTypeB;
   private String searchKeywordB;
   private String searchJoinB;
   
   private String searchTypeC;
   private String searchKeywordC;
}
