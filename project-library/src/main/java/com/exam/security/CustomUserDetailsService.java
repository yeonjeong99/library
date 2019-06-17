package com.exam.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.MemberMapper;
import com.exam.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
    
    @Setter(onMethod_ = @Autowired)
    private MemberMapper memberMapper ;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 스프링 시큐리티에서 username은 아이디 를 말한다.
        log.warn("username :::: " + username);
        
        MemberVO member = memberMapper.getMemberAndAuthById(username); // 아이디에 해당하는 레코드 가져오기
        log.warn("member ::::"+member);
        
        String id = member.getMemberId();
        String password = member.getPassword();
        
        List<AuthVO> authList = member.getAuthList();
        
        List<SimpleGrantedAuthority> list = new ArrayList<SimpleGrantedAuthority>();
        
        for (AuthVO auth : authList) {
            list.add(new SimpleGrantedAuthority(auth.getAuth()));
        }
        
        CustomUser customuser = new CustomUser(id, password, list, member);
        
        return customuser;
    }

}
