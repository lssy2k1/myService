package com.kbstar.dto;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    @Size(min=5, max=10, message="ID는 5자리 이상 10자리 이하입니다.")
    @NotEmpty(message="PASSWORD는 5이상 12자리 이하입니다.")
    private String id;
    @Size(min=5, max=12, message="PASSWORD는 5이상 12자리 이하입니다.")
    @NotEmpty(message="PASSWORD는 5이상 12자리 이하입니다.")
    private String pwd;
    @NotEmpty(message="이름을 입력하세요.")
    private String name;
    private String detail;
    private String email;
    private String contact;
    private String img;
    private String insta;
    private String facebook;

    private MultipartFile imgfile;

    public Student(String id, String pwd, String name, String email, String contact) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.contact = contact;
    }

    public Student(String id, String detail, String email, String contact, String img, String insta, String facebook) {
        this.id = id;
        this.detail = detail;
        this.email = email;
        this.contact = contact;
        this.img = img;
        this.insta = insta;
        this.facebook = facebook;
    }
}
