package com.exam.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.domain.NoticeBoardVO;
import com.exam.service.NoticeboardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/noticeBoard/*")
public class NoticeboardController {

	@Setter(onMethod_ = @Autowired)
	private NoticeboardService service;

	@GetMapping("/notifyform")
	public String notifyform(String memberId, Model model) {
		System.out.println("memberId : " + memberId);

		List<NoticeBoardVO> list = service.getNoticeBoard(memberId);
		model.addAttribute("list", list);

		for (NoticeBoardVO vo : list) {
			System.out.println(vo);
		}

		return "noticeBoard/notifyform";
	}

	@GetMapping("/detail")
	public void detail(@RequestParam int noticeNo, Model model) {
		System.out.println("noticeNo" + noticeNo);

		NoticeBoardVO detail = service.getdetailBoard(noticeNo);

		model.addAttribute("detail", detail);
		System.out.println("detail : " + detail);

	}

	@PostMapping("/delete") // /noticeBoard/delete
	public String delete(int noticeNo,Principal pri) {
		System.out.println("delete...");
		System.out.println("noticeNo : " + noticeNo);

		boolean isSuccess = service.getdelete(noticeNo);

		/*
		 * if (!isSuccess) { // // 글 삭제 실패 HttpHeaders headers = new HttpHeaders();
		 * headers.add("Content-Type", "text/html; charset=UTF-8");
		 * 
		 * StringBuilder sb = new StringBuilder(); sb.append("<script>");
		 * sb.append("alert('글비밀번호가 틀립니다.');"); sb.append("history.back();");
		 * sb.append("</script>");
		 * 
		 * return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK); }
		 * 
		 * // 글 삭제 성공 이후 글목록으로 리다이렉트 HttpHeaders headers = new HttpHeaders();
		 * headers.add("Location", "/noticeBoard/notifyform"); // redirect 경로 위치 return
		 * new ResponseEntity<String>(headers, HttpStatus.FOUND);
		 */
		String memberId = pri.getName();
		System.out.println(pri.getName());
		return "redirect:/noticeBoard/notifyform?memberId="+memberId;
	}
}
