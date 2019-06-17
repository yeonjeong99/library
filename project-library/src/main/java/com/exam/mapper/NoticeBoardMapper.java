package com.exam.mapper;

import java.util.List;

import com.exam.domain.NoticeBoardVO;

public interface NoticeBoardMapper {

	public List<NoticeBoardVO> getNoticeBoard(String memberId);
	
	public NoticeBoardVO getdetailBoard(int noticeNo);
	
	public boolean getdelete(int noticeNo);
	
	                           
}
