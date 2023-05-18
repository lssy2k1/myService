package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class LectureSearch {
    private String title;
    private String teacher;
    private String topic;
    private String rdate;
    private Integer miniPrice;
    private Integer maxPrice;
    private Integer rating;


}
