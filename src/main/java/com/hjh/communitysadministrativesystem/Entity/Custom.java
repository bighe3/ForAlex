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
public class Custom implements Serializable {
    private Integer oid;
    private String oaccount;
    private String opassword;
    private String oname;
    private String osex;
    private Integer oage;
    private String ohousenum;
    private Double house_area;
    private String oparkingspacesnum;
    private String ocarnum;
    private String oannualrent;
    private String opaymenttime;
    private String opendingrepairs;
    private String ophone;
}
