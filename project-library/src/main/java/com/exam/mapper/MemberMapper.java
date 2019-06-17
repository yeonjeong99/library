package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//import org.apache.ibatis.annotations.Select;

import com.exam.domain.MemberVO;

public interface MemberMapper {

    public int insert(MemberVO member);
    
    //@Select("SELECT * FROM member ORDER BY id")
    public List<MemberVO> getList();
    
    public MemberVO getMemberById(String id);

    public MemberVO getMemberAndAuthById(String id);
    
    public int delete(String id);
    
    public int update(MemberVO member);

    public int countById(String id);
    
    public int updatemember(MemberVO member);
    
    public MemberVO getMemberByIdTest(String id);
    
    public MemberVO selectByEmail(String email);
    
    public MemberVO selectByIdEmail(String id, String email);
    
    public int passUpdate(@Param("idDB")String idDB, @Param("password")String password);
    
    public int updateMemberOverDue(String memberId);

}
