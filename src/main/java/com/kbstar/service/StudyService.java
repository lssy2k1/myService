package com.kbstar.service;

import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Study;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.StudyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyService implements KBService<Integer, Study> {

    @Autowired
    StudyMapper mapper;

    @Override
    public void register(Study study) throws Exception {
        mapper.insert(study);
    }

    @Override
    public void remove(Integer k) throws Exception {
        mapper.delete(k);
    }

    @Override
    public void modify(Study study) throws Exception {
        mapper.update(study);
    }

    @Override
    public Study get(Integer k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Study> get() throws Exception {
        return mapper.selectall();
    }

    public List<Study> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 7); //한화면에 출력되는 개수
        return mapper.getpage();
    }

    public List<Study> getMyStudy(String writer) throws Exception{
        return mapper.getMyStudy(writer);
    }
}
