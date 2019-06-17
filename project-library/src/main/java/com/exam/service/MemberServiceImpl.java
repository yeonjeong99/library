package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.MemberAuthMapper;
import com.exam.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
    
    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;
    
    @Setter(onMethod_ = @Autowired)
    private MemberAuthMapper memberAuthMapper;

    @Override
    public int register(MemberVO memberVO) {
        return mapper.insert(memberVO);
    }

    @Override
    public int countById(String id) {
        return mapper.countById(id);
    }

    @Override
    public int loginCheck(String id, String password) {
        // *반환값 의미 // 아이디 불일치: -1 // 아이디 일치, 비밀번호 불일치: 0 // 아이디, 비밀번호 모두 일치: 1
        int check = -1;
        
        MemberVO memberVO = mapper.getMemberById(id);
        if(memberVO != null) {
            if (password.equals(memberVO.getPassword())) { // 비밀번호 일치
                check = 1;
            }else {
                check = 0; // 비밀번호 불일치
            }
        }else {
            check = -1; // 아이디 불일치
        }
        return check;
    }

    @Override
    public List<MemberVO> getAllMembers() {
        return mapper.getList();
    }

    @Override
    @Transactional
    public int insertMemberAndAuth(MemberVO memberVO, AuthVO authVO) {
        mapper.insert(memberVO);
        memberAuthMapper.insertMemberAuth(authVO);
        return 1;
    }
    
	@Override
	public MemberVO getMemberByIdTest(String id) {
		return mapper.getMemberByIdTest(id);
	}
    
	@Override
	public int updateMember(MemberVO member) {
        return mapper.updatemember(member);
	}

    @Override
    public MemberVO getMemberById(String memberId) {
        return mapper.getMemberById(memberId);
    }

    @Override
    public int updateMemberOverDue(String memberId) {
        return mapper.updateMemberOverDue(memberId);
    }
    
    @Override
    public MemberVO selectByEmail(String email) {
        return mapper.selectByEmail(email);
    }

    @Override
    public MemberVO selectByIdEmail(String id, String email) {
        return mapper.selectByIdEmail(id, email);
    }

    @Override
    public int passUpdate(String idDB, String password) {
        return mapper.passUpdate(idDB, password);
    }
}