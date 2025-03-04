package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.House;
import com.hjh.communitysadministrativesystem.Entity.Image;
import com.hjh.communitysadministrativesystem.Service.HouseService;
import com.hjh.communitysadministrativesystem.Service.ImageUpService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Entity.adminUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/house")
public class HouseController {

    @Autowired
    public HouseService houseService;

    @Autowired
    private ImageUpService imageUpService;

    @Autowired
    private LogService logService;

    @GetMapping("/getHistoryImages")
    @ResponseBody
    public ResponseEntity<?> getHistoryImages(@RequestParam("customId") int customId) {
        try {
            List<Image> historyImages = imageUpService.getAllImages(customId);
            return ResponseEntity.ok(historyImages);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of(
                "error", "获取历史图片失败",
                "message", e.getMessage()
            ));
        }
    }

    @RequestMapping("/houseList")
    public ModelAndView houseList(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        List<House> houses = houseService.selectAllHouse();
        // 为每个房屋加载图片
        for (House house : houses) {
            List<Image> images = imageUpService.getAllImages(house.getCustomId());
            house.setImages(images);
            
            List<Image> latestImages = imageUpService.getLatestImages(house.getCustomId());
            for (Image image : latestImages) {
                if ("approved".equals(image.getStatus())) {
                    house.setLatestApprovedImage(image);
                } else if ("pending".equals(image.getStatus())) {
                    house.setLatestPendingImage(image);
                }
            }
        }
        
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "查看房屋",
            "管理员 " + admin.getAname() + " 查看所有房屋信息"
        );
        
        mv.addObject("houseList", houses);
        mv.setViewName("house/house-list");
        return mv;
    }

    @RequestMapping("/toAddHouse")
    public ModelAndView toAddHouse() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("house/house-add");
        return mv;
    }

    @RequestMapping("/addHouse")
    public ModelAndView addHouse(House house, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        houseService.insertHouse(house);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "添加房屋",
            "管理员 " + admin.getAname() + " 添加新房屋"
        );
        mv.setViewName("redirect:/house/houseList");
        return mv;
    }

    @RequestMapping("/toEditById")
    public ModelAndView toEditById(int id) {
        ModelAndView mv=new ModelAndView();
        mv.addObject("house",houseService.selectHouseById(id));
        mv.setViewName("house/house-edit");
        return mv;
    }

    @RequestMapping("/editById")
    public ModelAndView editById(House house, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        houseService.updateHouse(house);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "编辑房屋",
            "管理员 " + admin.getAname() + " 编辑房屋ID: " + house.getId()
        );
        mv.setViewName("redirect:/house/houseList");
        return mv;
    }

    @RequestMapping("/deleteById")
    public ModelAndView deleteById(int id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        houseService.deleteHouse(id);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "删除房屋",
            "管理员 " + admin.getAname() + " 删除房屋ID: " + id
        );
        mv.setViewName("redirect:/house/houseList");
        return mv;
    }

    @GetMapping("/pendingImages")
    public String pendingImages(Model model) {
        List<Image> pendingImages = imageUpService.getPendingImages();
        model.addAttribute("pendingImages", pendingImages);
        return "admin/image-review";
    }

    @PostMapping("/reviewImage")
    @ResponseBody
    public ResponseEntity<?> reviewImage(
            @RequestParam("imageId") int imageId,
            @RequestParam("status") String status,
            @RequestParam("comment") String comment,
            HttpSession session) {
        try {
            imageUpService.reviewImage(imageId, status, comment);
            adminUser admin = (adminUser) session.getAttribute("adminUser");
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "审核图片",
                "管理员 " + admin.getAname() + " 审核图片ID: " + imageId + ", 状态: " + status
            );
            return ResponseEntity.ok().body(Map.of("success", true));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(Map.of(
                "success", false,
                "message", e.getMessage()
            ));
        }
    }

    @PostMapping("/approveTrade")
    @ResponseBody
    public ResponseEntity<?> approveTrade(@RequestParam("houseId") int houseId, @RequestParam("status") String status, HttpSession session) {
        try {
            House house = houseService.selectHouseById(houseId);
            if (house != null) {
                house.setStatus(status);
                houseService.updateHouse(house);
                adminUser admin = (adminUser) session.getAttribute("adminUser");
                logService.recordLog(
                    admin.getAid(),
                    "admin",
                    admin.getAname(),
                    "同意交易",
                    "管理员 " + admin.getAname() + " 同意交易ID: " + houseId
                );
                return ResponseEntity.ok().body(Map.of("success", true));
            } else {
                return ResponseEntity.badRequest().body(Map.of(
                    "success", false,
                    "message", "房屋信息不存在"
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(Map.of(
                "success", false,
                "message", e.getMessage()
            ));
        }
    }

    @PostMapping("/rejectTrade")
    @ResponseBody
    public ResponseEntity<?> rejectTrade(@RequestParam("houseId") int houseId, @RequestParam("status") String status, HttpSession session) {
        try {
            House house = houseService.selectHouseById(houseId);
            if (house != null) {
                house.setStatus(status);
                houseService.updateHouse(house);
                adminUser admin = (adminUser) session.getAttribute("adminUser");
                logService.recordLog(
                    admin.getAid(),
                    "admin",
                    admin.getAname(),
                    "拒绝交易",
                    "管理员 " + admin.getAname() + " 拒绝交易ID: " + houseId
                );
                return ResponseEntity.ok().body(Map.of("success", true));
            } else {
                return ResponseEntity.badRequest().body(Map.of(
                    "success", false,
                    "message", "房屋信息不存在"
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(Map.of(
                "success", false,
                "message", e.getMessage()
            ));
        }
    }
}
