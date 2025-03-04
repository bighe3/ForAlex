package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.Image;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 图片管理服务接口
 */
public interface ImageUpService {
    /**
     * 获取业主的最新图片（包括已审核和待审核）
     * @param customId 业主ID
     * @return 最新的已审核图片和待审核图片列表
     */
    List<Image> getLatestImages(int customId);

    /**
     * 上传新图片
     * @param file 图片文件
     * @param customId 业主ID
     * @return 图片访问路径
     * @throws IOException 如果文件操作失败
     */
    String uploadImage(MultipartFile file, int customId) throws IOException;

    /**
     * 获取所有待审核的图片
     * @return 待审核图片列表
     */
    List<Image> getPendingImages();

    /**
     * 审核图片
     * @param imageId 图片ID
     * @param status 审核状态（approved/rejected）
     * @param comment 审核意见
     */
    void reviewImage(int imageId, String status, String comment);

    /**
     * 获取业主的所有图片历史记录
     * @param customId 业主ID
     * @return 图片历史记录列表
     */
    List<Image> getAllImages(int customId);

    /**
     * 根据ID获取图片
     * @param imageId 图片ID
     * @return 图片信息
     */
    Image getImageById(Integer imageId);
}
