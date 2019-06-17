package com.exam.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.exam.domain.AdminVO;
import com.exam.domain.AttachVO;
import com.exam.domain.BookLogVO;
import com.exam.domain.BookRequestVO;
import com.exam.domain.BookReservationVO;
import com.exam.domain.BookVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.AdminMapper;
import com.exam.service.AdminService;
import com.exam.service.AttachService;
import com.exam.service.BookReqService;
import com.exam.service.BookService;
import com.exam.service.MemberService;
import com.exam.service.ResTimeService;
import com.exam.service.ReservationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
    
    @Setter(onMethod_ = @Autowired)
    private BookReqService bookReqService;
    
    @Setter(onMethod_ = @Autowired)
    private BookService bookService;

    @Setter(onMethod_ = @Autowired)
    private AdminService adminService;
    
    @Setter(onMethod_ = @Autowired)
    private ReservationService reservationService;
    
    @Setter(onMethod_ = @Autowired)
    private AttachService attachService;
    
    @GetMapping("/bookRequestList")
    public String bookRequestResult() {
        
        return "admin/bookRequestList";
        
    }
    @Secured("ROLE_ADMIN")
    @PostMapping("/bookRequestUpdate")
    @ResponseBody
    public int updateWishList(BookRequestVO requestVO) {
        System.out.println("================================================");
        log.info(requestVO);
        System.out.println("================================================");
        int isSuccess = bookReqService.updateWishList(requestVO);
        
        return isSuccess;
    }
    
    //관리자 페이지
    @Secured("ROLE_ADMIN")
    @GetMapping("/adminPage") 
    public String adminPage() {
        return "admin/adminPage";
    }
    
    @Secured("ROLE_ADMIN")
    //멤버 리스트 페이지
    @GetMapping("/adminMemberList") 
    public String adminMemberList(Model model) {
        List<MemberVO> list = adminService.adminMemberList();
        model.addAttribute("list", list);
        return "admin/adminMemberList";
    }
    
    @Secured("ROLE_ADMIN")
    @GetMapping("/adminBookReturn")
    public String adminBookReturn() {
        System.out.println("adminBookReturn get 호출");
        return "admin/adminBookReturn";
    }
    
    @Secured("ROLE_ADMIN")
    @PostMapping("/adminBookReturn")
    @ResponseBody
    public BookReservationVO adminBookReturn(BookReservationVO bookReservationVO, String bookCode) {
        System.out.println("adminBookReturn post 호출");
        System.out.println("bookCode::" +bookCode);
        
        bookReservationVO.setBookCode(bookCode);
        bookReservationVO = adminService.selectbookReservationAndTime(bookCode);
        System.out.println(bookReservationVO);
        return bookReservationVO;
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @PostMapping("/adminBookReturnResult")
    public int adminUpdateBookStatus(String bookCode, String memberId, boolean isDuty) {
        System.out.println("adminBookReturn post 호출");
        System.out.println("bookCode::" +bookCode);
        System.out.println("MemberId::" +memberId);
        System.out.println("isDuty::" +isDuty);
        
        return adminService.bookReturnProcess(bookCode, memberId, isDuty);
    }
    
    @Secured("ROLE_ADMIN")
    @GetMapping("/adminBookRental")
    public String adminBookRental(Model model) {
        System.out.println("adminBookRental get 호출");        
        return "admin/adminBookRental";
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @PostMapping("/adminBookReservationGetAllList")
    public List<BookReservationVO> adminBookReservationGetAllList() {
        System.out.println("adminBookReservationGetAllList post 호출");    
        return reservationService.reservationMemberAllSearch();
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @PostMapping("/getAllBookHistoryList")
    public List<BookLogVO> getAllBookHistoryList() {
        System.out.println("getAllBookHistoryList post 호출");    
        return reservationService.getAllBookHistoryList();
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @GetMapping("/adminBookRentalIdSearch")
    public List<MemberVO> adminBookRentalIdSearch(String memberId) {
        List<MemberVO> memberList =  adminService.adminMemberIdSearch(memberId);
        
        for (MemberVO memberVO : memberList) {
            System.out.println("memberVO::"+memberVO);
            
        }
        
        return memberList;
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @GetMapping("/adminBookRentalCodeSearch")
    public List<BookVO> adminBookRentalCodeSearch(String bookCode) {
        
        return bookService.getBookRentalInfo(bookCode);
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @PostMapping("/adminBookRentalResult")
    public int adminBookRentalResult(String bookCode, String memberId) {
        System.out.println("adminBookRentalResult post 호출");
        System.out.println("bookCode::" +bookCode);
        System.out.println("MemberId::" +memberId);
        System.out.println("끗");
        return adminService.bookRentalProcess(bookCode, memberId);
    }
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @PostMapping("/getBookisRental")
    public int getBookisRental(String bookCode) {
        System.out.println("getBookisRental post 호출");
        System.out.println("bookCode::" +bookCode);
        return reservationService.getBookisRental(bookCode);
    }
    
    
    @Secured("ROLE_ADMIN")
    @ResponseBody
    @PostMapping("/getMemberRentalCount")
    public int getMemberRentalCount(String memberId) {
        System.out.println("getMemberRentalCount post 호출");
        System.out.println("memberId::" +memberId);
        return reservationService.getMemberRentalCount(memberId);
    }
    
    /* ==============================================================공지사항 게시판 추가 ================================================= */
    /* ==============================================================공지사항 게시판 추가 ================================================= */
    
    @GetMapping("/filelist")
    public String filelist(@RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(required = false) String search, 
            Model model) {

        // 한 페이지에 해당하는 글목록 구하기 작업
        int amount = 6; // 한 페이지 당 보여줄 글(레코드) 갯수
        int startRow = (pageNum - 1) * amount; // 시작행번호
        
        List<AdminVO> list = adminService.getBoards(startRow, amount, search);
        
        //xml에서 수식이 먹히지 않아서 컨트롤러에서 처리
        //  페이지 블록 구하기 작업
        int allRowCount = 0; // 전체 행 갯수
        
        allRowCount = adminService.getBoardCount(search);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        // 1페이지 ~ maxPage 페이지까지 존재함.
        // -> 페이지 블록단위로 끊어줌

        // 시작페이지번호(1)             끝페이지번호(10)
        // 1 2 3 4 5 6 7 8 9 10             -- [블록구성 10개]
        
        // 시작페이지번호(11)             끝페이지번호(20)
        // 11 12 13 14 15 16 17 18 19 20   -- [블록구성 10개]
        
        // 시작페이지번호(21)             끝페이지번호(23)
        // 21 22 23                         -- [블록구성 3개]
        
        // 한 페이지블록을 구성하는 페이지갯수
        int pageBlockSize = 5;
        
        // 시작페이지번호 구하기
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        // 끝페이지번호 구하기
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝페이지번호 구하기
            endPage = maxPage;
        }
        
        
        Map<String, Integer> pageInfoMap = new HashMap<>();
        pageInfoMap.put("startPage", startPage); // 시작페이지번호
        pageInfoMap.put("endPage", endPage);     // 끝페이지번호
        pageInfoMap.put("pageBlockSize", pageBlockSize);//페이지블록크기
        pageInfoMap.put("maxPage", maxPage);     // 전체 페이지수
        pageInfoMap.put("allRowCount", allRowCount); // 전체 행갯수
        pageInfoMap.put("pageNum", pageNum); // 사용자가 요청한 페이지번호
        // model에 저장하면 스프링이 request 영역객체에 옮겨담아줌
        model.addAttribute("list", list); // 글목록 list 
        model.addAttribute("pageInfoMap", pageInfoMap); // 페이지블록 출력관련 데이터
        model.addAttribute("search", search); // 검색어
        
        return "library_board/adminNotice";
    }
    
    @GetMapping("/fileWrite")
    public String fileWrite() {
        return "library_board/adminWrite";
    }
    
    @PostMapping("/fileWrite")
    public String fileWrite(AdminVO adminVO, HttpServletRequest request, MultipartFile[] files) throws Exception { //예외 발생을 직접 처리하지 않는다.
        log.info("files.length : " + files.length);
        
        // 시퀀스로부터 글번호 구하기
        int num = adminService.getSeqBoardNum();
        adminVO.setNum(num);  // 주글번호
        adminVO.setReRef(num); // re_ref == num 주글일때는 글그룹번호와 글번호가 같음.
        adminVO.setReLev(0);  // re_lev 들여쓰기 레벨
        adminVO.setReSeq(0);  // re_seq 글그룹 내에서는 오름차순 정렬. 최상단에 주글이 옴.
        adminVO.setReadcount(0); // readcount 조회수 0
        // 글작성자 IP주소 값 저장
        adminVO.setIp(request.getRemoteAddr());
        
        //  upload 폴더의 물리적 경로
        ServletContext application = request.getServletContext();
        String realPath = application.getRealPath("/upload");
//        String uploadPath = "C:\\upload";
        log.info("realPath : " + realPath);
        
        // 폴더 동적 생성하기   /upload/2019/05/17
        File uploadPath = new File(realPath, getFolder());
        log.info("uploadPath : " + uploadPath);
        
        if (!uploadPath.exists()) {
            uploadPath.mkdirs(); // 업로드할 폴더 생성
        }
        
        List<AttachVO> attachList = new ArrayList<>();
        
        for (MultipartFile multipartFile : files) {
            log.info("업로드 파일명: " + multipartFile.getOriginalFilename());
            log.info("업로드 파일 크기: " + multipartFile.getSize());
            if (multipartFile.isEmpty()/*getSize() == 0*/) {
                continue;
            }
            
            String uploadFileName = multipartFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;
            log.info("업로드할 최종 파일명: " + uploadFileName);
            
            File saveFile = new File(uploadPath, uploadFileName);
            multipartFile.transferTo(saveFile); // 업로드 수행
            
            AttachVO attachVO = new AttachVO();
            attachVO.setBnum(adminVO.getNum()); // 게시글번호 저장
            attachVO.setUuid(uuid.toString());  // 첨부파일 UUID
            attachVO.setUploadpath(getFolder());
            attachVO.setFilename(multipartFile.getOriginalFilename());
            
            if (checkImageType(saveFile)) {
                // 섬네일 이미지 생성하기
                File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
                FileOutputStream fos = new FileOutputStream(thumbnailFile);
                Thumbnailator.createThumbnail(multipartFile.getInputStream(), fos, 100, 100);
                fos.close();
                attachVO.setFiletype("I"); // Image file type
            } else {
                attachVO.setFiletype("O"); // Other file type
            }
            
            attachList.add(attachVO);
        } // for
        
        // 테이블 insert
        adminService.insertBoardAndAttach(adminVO, attachList);
        return "redirect:/admin/filelist";
    } // fileWrite()
    
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str; //문자열을 바로 리턴
    }
    
    private boolean checkImageType(File file) {
        log.info("checkImageType file : " + file);
        
        boolean isImageType = false;
        try {
            String contentType = Files.probeContentType(file.toPath());
            log.info("contentType : " + contentType);
            
            if (contentType != null) {
                isImageType = contentType.startsWith("image");
            } else { // contentType == null
                isImageType = false;
            }
        } catch (IOException e) {
            log.info(e.getMessage());
        }
        return isImageType;
    }
    
    @GetMapping("/fileDetail")
    public String fileDetail(int num, Model model) {
        log.info("num:::::::::::::::::"+num);
        // 조회수 1증가
        adminService.updateReadcount(num);
        // 글번호에 해당하는 글 전체(상세)내용 가져오기
        AdminVO admin = adminService.getBoard(num);
        
        log.info(admin);
        // 글번호에 해당하는 첨부파일 리스트 가져오기
        List<AttachVO> attachList = adminService.findByBnum(num);
        
        // *글내용 줄바꿈 처리방법
        // (1) <pre>태그처리
        // (2) \r\n -> <br> 바꾸기
        String content = "";
        if (admin.getContent() != null) {
            content = admin.getContent().replace("\r\n", "<br>");
            admin.setContent(content);
        }
        
        model.addAttribute("adminboard", admin);
        model.addAttribute("attachList", attachList);
        return "library_board/adminContent";
    }
    
    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE) //애노테이션이 2개 이상일때는 속성을 명시해줘야 한다
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(String fileName, HttpServletRequest request, @RequestHeader("User-Agent") String userAgent) {
        log.info("download file : " + fileName);
        
        //  upload 폴더의 물리적 경로
        ServletContext application = request.getServletContext();
        String realPath = application.getRealPath("/upload");
        Resource resource = new FileSystemResource(realPath + "/" + fileName);
        
        if(!resource.exists()) { //존재하지 않을 때!
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        
        String resourceName = resource.getFilename();
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") +1);
        HttpHeaders headers = new HttpHeaders();
        
        try {
            String downloadName = null;
            
            if(userAgent.contains("Trident")) {//특정 문자열을 포함하고 있을때
                log.info("IE browser");
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " "); //이 문자는 무조건 공백. 입력시키기
            }else if(userAgent.contains("Edge")) {
                log.info("Edge browser");
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
            }else {
                log.info("chrome browser");
                downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
            }
            
            log.info("downloadName : " + downloadName);
            
            //new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
            headers.add("Content-Disposition", "attachment; fileName=" + downloadName);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        
        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
        
    }//downloadFile
    
    @GetMapping("/fileDelete")
    public String fileDelete() {
        return "library_board/adminDelete";
    }
    
    
    @PostMapping("/fileDelete")
    public ResponseEntity<String> fileDelete(int num, String pass, String pageNum, HttpServletRequest request) {//실제 삭제
        AdminVO admin = adminService.getBoard(num);
        //패스워드 비교
        if(!pass.equals(admin.getPass())) {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "text/html; charset=UTF-8");
            StringBuilder sb = new StringBuilder();
            sb.append("<script>");
            sb.append("alert('글 비밀번호가 틀립니다.');");
            sb.append("history.back();");
            sb.append("</script>");
            return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
        }
        //순서는 상관X
        //파일 삭제
        List<AttachVO> attachList = adminService.findByBnum(num);
        if(attachList.size() > 0) {//사이즈가 0보다 크면
            
            ServletContext application = request.getServletContext();
            String realPath = application.getRealPath("/upload");
            
            for(AttachVO attach : attachList) {
                String path = realPath + "/" + attach.getUploadpath();
                String filename = attach.getUuid() + "_" + attach.getFilename();
                
                if(attach.getFiletype().equals("I")) {//파일이 이미지일때와 이미지가 아닐때
                    //섬네일 삭제하기
                    File thumnailFile = new File(path, "s_" + filename);
                    if(thumnailFile.exists()) thumnailFile.delete(); //실제로 존재하면
                }
                //원본파일 삭제하기
                File deleteFile = new File(path, filename);
                if(deleteFile.exists()) deleteFile.delete();
            }//for
        }
        
        //테이블 레코드 삭제(게시판, 첨부파일 테이블 행 삭제)
        adminService.deleteBoardAndAttach(num); //서비스 호출
        // 글 삭제 성공 이후 글목록으로 리다이렉트
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "/book/admin/filelist?pageNum=" + pageNum); // redirect 경로 위치
        return new ResponseEntity<String>(headers, HttpStatus.FOUND);
    }//fileDelete()
    
    @GetMapping("/fileModify")
    public String fileModify(int num, Model model) {
        AdminVO admin = adminService.getBoard(num);
        List<AttachVO> attachList = adminService.findByBnum(num);
        model.addAttribute("adminboard", admin);
        model.addAttribute("attachList", attachList);
        
        return "library_board/adminUpdate";
    } // fileModify() get
    
    @PostMapping("/fileModify")
    public ResponseEntity<String> fileModify(AdminVO admin, String[] delFiles, MultipartFile[] newFiles, String pageNum, HttpServletRequest request) {
        // 글 패스워드 일치하면 글수정 후 글목록으로 이동
        // 글 패스워드 불일치하면 이전화면으로 돌아가기
        // boolean isSuccess == true 수정성공
        //         isSuccess == false 수정실패
        boolean isSuccess = adminService.updateBoard(admin);
        
        if (!isSuccess) { // // 글 수정 실패
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "text/html; charset=UTF-8");
            StringBuilder sb = new StringBuilder();
            sb.append("<script>");
            sb.append("alert('글비밀번호가 틀립니다.');");
            sb.append("history.back();");
            sb.append("</script>");

            return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
        }
        
        ServletContext application = request.getServletContext();
        String realPath = application.getRealPath("/upload");
        
        if (delFiles != null) {
            for (int i=0; i<delFiles.length; i++) {
                String folder = delFiles[i].substring(0, 10); // 2019/05/21
                String uuidAndFilename = delFiles[i].substring(11); // 2019/05/21/ 제외
                
                int index = uuidAndFilename.indexOf("_");
                String uuid = uuidAndFilename.substring(0, index);
                String filename = uuidAndFilename.substring(index + 1);
                log.info("uuid : " + uuid);
                log.info("filename : " + filename);
                
                // 첨부파일 삭제항목 삭제하기
                File deleteFile = new File(realPath + "/" + delFiles[i]);
                
                if (deleteFile.exists()) deleteFile.delete();
                // 섬네일 삭제하기
                File thumbnailFile = new File(realPath + "/" + folder, "s_" + uuid + "_" + filename);
                if (thumbnailFile.exists()) thumbnailFile.delete();
                
                // attach 테이블에서  행 삭제
                attachService.delete(uuid);
            } // for
        } // if
        
        // 폴더 동적 생성하기   /upload/2019/05/17
        File uploadPath = new File(realPath, getFolder());
        log.info("uploadPath : " + uploadPath);
        if (!uploadPath.exists()) {
            uploadPath.mkdirs(); // 업로드할 폴더 생성
        }

        // 새로 추가된 첨부파일 정보를 담을 리스트 준비
        List<AttachVO> newAttachList = new ArrayList<>();
        // 추가된 첨부파일 업로드하기
        for (MultipartFile multipartFile : newFiles) {
            if (multipartFile.isEmpty()) {
                continue;
            }
            
            String uploadFileName = multipartFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;
            log.info("업로드할 최종 파일명: " + uploadFileName);
            
            File saveFile = new File(uploadPath, uploadFileName);
            try {
                multipartFile.transferTo(saveFile); // 업로드 수행
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            AttachVO attachVO = new AttachVO();
            attachVO.setBnum(admin.getNum()); // 게시글번호 저장
            attachVO.setUuid(uuid.toString());  // 첨부파일 UUID
            attachVO.setUploadpath(getFolder());
            attachVO.setFilename(multipartFile.getOriginalFilename());
            
            if (checkImageType(saveFile)) { // 이미지 파일이면
                // 섬네일 이미지 생성하기
                File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
                try {
                    FileOutputStream fos = new FileOutputStream(thumbnailFile);
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), fos, 100, 100);
                    
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                attachVO.setFiletype("I"); // Image file type
            } else {
                attachVO.setFiletype("O"); // Other file type
            }
            
            newAttachList.add(attachVO);
        } // for
        for (AttachVO attachVO : newAttachList) {
            log.info("attachVO : " + attachVO);
        }
        
        // 추가된 첨부파일 테이블 insert하기
        if (newAttachList.size() > 0) {
            attachService.insert(newAttachList);
        }
        
        // 글 수정 성공 이후 글목록으로 리다이렉트
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "/book/admin/filelist?pageNum=" + pageNum); // redirect 경로 위치
        return new ResponseEntity<String>(headers, HttpStatus.FOUND);
    } // fileModify() post
}
