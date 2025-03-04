package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.Image;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 
 */
public interface ImageUpDao {

    List<Image> selectImagesByCustomId(int customId);

    void insertImage(Image image);

    List<Image> selectImagesByStatus(String status);

    void updateImageStatus(Image image);

    List<Image> getHistoryImages(int customId);

    Image getImageById(int imageId);

    void updatePreviousImages(int customId);

    Image getLatestApprovedImage(int customId);

    List<Image> getAllImages();

    void updateImagePath(int imageId, String newPath);
    
    // 获取最新的待审核图片
    Image getLatestPendingImage(int customId);
    
    // 获取所有图片（包括待审核和已审核），按时间倒序排列
    List<Image> getAllImagesByCustomId(int customId);
    
    // 根据ID获取图片
    Image getImageById(Integer imageId);
    
    // 更新图片状态
    void updateImageStatus(@Param("imageId") Integer id, 
                         @Param("imageStatus") String status, 
                         @Param("imageReviewComment") String reviewComment,
                         @Param("imageType") String imageType);
}