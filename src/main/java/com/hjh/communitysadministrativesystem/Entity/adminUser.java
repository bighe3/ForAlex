package com.hjh.communitysadministrativesystem.Entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class adminUser implements Serializable {
    private Integer aid;
    private String aaccount;
    private String apassword;
    private String aname;
    private String asex;
    private int aage;
    private String aphone;
    private String addr;
}
