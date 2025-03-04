package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.notice;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import com.hjh.communitysadministrativesystem.Service.NoticeService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    
    @Autowired
    private LogService logService;

    @RequestMapping("/noticeList")
    public ModelAndView noticeList(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "查看公告",
            "管理员 " + admin.getAname() + " 查看所有公告"
        );
        
        mv.addObject("notice", noticeService.findAllNotice());
        mv.setViewName("/notice/notice-list");
        return mv;
    }



    @RequestMapping("/noticedelete")
    public ModelAndView noticedelete(Long id, HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        notice notice = noticeService.selectById(id);
        
        if (notice != null) {
            noticeService.deleteById(id);
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "删除公告",
                String.format("管理员 %s 删除公告: %s",
                    admin.getAname(),
                    notice.getTitle())
            );
        }
        return new ModelAndView("redirect:/notice/noticeList");
    }

    @RequestMapping("/toaddnotice")
    public ModelAndView toaddnotice(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("notice/notice-add");
        return mv;
    }

    @RequestMapping("/noticeadd")
    public ModelAndView noticeadd(notice notice, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        notice.setPubDate(new Date());
        notice.setPublisher(admin.getAname());
        
        if (noticeService.addNotice(notice) > 0) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "发布公告",
                String.format("管理员 %s 发布公告: %s",
                    admin.getAname(),
                    notice.getTitle())
            );
            mv.setViewName("redirect:/notice/noticeList");
        } else {
            mv.setViewName("error");
            mv.addObject("error", "添加失败！");
        }
        return mv;
    }

    @RequestMapping("/noticeSelectToEdit")
    public ModelAndView noticeSelectToEdit(Long id){
        ModelAndView mv=new ModelAndView();
        mv.addObject("notice", noticeService.selectById(id));
        System.out.println(noticeService.selectById(id));
        mv.setViewName("/notice/notice-edit");
        return mv;
    }

    @RequestMapping("/noticeEdit")
    public ModelAndView noticeEdit(notice notice, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        if (noticeService.updateNotice(notice) > 0) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "修改公告",
                String.format("管理员 %s 修改公告: %s",
                    admin.getAname(),
                    notice.getTitle())
            );
            mv.setViewName("redirect:/notice/noticeList");
        } else {
            mv.setViewName("error");
            mv.addObject("error", "修改失败！");
        }
        return mv;
    }

    @RequestMapping("/NoticeView")
    public ModelAndView NoticeView(Long id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/notice-view");
        mv.addObject("notice", noticeService.selectById(id));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看公告详情",
                "业主 " + custom.getOname() + " 查看公告ID: " + id
            );
        }
        return mv;
    }
}
