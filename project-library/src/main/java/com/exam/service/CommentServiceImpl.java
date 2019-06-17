package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.domain.CommentVO;
import com.exam.mapper.BoardMapper;
import com.exam.mapper.CommentMapper;

import lombok.Setter;

@Service
public class CommentServiceImpl implements CommentService {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;
    
    @Setter(onMethod_ = @Autowired)
    private CommentMapper replyMapper;
    
    @Override
    public List<CommentVO> commentList(String bno) {
        return replyMapper.list(bno);
    }

    @Override
    public int create(CommentVO commentVO) {
//        System.out.println("코멘트 create 뷸러옴");
//        System.out.println("commentVO.getCno():::: "+commentVO.getCno());
//        commentVO.setReRef(commentVO.getCno());
        return replyMapper.create(commentVO);
    }

    @Override
    public int update(CommentVO commentVO)  {
        return replyMapper.update(commentVO);
        
    }

    @Override
    public int delete(int cno) {
        return replyMapper.delete(cno);
    }

    @Override
    public int selectreply() {
        
        return replyMapper.selectreply();
    }
    @Transactional
    @Override
    public int replyinsert(CommentVO commentVO) {
        replyMapper.updateReplyGroupSeq(commentVO.getReRef(), commentVO.getReSeq());
        
        int num = replyMapper.selectreply(); // 댓글번호
        
        commentVO.setReRef(commentVO.getReRef());
        // re_lev는 [답글을 다는 대상글]의 들여쓰기 값 
        commentVO.setReLev(commentVO.getReLev()+1);
        // re_seq는 [답글을 다는 대상글]의 글 그룹 내 순번값
        commentVO.setReSeq(commentVO.getReSeq()+1);
        
        return replyMapper.create(commentVO);
        
    }


    
    

    
    
    
}
