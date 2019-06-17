package com.exam.controller;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.core.RemoveTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.MemberMapper;
import com.exam.service.MemberService;

import lombok.Setter;
//import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")

/* @PreAuthorize("isAuthenticated()")
 * 로그인 했을 때만 접속이 가능하게 하는 애노테이션 */

public class MemberController {
    
    @Setter(onMethod_ = @Autowired)
    private ServletContext application;
    
    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder passwordEncoder;

    @Setter(onMethod_ = @Autowired)
    private MemberService service;
    
    @InitBinder                                                                         /* 이거 뭐하는거지 ?? */
    public void initNinder(WebDataBinder binder) {
        binder.registerCustomEditor(Timestamp.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {

                if (text == null || text.equals("")) { // "".equals(text)
                    setValue(null);
                    return;
                }
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                try {
                    Date parsedDate = dateFormat.parse(text);
                    setValue(new Timestamp(parsedDate.getTime()));
                } catch (ParseException e) {
                    e.printStackTrace();
                    setValue(null);
                }
            }
        });
    }

    @GetMapping("/join")
    public String joinForm() {
        System.out.println("join() get 호출");
        return "member/join";
    } // 회원가입 화면

    @PostMapping("/join")
    public ResponseEntity<String> join(MemberVO memberVO,AuthVO authVO, HttpServletRequest request) {
        System.out.println("join() post 호출");
        /* 패스워드 암호화 하는 구문. 스프링이 알아서 해주니까 우린 이걸 쓰면 된다. 와우 리을리? */
        String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
        memberVO.setPassword(encodedPassword);
        
        authVO.setId(memberVO.getMemberId());
//      service.register(memberVO); // 트렌젝션 처리로 더이상 필요없음.
        service.insertMemberAndAuth(memberVO, authVO);
        System.out.println(memberVO);
        System.out.println(authVO);

        // return "redirect:/member/loginForm";
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "text/html; charset=UTF-8");
        StringBuilder sb = new StringBuilder();
        sb.append("<script>");
        sb.append("alert('회원가입이 완료되었습니다.');");
        sb.append("location.href = '/book/member/login';");
        sb.append("</script>");
        
        ResponseEntity<String> responseEntity = new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
        return responseEntity;
    } // 회원가입 프로세스

    @GetMapping("/login")
    public String login(String error, String logout, Model model) {
        System.out.println("login() get 호출");    
        log.info("error : " + error);
        log.info("logout : " + logout);
        
        if (error != null) {
            model.addAttribute("error", "아이디 혹은 비밀번호가 정확하지 않습니다.");
        }
        if (logout != null) {
            model.addAttribute("logout", "Logout Success");
        }
        return "member/login";
    } // 로그인 화면

//    @PostMapping("/login")  /* 로그인 post의 경우 security에서 처리하기 때문에 직접 사용할 필요가 없다. */
//    로그아웃의 경우도 security가 처리하기 때문에 필요없다.

    @GetMapping("/joinIdCheck")
    public String joinIdCheck(@RequestParam("userid") String userid, Model model) {
        System.out.println("joinIdCheck() get 호출");
        /* request parameter 이름과 매개 변수 이름이 일치 할 경우 생략 가능 */
        int count = service.countById(userid);
        //      count == 1  아이디 있음. "사용중인 아이디 입니다."
        //      0  아이디 없음. "사용가능한 ID입니다."
        boolean isDuplicated = false;
        if (count > 0) {
            isDuplicated = true;
        }
        // ID중복확인 결과값을 request 객체에 저장함.
        model.addAttribute("isDuplicated", isDuplicated);
        return "member/joinIdCheck";
    } // 회원가입 시 아이디 체크
    
    @GetMapping("/joinIdCheckJson")                                  /* 현재 json으로 체크하고있지 않음. 이거 나중에 고쳐둬야함. */
    public @ResponseBody boolean joinIdCheckJson(String userid) {
        int count = service.countById(userid);
        //      count == 1  아이디 있음. "사용중인 아이디 입니다."
        //      0  아이디 없음. "사용가능한 ID입니다."
        boolean isDuplicated = false;
        if (count > 0) {
            isDuplicated = true;
        }
        return isDuplicated;
    } // 회원가입 시 아이디 체크
    
    

    @GetMapping("/memberInfoUpdate") /* 회원정보수정 진입시 비밀번호 매칭 */
    public String memberInfoUpdate (String error, Model model) {
        log.info("memberInfoUpdate get() 호출 (비밀번호를 입력하고 수정창으로 가기위한 전입화면)");
        if (error != null) {
            model.addAttribute("error", "에에러가 발생했스요.");
        }
        
        System.out.println("======================================수정 필요. 에러메시지 출력안됨===============================================");
        System.out.println("======================================수정 필요. 에러메시지 출력안됨===============================================");        
        
        return "library_myPage/memberInfoUpdate";
    }
    
    @PostMapping("/memberInfoUpdate") /* 회원정보수정 진입시 비밀번호 매칭 */
    public String memberInfoUpdate(String error, MemberVO tempVO, Model model) {
        log.info("memberInfoUpdate post() 호출 (비밀번호를 입력하고 수정창으로 가기위한 전입화면)" );
//        log.info("memberVO.getMemberId()::"+tempVO.getMemberId());
//        log.info("memberVO.getPassword()::"+tempVO.getPassword());
        
        MemberVO memberVO = service.getMemberById(tempVO.getMemberId());
        log.info("memberVO::"+memberVO);
        log.info("tempVO::"+tempVO);
        
        boolean check2 = passwordEncoder.matches(tempVO.getPassword(), memberVO.getPassword());
        
        if(!check2) {
          return "library_myPage/memberInfoUpdate";
        }
        model.addAttribute("memberVO",memberVO);
        return "library_myPage/memberupdate";
    }
    
    @GetMapping("/memberupdate")
    public String memberupdate (String id, Model model) {
        log.info("memberupdate get() 호출" );
    	System.out.println(id);
    	
    	MemberVO memberVO = service.getMemberByIdTest(id);
    	
    	log.info("detail memberVO : " + memberVO);
    	model.addAttribute("memberVO", memberVO);
        return "library_myPage/memberupdate";
    }
    
    @PostMapping("/memberupdate")
    public ResponseEntity<String> memberupdateform(MemberVO memberVO, String id, Model model) {
        String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
        memberVO.setPassword(encodedPassword);

    	int isSuccess = service.updateMember(memberVO);
    	System.out.println("컨트롤러 체크:: "+isSuccess);
    	
    	if (isSuccess == 0) { // // 업데이트 실패시
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "text/html; charset=UTF-8");

            StringBuilder sb = new StringBuilder();
            sb.append("<script>");
            sb.append("alert('수정 실패. 관리자에게 문의하세요.');");
            sb.append("history.back();");
            sb.append("</script>");

            return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
        }
    	HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "/book/member/myView?id="+ memberVO.getMemberId()); // redirect 경로 위치
        return new ResponseEntity<String>(headers, HttpStatus.FOUND);
    }
    // 아이디찾기 화면
    @GetMapping("/findIdForm")
    public String findIdForm() {     // 아이디찾기 화면
        System.out.println("findIdForm() 호출");
        return "member/findIdForm";
    } 
    
    @GetMapping("/idCheck")
    public void idCheck (String id, Model model) {
        model.addAttribute("id", id);
    }
    
    @PostMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam("email") String email, Model model, MemberVO memberVO) {
        /* request parameter 이름과 매개 변수 이름이 일치 할 경우 생략 가능 */
        System.out.println("email : " + email);

        List<MemberVO> list = service.getAllMembers();
        String email1 = "";
        String id = null;
        for (MemberVO mem : list) {
            email1 = mem.getEmail();
            if (email.equals(email1)) {
                model.addAttribute("id", id);
                id = mem.getMemberId();
                break;
            }
        }
        return id;
    }
    
    // 비밀번호 찾기 화면
    @GetMapping("/findPwForm")
    public String findPwForm(String error,Model model) {
        System.out.println("findPwForm() 호출");
        
        if (error != null) {
            model.addAttribute("error", "아이디와 이메일이 일치하지 않습니다.");
        }
        return "member/findPwForm";
    }
    
    @PostMapping("/pwCheck")
    public String pwCheck(@RequestParam("email") String email, @RequestParam("username") String id, Model model,
            MemberVO memberVO) {
        /* request parameter 이름과 매개 변수 이름이 일치 할 경우 생략 가능 */
        System.out.println("pwCheck() post 호출");
        List<MemberVO> list = service.getAllMembers();
        String emailDB = "";
        String idDB = "";
        String result = "";
        
        System.out.println("가져온 이메일과 아이디:: "+email+id);
        for (MemberVO mem : list) {
            emailDB = mem.getEmail();
            idDB = mem.getMemberId();
            
            if (emailDB.contentEquals(email) && idDB.equals(id)) {
                model.addAttribute("idDB", idDB);
                return "/member/pwCheck";
            } 
        }
            result = "아이디와 이메일이 일치하지 않습니다.";
            model.addAttribute("result",result);
            return "/member/findPwForm";
    }
    
    @PostMapping("/passUpdate")
    public String passUpdate(String idDB,String password) {
        System.out.println(idDB+" : "+password+"==============");
        String encodedPassword = passwordEncoder.encode(password); //패스워드 인코더 
        int passUpdate= service.passUpdate(idDB, encodedPassword);
        System.out.println(passUpdate+": passUpdate"); // 왜 1이 아닌 다른 실수값을 반환하는지는 모르겠음. 업데이트류가 전부 이렇게 돔.
        return "/member/login";
    }
    
    @GetMapping("/myView")
    public String myView(String id, Model model) {
        
        log.info("myView() 호출");
        System.out.println(id);
        MemberVO memberVO = service.getMemberByIdTest(id);
        
        log.info("detail memberVO : " + memberVO);
        model.addAttribute("memberVO", memberVO);
        
        return "library_myPage/mypage";
    }
}

