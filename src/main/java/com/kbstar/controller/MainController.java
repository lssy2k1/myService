package com.kbstar.controller;

import com.kbstar.dto.Myblog;
import com.kbstar.dto.Mypage;
import com.kbstar.dto.Student;
import com.kbstar.service.LectureService;
import com.kbstar.service.MyblogService;
import com.kbstar.service.MypageService;
import com.kbstar.service.StudentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Slf4j
@Controller
public class MainController {

    @Value("${uploadimgdir}")
    String imgpath;

    @Autowired
    LectureService lectureService;

    @Autowired
    StudentService studentService;

    @Autowired
    MypageService mypageService;

    @Autowired
    MyblogService myblogService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Value("${download.path}")
    String downloadPath;

    @RequestMapping("/")
    public String main(Model model) throws Exception {

        return "index";
    }

    @RequestMapping("/courses")
    public String courses(Model model) throws Exception {
        model.addAttribute("center", "courses");
        return "index";
    }

    @RequestMapping("/meetings")
    public String meetings(Model model) throws Exception {
        model.addAttribute("center", "meetings");
        return "index";
    }

    @RequestMapping("/meeting_details")
    public String meetings_details(Model model) throws Exception {
        model.addAttribute("center", "meeting_details");
        return "index";
    }

    @RequestMapping("/att_check")
    public String att_check(Model model) throws Exception {
        model.addAttribute("center", "att_check");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) throws Exception {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Student student = null;
        String nextPage = "loginfail";

        try {
            student = studentService.get(id);
            if (student != null && encoder.matches(pwd, student.getPwd())) {
                nextPage = "center";
                session.setMaxInactiveInterval(12000000);
                session.setAttribute("loginStudent", student);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        model.addAttribute("loginStudent", student);
        model.addAttribute("center", nextPage);
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register(Model model) throws Exception {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, int contact1, int contact2, int contact3, Student student, Mypage mypage, HttpSession session) throws Exception {
        try {
            String contact = "0" + contact1 + contact2 + contact3;
            student.setPwd(encoder.encode(student.getPwd()));
            student.setContact(contact);
            studentService.register(student);
            mypageService.register(mypage);
            session.setAttribute("loginStudent", student);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0006");
        }
        model.addAttribute("loginStudent", student);
        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) throws Exception {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/download/{filename}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable("filename") String filename, HttpServletRequest request) throws IOException {
        String filePath = downloadPath; // 파일이 저장된 경로

        // 파일 경로 생성
        Path file = Paths.get(filePath, filename);

        // 파일을 ByteArray로 변환하여 ResponseEntity에 담아 반환
        byte[] fileContent = Files.readAllBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", filename);
        return ResponseEntity.ok().headers(headers).body(fileContent);
    }

    @RequestMapping("/mypage")
    public String mypage(Model model, String id, HttpSession session) throws Exception {
        Mypage mypage = null;
        List<Myblog> list = null;
        String dDay = null;

        try {
            Student loginStudent = (Student) session.getAttribute("loginStudent");
            mypage = mypageService.get(loginStudent.getId());
            list = myblogService.getMyBlog(loginStudent.getId());

            LocalDate today = LocalDate.now(ZoneId.of("Asia/Seoul"));

            // Digi의 시작일을 가져옵니다.
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date digiStart = formatter.parse(mypage.getDigi_sdate());

            // 현재 날짜와 Digi의 시작일을 비교하여 d-day를 계산합니다.
            long daysBetween = ChronoUnit.DAYS.between(today, digiStart.toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
            dDay = (daysBetween > 0) ? "D-" + daysBetween : "D+" + Math.abs(daysBetween);


            //comsdate과 digidate formatter
            SimpleDateFormat comsdateformatter = new SimpleDateFormat("yyyy년 MM월 dd일");
            Date comSdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(mypage.getCom_sdate());
            String formattedComSdate = comsdateformatter.format(comSdate);
            mypage.setCom_sdate(formattedComSdate);

            SimpleDateFormat digisdateformatter = new SimpleDateFormat("yyyy년 MM월 dd일");
            Date digiSdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(mypage.getDigi_sdate());
            String formattedDigiSdate = digisdateformatter.format(digiSdate);
            mypage.setDigi_sdate(formattedDigiSdate);


        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }

        model.addAttribute("student", mypage);
        model.addAttribute("bloglist", list);
        model.addAttribute("dday", dDay);
        return "mypage";
    }


    @RequestMapping("/digimembers")
    public String digimembers(Model model, Student student) throws Exception {
        List<Student> list = null;
        try {
            list = studentService.get();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

        model.addAttribute("studentList", list);
        model.addAttribute("center", "digi_members");
        return "index";
    }


}