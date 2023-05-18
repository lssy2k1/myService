package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;

import com.kbstar.dto.Marker;
import com.kbstar.dto.Student;
import com.kbstar.service.MarkerService;
import com.kbstar.utill.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/marker")

public class MarkerController {
    @Value("${uploadimgdir}")
    String imgpath;

    String dir = "marker/";

    @Autowired
    MarkerService markerService;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Marker> list = markerService.getRecent();
        model.addAttribute("marker", list);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        Marker marker = null;
        marker = markerService.get(id);

        model.addAttribute("marker", marker);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker, HttpSession session) throws Exception {
        Student loginStudent = (Student) session.getAttribute("loginStudent");
        MultipartFile mf = marker.getImgfile();
        String img = mf.getOriginalFilename();

        marker.setImg(img);
//        marker.setWriter(loginStudent.getId());
        try {
            markerService.register(marker);
            FileUploadUtil.saveFile(mf, imgpath);
        } catch (Exception e) {
            throw new Exception(e);
        }

        model.addAttribute("loginStudent", loginStudent);
        return "redirect:/marker/all";
    }


    @RequestMapping("/edit")
    public String edit(Model model, @RequestParam("id") int id) throws Exception {

        Marker marker = markerService.get(id);

        model.addAttribute("center", dir + "edit");
        model.addAttribute("marker", marker);
        return "index";
    }


    @RequestMapping("/editimpl")
    public String editimpl(Model model, Marker marker) throws Exception {
        // id를 사용하여 해당 marker 정보를 가져옴
        MultipartFile mf = marker.getImgfile();
        String img = mf.getOriginalFilename();

        if (img.equals("") || img == null) {
            markerService.modify(marker);
        } else {
            marker.setImg(img);
            markerService.modify(marker);
            FileUploadUtil.saveFile(mf, imgpath);
        }

        return "redirect:/marker/all";
    }

    @RequestMapping("/delete")
    public String delete(Model model, Integer id) throws Exception {
        markerService.remove(id);
        return "redirect:/marker/all";
    }




}