package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Service.ImageUpService;
import com.hjh.communitysadministrativesystem.dao.ImageUpDao;
import com.hjh.communitysadministrativesystem.Entity.Image;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.annotation.PostConstruct;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 图片管理服务实现类
 * 处理图片的上传、存储、审核等业务逻辑
 */
@Service
public class ImageUpServiceImpl implements ImageUpService {
    private static final Logger logger = LoggerFactory.getLogger(ImageUpServiceImpl.class);
    /** 图片上传目录 */
    private static final String UPLOAD_DIR = "uploads";

    @Autowired
    private ImageUpDao imageUpDao;

    /**
     * 服务初始化
     * 创建图片上传目录并迁移旧图片
     */
    @PostConstruct
    public void init() {
        try {
            // 创建上传目录
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                logger.info("创建图片上传目录: {}", uploadPath.toAbsolutePath());
            }

            // 迁移旧图片
            migrateOldImages();
        } catch (IOException e) {
            logger.error("初始化图片上传目录失败", e);
            throw new RuntimeException("无法初始化图片上传目录", e);
        }
    }

    /**
     * 迁移旧图片到新目录
     * 将原来存储在 static/img/uploads 目录下的图片迁移到新的 uploads 目录
     */
    private void migrateOldImages() {
        try {
            // 获取所有图片记录
            List<Image> images = imageUpDao.getAllImages();
            Path oldDir = Paths.get("src/main/resources/static/img/uploads");
            Path newDir = Paths.get(UPLOAD_DIR);

            for (Image image : images) {
                if (image.getPath() != null && image.getPath().startsWith("/static/img/uploads/")) {
                    // 更新数据库中的路径
                    String newPath = image.getPath().replace("/static/img/uploads/", "/uploads/");
                    image.setPath(newPath);
                    imageUpDao.updateImagePath(image.getId(), newPath);
                    logger.info("更新图片路径: {} -> {}", image.getPath(), newPath);

                    // 如果旧目录存在，移动文件
                    if (Files.exists(oldDir)) {
                        Path oldFile = oldDir.resolve(image.getNewName());
                        Path newFile = newDir.resolve(image.getNewName());
                        if (Files.exists(oldFile) && !Files.exists(newFile)) {
                            Files.move(oldFile, newFile);
                            logger.info("移动图片文件: {} -> {}", oldFile, newFile);
                        }
                    }
                }
            }
        } catch (Exception e) {
            logger.error("迁移旧图片失败", e);
        }
    }

    /**
     * 获取业主的最新图片
     * 包括最新的已审核图片和待审核图片（如果有）
     */
    @Override
    public List<Image> getLatestImages(int customId) {
        // 获取最新的审核通过图片和待审核图片
        Image latestApproved = imageUpDao.getLatestApprovedImage(customId);
        Image latestPending = imageUpDao.getLatestPendingImage(customId);
        
        // 根据获取结果返回相应的列表
        if (latestApproved != null && latestPending != null) {
            return List.of(latestApproved, latestPending);
        } else if (latestApproved != null) {
            return List.of(latestApproved);
        } else if (latestPending != null) {
            return List.of(latestPending);
        }
        return List.of();
    }

    /**
     * 上传新图片
     * 将图片文件保存到指定目录，并在数据库中创建记录
     */
    @Override
    public String uploadImage(MultipartFile file, int customId) throws IOException {
        logger.info("开始上传图片，业主ID: {}, 原始文件名: {}", customId, file.getOriginalFilename());
        
        // 生成随机文件名
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Path uploadPath = Paths.get(UPLOAD_DIR, newFileName);

        // 保存文件到指定目录
        Files.copy(file.getInputStream(), uploadPath);
        logger.info("文件已保存到: {}", uploadPath.toAbsolutePath());

        // 创建 Image 对象并保存到数据库
        Image image = new Image();
        image.setNewName(newFileName);
        image.setOldName(file.getOriginalFilename());
        image.setPath("/uploads/" + newFileName);
        image.setCustomId(customId);  
        image.setStatus("pending"); 
        image.setUploadTime(new Date());
        image.setImageType("current"); 

        try {
            imageUpDao.insertImage(image);
            logger.info("图片信息已保存到数据库，ID: {}", image.getId());
        } catch (Exception e) {
            logger.error("保存图片信息到数据库失败", e);
            throw new IOException("保存图片信息失败: " + e.getMessage());
        }

        return image.getPath();
    }

    /**
     * 获取所有待审核的图片
     */
    @Override
    public List<Image> getPendingImages() {
        return imageUpDao.selectImagesByStatus("pending");
    }

    /**
     * 审核图片
     * 如果审核通过，会将业主之前的图片标记为历史记录
     */
    @Override
    public void reviewImage(int imageId, String status, String comment) {
        logger.info("开始审核图片，图片ID: {}, 状态: {}", imageId, status);
        
        if ("approved".equals(status)) {
            // 先获取要审核的图片的 custom_id
            Image currentImage = imageUpDao.getImageById(imageId);
            if (currentImage == null) {
                logger.error("未找到ID为{}的图片", imageId);
                throw new RuntimeException("图片不存在");
            }
            
            logger.info("将业主ID: {}的所有已审核图片标记为历史", currentImage.getCustomId());
            // 将该用户之前的所有已审核图片标记为历史
            imageUpDao.updatePreviousImages(currentImage.getCustomId());
            
            // 设置新的当前图片
            imageUpDao.updateImageStatus(imageId, status, comment, "current");
        } else {
            imageUpDao.updateImageStatus(imageId, status, comment, null);
        }
    }

    /**
     * 获取业主的所有图片
     */
    @Override
    public List<Image> getAllImages(int customId) {
        return imageUpDao.getAllImagesByCustomId(customId);
    }

    /**
     * 根据ID获取图片信息
     */
    @Override
    public Image getImageById(Integer imageId) {
        return imageUpDao.getImageById(imageId);
    }
}