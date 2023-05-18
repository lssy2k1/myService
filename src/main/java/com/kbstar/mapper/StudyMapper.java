package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Study;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StudyMapper extends KBMapper<Integer, Study> {
    Page<Study> getpage() throws Exception;

    public List<Study> getMyStudy(String writer) throws Exception;
}
