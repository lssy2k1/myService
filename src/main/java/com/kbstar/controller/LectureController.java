package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cart;
import com.kbstar.dto.Lecture;
import com.kbstar.dto.Student;
import com.kbstar.service.CartService;
import com.kbstar.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/lecture")

public class LectureController {
    @Value("${uploadimgdir}")
    String imgpath;

    @Autowired
    LectureService lectureService;

    @Autowired
    CartService cartService;

    String dir = "lecture/";

    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Lecture> p;
        try {
            p = new PageInfo<>(lectureService.getPage(pageNo), 5);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        model.addAttribute("target","lecture");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"allpage");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,Integer id) throws Exception {
        Lecture lecture;
        lecture = lectureService.get(id);
        model.addAttribute("lecture", lecture);
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/mycourse")
    public String mycourse(Model model, String id) throws Exception {

        List<Cart> list = null;

        try {
            list = cartService.getMyCart(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("시스템 장애: ER0002");
        }

        int cnt = cartService.cntMyCart(id);
        log.info("cnt"+cnt);
        model.addAttribute("cnt",cnt);
        model.addAttribute("mycourse", list);
        model.addAttribute("center", dir+"mycourse");
        return "index";
    }

    @RequestMapping("/cartdelete")
    public String cartdelete(Model model,Integer id, HttpSession session) throws Exception {

        cartService.remove(id);
        if(session != null){
            Student student = (Student) session.getAttribute("loginStudent");
            return "redirect:/lecture/mycourse?id="+student.getId();
        }
        return "redirect:/";
    }


}
