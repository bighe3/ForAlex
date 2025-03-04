package com.hjh.communitysadministrativesystem.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Maintain implements Serializable {
    private Long mid;
    private String maintainer;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sdate;
    private String thing;
    private String status;
    private String homesnumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rdate;
    private Double tcost;
    private Double scost;
    private String smemo;
    private Integer custom_id;
    private Custom custom;
}
