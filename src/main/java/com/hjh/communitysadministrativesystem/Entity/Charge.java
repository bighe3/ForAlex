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
public class Charge implements Serializable {
    private Long id;
    private String name;           // 户主姓名
    private Double metre;          // 房间平米
    private String phone;          // 联系电话
    private String username;       // 业主姓名
    private String status;         // 状态
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sdate;            // 账单生成时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rdate;            // 支付时间
    private Double tcost;          // 应收金额
    private Double scost;          // 实收金额
    private String smemo;          // 详情说明
    private Integer custom_id;     // 业主ID
    private String billMonth;      // 账单月份(yyyy-MM)
    private Custom custom;         // 关联的业主信息
}