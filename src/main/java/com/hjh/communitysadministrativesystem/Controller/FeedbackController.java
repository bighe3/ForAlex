package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.Feedback;
import com.hjh.communitysadministrativesystem.Service.CustomService;
import com.hjh.communitysadministrativesystem.Service.FeedbackService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private LogService logService;

    @Autowired
    private CustomService customService;

    @RequestMapping("/toFeedback")
    public ModelAndView toFeedback(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        List<Feedback> feedbacks = feedbackService.findallFeedback();
        mv.addObject("feedbacks", feedbacks);
        mv.setViewName("feedback/feedback-list");

        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "查看反馈",
                "管理员 " + admin.getAname() + " 查看所有反馈"
            );
        }

        return mv;
    }

    @RequestMapping("/toAddFeedback")
    public ModelAndView toAddFeedback() {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("feedback/user-feedback-add");
        return mv;
    }

    @RequestMapping("/addFeedback")
    public ModelAndView addFeedback(Feedback feedback, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Custom custom = (Custom) session.getAttribute("custom");
        
        feedback.setStatus("pending");
        feedback.setItime(new Date());
        feedback.setUser_id(custom.getOid());
        
        int result = feedbackService.insertFeedback(feedback);
        if (result > 0) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "提交反馈",
                String.format("业主 %s 提交反馈: %s",
                    custom.getOname(),
                    feedback.getContent())
            );
        }
        mv.setViewName("redirect:/Feedback/toFeedback");
        return mv;
    }

    @RequestMapping("/toEditFeedback")
    public ModelAndView toEditFeedback(int id) {
        ModelAndView mv=new ModelAndView();
        mv.addObject("feedback",feedbackService.findFeedbackById(id));
        mv.setViewName("feedback/feedback-edit");
        return mv;
    }

    @RequestMapping("/editFeedback")
    public ModelAndView editFeedback(Feedback feedback, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        feedback.setItime(feedbackService.findFeedbackById(feedback.getId()).getItime());
        System.out.println(feedback);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        int result = feedbackService.updateFeedback(feedback);
        if (result > 0) {
            Custom custom = customService.findCustomById(feedback.getUser_id());
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "处理反馈",
                String.format("管理员 %s 处理业主 %s 的反馈: %s, 状态: %s",
                    admin.getAname(),
                    custom.getOname(),
                    feedback.getContent(),
                    feedback.getStatus())
            );
        }
        mv.setViewName("redirect:/Feedback/toFeedback");
        return mv;
    }

    @RequestMapping("/deleteFeedback")
    public ModelAndView deleteFeedback(int id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        Feedback feedback = feedbackService.findFeedbackById(id);
        if (feedback != null) {
            Custom custom = customService.findCustomById(feedback.getUser_id());
            feedbackService.deleteFeedback(id);
            
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "删除反馈",
                String.format("管理员 %s 删除业主 %s 的反馈: %s",
                    admin.getAname(),
                    custom.getOname(),
                    feedback.getContent())
            );
        }
        mv.setViewName("redirect:/Feedback/toFeedback");
        return mv;
    }


}
