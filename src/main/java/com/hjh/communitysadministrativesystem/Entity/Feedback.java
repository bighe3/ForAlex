package com.hjh.communitysadministrativesystem.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Feedback {
    private Integer id;

    private String person;

    private String type;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date itime;

    private String status;

    private String conductor;

    private String content;

    private String memo;

    private Integer user_id;


}