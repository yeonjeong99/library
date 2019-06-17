package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.exam.domain.BoardVO;

public interface BoardMapper {
    
    public Integer getSeqBoardNum();
       
    public int insertBoard(BoardVO boardVO);
    //update나 delete는 행의 개수가 두개 이상이 될 수 있지만 insert는 하나만 나오기 때문에 void로 받을 수 있다.
    
    public List<BoardVO> getBoards (
            @Param("startRow") int startRow, 
            @Param("amount") int amount,
               @Param("search") String search);
    
    //@Select("SELECT COUNT(*) FROM board")
    public int getBoardCount( @Param("search") String search);
    
    
    //@Update("UPDATE board SET readcount = readcount+1 WHERE num=#{num}")
    public int updateReadcount(int num);
    
    //@Select("SELECT * FROM board WHERE num = #{num}")
    public BoardVO getBoard(int num);
    
    public int updateBoard(BoardVO board);
    
    public int deleteBoard(int num); // 글번호가 넘어가야함
    
    public int updateReplyGroupSeq(@Param("reRef") int reRef, @Param("reSeq") int reSeq);
}
