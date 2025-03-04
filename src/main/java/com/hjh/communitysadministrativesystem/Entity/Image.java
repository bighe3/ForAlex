package com.hjh.communitysadministrativesystem.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 图片实体类
 * 用于存储业主上传的房屋图片信息，包括原始文件名、存储路径、审核状态等
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Image implements Serializable {
    /** 图片记录ID */
    private int id;
    
    /** 新文件名（系统生成的唯一文件名） */
    private String newName;
    
    /** 原始文件名（用户上传时的文件名） */
    private String oldName;
    
    /** 图片访问路径 */
    private String path;
    
    /** 业主ID */
    private int customId;
    
    /** 
     * 图片状态
     * pending: 待审核
     * approved: 已通过
     * rejected: 已拒绝
     */
    private String status;
    
    /** 上传时间 */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date uploadTime;
    
    /** 审核意见 */
    private String reviewComment;
    
    /** 
     * 图片类型
     * current: 当前使用的图片
     * history: 历史图片
     */
    private String imageType;
    
    /** 审核时间 */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date approvedTime;
}
