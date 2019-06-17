package com.exam.service;

import java.util.List;

import com.exam.domain.NoticeBoardVO;

public interface NoticeboardService {

	public List<NoticeBoardVO> getNoticeBoard(String memberId);
	
	public NoticeBoardVO getdetailBoard(int noticeNo);

	public boolean getdelete(int noticeNo);


}
