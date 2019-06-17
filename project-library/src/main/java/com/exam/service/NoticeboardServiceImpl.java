package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.domain.NoticeBoardVO;
import com.exam.mapper.NoticeBoardMapper;

import lombok.Setter;

@Service
public class NoticeboardServiceImpl implements NoticeboardService{

    @Setter(onMethod_ = @Autowired)
    private NoticeBoardMapper mapper;

	@Override
	public List<NoticeBoardVO> getNoticeBoard(String memberId) {
		return mapper.getNoticeBoard(memberId);
	}

	@Override
	public NoticeBoardVO getdetailBoard(int noticeNo) {
		
		return mapper.getdetailBoard(noticeNo);
	}

	@Override
	public boolean getdelete(int noticeNo) {
		
		return mapper.getdelete(noticeNo);
	}
	
	
	


}
