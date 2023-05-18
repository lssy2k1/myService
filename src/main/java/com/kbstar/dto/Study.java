package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;


@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Study {
    private int id;
    private String writer;
    private String startTime;
    private String endTime;
    private String contents;
    private String rdate;
    private String fileName;
    private String fileName_org;

    private MultipartFile file;

    private String studentName;
    private String studentImg;

    public Study(String writer, String startTime, String endTime, String contents, String fileName, String fileName_org) {
        this.writer = writer;
        this.startTime = startTime;
        this.endTime = endTime;
        this.contents = contents;
        this.fileName = fileName;
        this.fileName_org = fileName_org;
    }

    public Study(int id, String writer, String startTime, String endTime, String contents, String rdate, String fileName, String fileName_org) {
        this.id = id;
        this.writer = writer;
        this.startTime = startTime;
        this.endTime = endTime;
        this.contents = contents;
        this.rdate = rdate;
        this.fileName = fileName;
        this.fileName_org = fileName_org;
    }

    public Study(int id, String writer, String startTime, String endTime, String contents, String fileName, String fileName_org) {
        this.id = id;
        this.writer = writer;
        this.startTime = startTime;
        this.endTime = endTime;
        this.contents = contents;
        this.fileName = fileName;
        this.fileName_org = fileName_org;
    }

}