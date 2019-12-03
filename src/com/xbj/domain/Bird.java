package com.xbj.domain;

import lombok.Data;

import java.io.Serializable;
@Data
public class Bird implements Serializable {
    // 实体类
    private Integer birdId;
    private String birdName;
    private String password;
    private String gender;
    private String hobbies;
    private String address;
    private String email;
    

}
