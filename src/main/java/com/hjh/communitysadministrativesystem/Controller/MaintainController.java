package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Maintain;
import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import com.hjh.communitysadministrativesystem.Service.MaintainService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Service.CustomService;
import com.hjh.communitysadministrativesystem.Service.ChargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Maintain")
public class MaintainController {

    @Autowired
    private MaintainService maintainService;

    @Autowired
    private LogService logService;

    @Autowired
    private CustomService customService;

    @Autowired
    private ChargeService chargeService;

    @RequestMapping("/toMaintain")
    public ModelAndView toMaintain() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Maintain/findallMaintain");
        return mv;
    }

    @RequestMapping("/findallMaintain")
    public ModelAndView findallMaintain() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("maintains", maintainService.findallMaintain());
        mv.setViewName("maintain/maintain-list");
        return mv;
    }


    @RequestMapping("/toAdd")
    public ModelAndView toAdd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("maintain/maintain-add");
        return mv;
    }

    @RequestMapping("/addMaintain")
    public ModelAndView addMaintain(Maintain maintain, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Custom custom = (Custom) session.getAttribute("custom");
        
        maintain.setStatus("pending");
        maintain.setSdate(new Date());
        maintain.setCustom_id(custom.getOid());
        
        int result = maintainService.addMaintain(maintain);
        if (result > 0) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "提交维修",
                String.format("业主 %s 提交维修申请: %s",
                    custom.getOname(),
                    maintain.getThing())
            );
        }
        mv.setViewName("redirect:/Maintain/findallMaintain");
        return mv;
    }

    @RequestMapping("/toEditById")
    public ModelAndView toEditById(int mid) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("maintain", maintainService.findMaintainById(mid));
        mv.setViewName("maintain/maintain-edit");
        return mv;
    }

    @RequestMapping("/editById")
    public ModelAndView editById(@ModelAttribute Maintain maintain) {
        System.out.println(maintain);
        ModelAndView mv = new ModelAndView();
        int result = maintainService.updateMaintain(maintain);

        if (result > 0) {
            System.out.println(maintain);
            int custom_id=maintainService.findMaintainById(Math.toIntExact(maintain.getMid())).getCustom_id();
            Custom custom = customService.findCustomById(custom_id);
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "编辑维修",
                String.format("业主 %s 编辑维修申请: %s",
                    custom.getOname(),
                    maintain.getThing())
            );
        }
        mv.setViewName("redirect:/Maintain/findallMaintain");
        return mv;
    }

    @RequestMapping("/deleteById")
    public ModelAndView deleteById(int mid) {
        ModelAndView mv = new ModelAndView();
        Maintain maintain = maintainService.findMaintainById(mid);
        if (maintain != null) {
            int result = maintainService.deleteMaintain(mid);
            if (result > 0) {
                Custom custom = customService.findCustomById(maintain.getCustom_id());
                logService.recordLog(
                    custom.getOid(),
                    "user",
                    custom.getOname(),
                    "删除维修",
                    String.format("业主 %s 删除维修申请: %s",
                        custom.getOname(),
                        maintain.getThing())
                );
            }
        }
        mv.setViewName("redirect:/Maintain/findallMaintain");
        return mv;
    }

    @PostMapping("/pay/{id}")
    @ResponseBody
    public String payCharge(@PathVariable("id") Long id,
                            @RequestParam Double amount) {
        int type=2;
        boolean success = chargeService.payCharge(id, amount, type);
        return success ? "success" : "failed";
    }

    @PostMapping("/complete/{id}")
    @ResponseBody
    public String completeMaintain(@PathVariable("id") Long id,
                                  @RequestParam Double amount) {
        try {
            // 1. 获取维修记录
            Maintain maintain = maintainService.findMaintainById(id.intValue());
            if (maintain == null || "已完成".equals(maintain.getStatus())) {
                return "failed";
            }

            // 2. 先尝试扣款
            boolean success = chargeService.payCharge(id, amount, 2);
            if (!success) {
                return "failed";
            }

            // 3. 扣款成功后更新维修状态
            maintain.setStatus("已完成");
            maintain.setRdate(new Date());
            maintain.setScost(amount);
            maintainService.updateMaintain(maintain);

            Custom custom = customService.findCustomById(maintain.getCustom_id());
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "完成维修",
                String.format("业主 %s 完成维修申请: %s",
                    custom.getOname(),
                    maintain.getThing())
            );

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }
    }

    @RequestMapping("/processMaintain")
    public ModelAndView processMaintain(Integer id, String status, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
    
        Maintain maintain = maintainService.findMaintainById(id);
        maintain.setStatus(status);
        maintain.setRdate(new Date());
    
        int result = maintainService.updateMaintain(maintain);
        if (result > 0) {
            Custom custom = customService.findCustomById(maintain.getCustom_id());
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "处理维修",
                String.format("管理员 %s 处理业主 %s 的维修申请: %s, 状态: %s",
                    admin.getAname(),
                    custom.getOname(),
                    maintain.getThing(),
                    status)
            );
        }
        mv.setViewName("redirect:/Maintain/findallMaintain");
        return mv;
    }

}
