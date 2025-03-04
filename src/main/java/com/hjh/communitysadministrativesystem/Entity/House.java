package com.hjh.communitysadministrativesystem.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class House implements Serializable {
    private int id;
    private String num; // 门牌号
    private String dep; // 楼号
    private String type; // 类型
    private String area; // 地区
    private String sell; // 出售状况
    private String unit; // 单元
    private int floor; // 楼层
    private String direction; // 朝向
    private String memo; // 备注
    private int customId;
    private Custom custom;
    private List<Image> images; // 添加图片列表属性
    private Image latestApprovedImage; // 最新审核通过的图片
    private Image latestPendingImage; // 最新待审核的图片
    private String status; // 添加status字段

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}