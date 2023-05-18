package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Lecture;
import com.kbstar.dto.LectureSearch;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureService implements KBService<Integer, Lecture> {

    @Autowired
    LectureMapper mapper;

    @Override
    public void register(Lecture lecture) throws Exception {
        mapper.insert(lecture);
    }

    @Override
    public void remove(Integer k) throws Exception {
        mapper.delete(k);
    }

    @Override
    public void modify(Lecture lecture) throws Exception {
        mapper.update(lecture);
    }

    @Override
    public Lecture get(Integer k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Lecture> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Lecture> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 9); //한화면에 출력되는 개수
        return mapper.getpage();
    }

    public List<Lecture> search(LectureSearch ls) throws Exception{
        return mapper.search(ls);
    }
}
