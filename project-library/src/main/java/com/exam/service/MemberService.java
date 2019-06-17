package com.exam.service;

import java.util.List;

import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;

public interface MemberService {
    
    public int register(MemberVO memberVO);
    
    public int countById(String id);
    
    public int loginCheck(String id, String password);
    
    public List<MemberVO> getAllMembers(); 
    
    public int insertMemberAndAuth(MemberVO memberVO, AuthVO authVO);
    
    public int updateMember(MemberVO memberVO);
	
    public MemberVO getMemberByIdTest(String id);
    
    public MemberVO getMemberById(String memberId);
    
    public int updateMemberOverDue(String memberId);
    
    public MemberVO selectByEmail(String email);

    public MemberVO selectByIdEmail(String id, String email);

    public int passUpdate(String idDB, String password);
    //??
}
