package com.kbstar.controller;

import com.kbstar.dto.Cart;
import com.kbstar.dto.Marker;
import com.kbstar.dto.Student;
import com.kbstar.service.CartService;
import com.kbstar.service.MarkerService;
import com.kbstar.service.StudentService;
import com.kbstar.utill.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Slf4j

@RestController
public class AjaxImplController {

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    StudentService studentService;

    @Autowired
    CartService cartService;

    @Autowired
    MarkerService markerService;

    @RequestMapping("/getservertime")
    public Object getservertime(){
        //현재 시간 객체 생성
        Date date = new Date();
        //요일 구하기
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int day = calendar.get(Calendar.DAY_OF_WEEK);
        //JSON으로 시간과 요일 담아서 전송
        JSONObject current = new JSONObject();
        SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String now = format.format(date);
        current.put("now", now);
        current.put("day", day);

        return current;
    }

    @RequestMapping("/saveimg")
    public String saveimg(MultipartFile file){
        String filename = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, imgdir);

        return filename;
    }

    @RequestMapping("/att_checkimpl")
    public String att_checkimpl(String imgname) throws Exception {
        //현재 타임스탬프
        Timestamp current = new Timestamp(System.currentTimeMillis());
        //스트링 변환
        String current_str = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(current);
        //특정일의 오전 9시 스트링값 구하기
        String compare_str = new SimpleDateFormat("yyyy/MM/dd").format(current).concat(" 09:00:00");
        //스탬프와 특정시간 비교
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime current_tm = LocalDateTime.parse(current_str, formatter);
        LocalDateTime compare_tm = LocalDateTime.parse(compare_str, formatter);

        String result = "";
        //회원 테이블 생성 후에는, 이름이 표출되도록 추후 정정 예정
        if(current_tm.isBefore(compare_tm)) {
            result = "님 오늘도 열코딩 하십시오!";
        } else {
            Duration duration = Duration.between(compare_tm, current_tm); // 두 LocalDateTime 객체 사이의 시간 차이 계산
            long minutes = duration.toMinutes(); // 분 단위로 변환
            String minutesString = Long.toString(minutes);//String 변환
            result = minutesString + "분 늦었습니다!<br>내일은 조금 더 일찍 오십시오!";
        }
        return result;
    }

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {

        int result = 0;
        Student student = null;
        try {
            student = studentService.get(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("시스템 장애: ER0005");
        }
        if(student!=null){
            result = 1;
        }
        return result;
    }

    @RequestMapping("/cartimpl")
    public Object cartimpl(Cart cart) throws Exception {
        int result = 0;
        String sId = cart.getStudentId();
        int lId = cart.getLectureId();
        if(cartService.thisCart(lId, sId) == null){
            result = 1;
            cartService.register(cart);
        }
        return result;
    }


    @RequestMapping("/markers")
    public Object markers(String keyword) throws Exception {
        log.info("오냐"+keyword);
        List<Marker> list = null;
        try {
            list = markerService.getKeyword(keyword);
        }catch (Exception e) {
            throw new Exception("시스템 장애: ER0003");
        }

        JSONArray ja = new JSONArray();
        for(Marker obj:list){
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("writer", obj.getWriter());
            jo.put("keyword", obj.getKeyword());
            jo.put("title", obj.getTitle());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("star", obj.getStar());
            ja.add(jo);
        }
        return ja;
    }

    @RequestMapping("/checkeddelimpl")
    public String checkeddelimpl(@PathVariable("checkedIds")String[] checkedIds)  throws Exception {

        for(String i:checkedIds){
            Integer I = Integer.parseInt(i);
            cartService.remove(I);
        }

        return "success";
    }

}
