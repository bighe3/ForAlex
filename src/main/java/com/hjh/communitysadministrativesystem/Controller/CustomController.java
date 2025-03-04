package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.Wallet;
import com.hjh.communitysadministrativesystem.Service.WalletService;
import com.hjh.communitysadministrativesystem.Service.ChargeService;
import com.hjh.communitysadministrativesystem.dao.CustomDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import org.springframework.ui.Model;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;

import jakarta.servlet.http.HttpSession;

import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Entity.adminUser;


@Controller
@RequestMapping("/custom")
public class CustomController {

    @Autowired
    private CustomDao customDao;

    @Autowired
    private WalletService walletService;

    @Autowired
    private ChargeService chargeService; // 添加ChargeService

    @Autowired
    private LogService logService;

    @GetMapping("/selectAllCustom")
    public String selectAllCustom(Model model, HttpSession session) {
        List<Custom> customList = customDao.selectAllCustom();
        model.addAttribute("customlist", customList);
        System.out.println(customList);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "查看业主列表",
                "管理员 " + admin.getAname() + " 查看所有业主信息"
            );
        }
        return "customAccount/custom-list";
    }

    @GetMapping("/toAddCustom")
    public String showAddCustomForm(Model model, HttpSession session) {
        Custom lastOwner = customDao.selectLastOwner();
        model.addAttribute("lastOwner", lastOwner != null ? lastOwner.getOid() + 1 : 1);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "添加业主",
                "管理员 " + admin.getAname() + " 访问添加业主页面"
            );
        }
        return "customAccount/custom-add";
    }

    @PostMapping("/addCustom")
    public ModelAndView addCustom(Custom custom, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/custom/selectAllCustom");
        Wallet wallet=new Wallet();
        // 确保房屋面积不为空
        if (custom.getHouse_area() == null) {
            custom.setHouse_area(0.0);
        }

        custom.setOpendingrepairs("null");
        customDao.addCustom(custom);
        wallet.setCustom(custom);
        wallet.setCustom_oid(custom.getOid());
        wallet.setBalance(0.0);
        int i=walletService.insert(wallet);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "添加业主",
                "管理员 " + admin.getAname() + " 添加新业主: " + custom.getOname()
            );
        }
        return mv;
    }

    @GetMapping("/toUpdateCustom")
    public String showUpdateCustomForm(@RequestParam("oid") int oid, Model model, HttpSession session) {
        Custom customAccount = customDao.selectOneById(oid);
        model.addAttribute("customAccount", customAccount);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "编辑业主",
                "管理员 " + admin.getAname() + " 访问编辑业主页面ID: " + oid
            );
        }
        return "customAccount/custom-edit";
    }

    @PostMapping("/updateCustom")
    public String updateCustom(@ModelAttribute  Custom custom, RedirectAttributes redirectAttributes, HttpSession session) {
        // 确保房屋面积不为空
        if (custom.getHouse_area() == null) {
            custom.setHouse_area(0.0);
        }
        
        customDao.updateCustom(custom);
        redirectAttributes.addFlashAttribute("message", "业主信息更新成功");
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "编辑业主",
                "管理员 " + admin.getAname() + " 编辑业主ID: " + custom.getOid()
            );
        }
        return "redirect:/custom/selectAllCustom";
    }

    @GetMapping("/deleteCustom")
    @Transactional
    public String deleteCustom(@RequestParam("oid") int oid, RedirectAttributes redirectAttributes, HttpSession session) {
        try {
            // 1. 删除钱包记录
            walletService.deleteByCustomId(oid);
            
            // 2. 删除相关的费用记录
            chargeService.deleteByCustomId(oid);
            
            // 3. 删除业主信息
            customDao.deleteById(oid);
            
            redirectAttributes.addFlashAttribute("message", "业主信息删除成功");
            adminUser admin = (adminUser) session.getAttribute("adminUser");
            if (admin != null) {
                logService.recordLog(
                    admin.getAid(),
                    "admin",
                    admin.getAname(),
                    "删除业主",
                    "管理员 " + admin.getAname() + " 删除业主ID: " + oid
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "删除失败：" + e.getMessage());
        }
        return "redirect:/custom/selectAllCustom";
    }

    // 搜索业主接口
    @GetMapping("/search")
    @ResponseBody
    public List<Map<String, Object>> searchCustoms(@RequestParam(required = false) String q, HttpSession session) {
        List<Custom> customs;
        if (q != null && !q.trim().isEmpty()) {
            // 如果有搜索关键词，按名字或电话模糊搜索
            customs = customDao.searchCustoms("%" + q + "%");
        } else {
            // 否则返回所有业主
            customs = customDao.selectAllCustom();
        }
        
        // 转换为前端需要的格式
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "搜索业主",
                "管理员 " + admin.getAname() + " 搜索业主"
            );
        }
        return customs.stream()
                .map(custom -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("id", custom.getOid());
                    map.put("text", custom.getOname() + " - " + custom.getOphone());
                    return map;
                })
                .collect(Collectors.toList());
    }

    // 获取业主详细信息
    @GetMapping("/getInfo/{id}")
    @ResponseBody
    public Custom getCustomInfo(@PathVariable("id") Integer id, HttpSession session) {
        Custom custom = customDao.selectOneById(id);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "查看业主详情",
                "管理员 " + admin.getAname() + " 查看业主ID: " + id + " 的详情"
            );
        }
        return custom;
    }
}
