package com.kbstar.mapper;

import com.kbstar.dto.LectureSearch;
import com.github.pagehelper.Page;
import com.kbstar.dto.Lecture;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface LectureMapper extends KBMapper<Integer, Lecture> {
    Page<Lecture> getpage() throws Exception;

    public List<Lecture> search(LectureSearch ls) throws Exception;

}
