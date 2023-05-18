package com.kbstar.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Slf4j
@Controller
@RequestMapping("/marker")

public class MarkerController {
    @Value("${uploadimgdir}")
    String imgpath;

    String dir = "marker/";

    @RequestMapping("/all")
    public String map03(Model model) {
        model.addAttribute("center",dir+"courses");
        return "index";
    }

}
