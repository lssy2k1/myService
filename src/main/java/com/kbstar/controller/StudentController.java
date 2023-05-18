package com.kbstar.controller;

import com.kbstar.dto.Myblog;
import com.kbstar.dto.Mypage;
import com.kbstar.dto.Student;
import com.kbstar.service.MyblogService;
import com.kbstar.service.MypageService;
import com.kbstar.service.StudentService;
import com.kbstar.utill.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/student")

public class StudentController {
    @Value("${uploadimgdir}")
    String imgpath;

    @Value("${upload.path}")
    String uploadPath;

    @Autowired
    MypageService mypageService;
    @Autowired
    MyblogService myblogService;
    @Autowired
    StudentService studentService;
    String dir = "student/";

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("/mypage")
    public String mypage(Model model, String id) throws Exception {
        Mypage mypage = null;
        List<Myblog> list = null;
        String dDay = null;
        try {
            mypage = mypageService.get(id);
            list = myblogService.getMyBlog(id);

//            log.info(String.valueOf(mypage) + "----------------test");

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
        return dir + "mypage";
    }


    @RequestMapping("/profile_edit")
    public String profileEdit(Model model, String id, HttpSession session) throws Exception {
        Mypage mypage = null;

        try {
            Student loginStudent = (Student) session.getAttribute("loginStudent");
            mypage = mypageService.get(loginStudent.getId());

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }

        model.addAttribute("student", mypage);
        return "profileEdit";
    }


    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Mypage page, Student student) throws Exception {
        MultipartFile mf = student.getImgfile();
        String img = mf.getOriginalFilename();
        log.info("-------------test----------------");
        log.info(img);
        if (img.equals("") || img == null) {
            studentService.modify(student);
            mypageService.modify(page);
            // 사진 없을 때
        } else {
            student.setImg(img);
            studentService.modify(student);
            mypageService.modify(page);
            FileUploadUtil.saveFile(mf, imgdir);
        }


        return "redirect:/mypage?id=" + student.getId();

    }


    @RequestMapping("/blogimpl")
    public String blogimpl(Model model, Myblog myblog) throws Exception {
        try {
            myblogService.register(myblog);

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return "redirect:/mypage";
    }

    @RequestMapping("/blogdelete")
    public String blogdelete(Model model, int id) throws Exception {
        try {
            myblogService.remove(id);

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return "redirect:/mypage";
    }
}
