package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.Image;
import com.hjh.communitysadministrativesystem.Service.ImageUpService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Service.CustomService;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 图片管理控制器
 * 处理图片上传、审核、查看历史等功能
 * 
 * URL路径前缀：/image
 */
@Controller
@RequestMapping("/image")
public class ImageController {
    private static final Logger logger = LoggerFactory.getLogger(ImageController.class);

    @Autowired
    private ImageUpService imageUpService;

    @Autowired
    private LogService logService;

    @Autowired
    private CustomService customService;

    /**
     * 处理图片上传请求
     * 
     * @param file    上传的图片文件
     * @param session HTTP会话，用于获取当前登录的业主信息
     * @return 上传结果，包含：
     *         - success: 是否成功
     *         - message: 提示信息
     *         - path: 图片访问路径（如果上传成功）
     */
    @PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file, HttpSession session) {
        try {
            // 从会话中获取当前登录的业主信息
            Custom custom = (Custom) session.getAttribute("custom");
            int customId = custom.getOid();
            
            // 上传图片并获取访问路径
            String path = imageUpService.uploadImage(file, customId);
            
            // 记录日志
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "上传图片",
                String.format("业主 %s 上传图片: %s",
                    custom.getOname(),
                    path)
            );
            
            // 返回成功响应
            return ResponseEntity.ok().body(Map.of(
                "success", true,
                "message", "图片上传成功，等待管理员审核",
                "path", path
            ));
        } catch (IOException e) {
            // 记录错误日志
            logger.error("图片上传失败", e);
            
            // 返回错误响应
            return ResponseEntity.badRequest().body(Map.of(
                "success", false,
                "message", "图片上传失败：" + e.getMessage()
            ));
        }
    }

    /**
     * 处理图片审核请求
     * 
     * @param imageId 要审核的图片ID
     * @param status  审核状态（approved/rejected）
     * @return 审核结果，包含：
     *         - success: 是否成功
     *         - message: 提示信息
     */
    @PostMapping("/reviewImage")
    @ResponseBody
    public ResponseEntity<?> reviewImage(
            @RequestParam("imageId") Integer imageId,
            @RequestParam("status") String status) {
    
        Map<String, Object> response = new HashMap<>();
    
        try {
            // 检查图片是否存在
            Image image = imageUpService.getImageById(imageId);
            if (image == null) {
                response.put("success", false);
                response.put("message", "图片不存在");
                return ResponseEntity.ok(response);
            }

            // 更新图片状态
            String reviewComment = status.equals("approved") ? "审核通过" : "审核拒绝";
            imageUpService.reviewImage(imageId, status, reviewComment);
            boolean success = true;  // 假设操作总是成功的，或者添加异常处理
            
            if (success) {
                Custom custom = customService.findCustomById(image.getCustomId());
                logService.recordLog(
                    custom.getOid(),
                    "user",
                    custom.getOname(),
                    "审核图片",
                    String.format("业主 %s 审核图片: %s, 状态: %s",
                        custom.getOname(),
                        image.getOldName(),
                        status)
                );
            }
        
            // 返回成功响应
            response.put("success", success);
            response.put("message", success ? "审核成功" : "审核失败");
        
        } catch (Exception e) {
            // 记录错误日志并返回错误响应
            logger.error("图片审核失败", e);
            response.put("success", false);
            response.put("message", "审核失败：" + e.getMessage());
        }
    
        return ResponseEntity.ok(response);
    }

    /**
     * 获取业主的图片历史记录
     * 
     * @param customId 业主ID
     * @return 图片历史记录列表，按上传时间倒序排序
     */
    @GetMapping("/api/history/{customId}")
    @ResponseBody
    public List<Image> getHistory(@PathVariable("customId") Integer customId) {
        List<Image> images = imageUpService.getAllImages(customId);
        Custom custom = customService.findCustomById(customId);
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看图片历史",
                String.format("业主 %s 查看图片历史",
                    custom.getOname())
            );
        }
        return images;
    }

    /**
     * 获取业主的图片历史记录
     * 
     * @param customId 业主ID
     * @return 图片历史记录列表，按上传时间倒序排序
     */
    @GetMapping("/history/{customId}")
    public String showHistory(@PathVariable("customId") Integer customId, Model model) {
        List<Image> images = imageUpService.getAllImages(customId);
        model.addAttribute("images", images);
        Custom custom = customService.findCustomById(customId);
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看图片历史",
                String.format("业主 %s 查看图片历史",
                    custom.getOname())
            );
        }
        return "custom/image-history";  // 返回历史记录页面的视图名
    }

    /**
     * 获取业主的图片历史记录
     * 
     * @param customId 业主ID
     * @return 图片历史记录列表，按上传时间倒序排序
     */
    @GetMapping("/getAllImagesByCustomId")
    @ResponseBody
    public List<Image> getAllImagesByCustomId(@RequestParam("customId") Integer customId) {
        List<Image> images = imageUpService.getAllImages(customId);
        Custom custom = customService.findCustomById(customId);
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看图片历史",
                String.format("业主 %s 查看图片历史",
                    custom.getOname())
            );
        }
        return images;
    }
}
