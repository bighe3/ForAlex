package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.OperationLog;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import com.hjh.communitysadministrativesystem.Entity.notice;
import com.hjh.communitysadministrativesystem.Service.AdminService;
import com.hjh.communitysadministrativesystem.Service.CustomService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Service.NoticeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private CustomService customService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private LogService logService;

    public OperationLog log=new OperationLog();

    /**
     * 登录方法
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam String usertype,
                              @RequestParam String aaccount,
                              @RequestParam String apassword,
                              HttpSession session) {
        ModelAndView mv = new ModelAndView();
        notice notice1 = new notice();

        switch (usertype) {
            case "admin" -> {
                adminUser adminUser = adminService.selectOne(aaccount, apassword);
                if (adminUser != null) {
                    logService.recordLog(
                        adminUser.getAid(),
                        "admin",
                        adminUser.getAname(),
                        "登录",
                        "管理员 " + adminUser.getAname() + " 登录系统"
                    );
                    session.setAttribute("adminUser", adminUser);
                    mv.setViewName("redirect:/admin/adminindex");
                } else {
                    mv.addObject("msg", "用户名或密码错误！");
                    mv.setViewName("index"); // 修改为正确的登录页面路径
                }
            }
            case "user" -> {
                Custom custom = customService.selectOne(aaccount, apassword);
                if (custom != null) {
                    logService.recordLog(
                        custom.getOid(),
                        "user",
                        custom.getOname(),
                        "登录",
                        "业主 " + custom.getOname() + " 登录系统"
                    );
                    session.setAttribute("custom", custom); // 设置会话信息
                    mv.setViewName("redirect:/user/customindex"); // 重定向到房主主页
                    List<notice> notice=noticeService.findAllNotice();
                    notice1 = notice.get(notice.size()-1);
                    session.setAttribute("notice", notice1);
                } else {
                    mv.setViewName("index"); // 返回登录页面
                    mv.addObject("error", "房主账户或密码错误"); // 添加错误信息
                }
            }
            default -> {
                mv.setViewName("index"); // 返回登录页面
                mv.addObject("error", "无效的用户类型，请选择正确的用户类型！"); // 提示选择用户类型
            }
        }

        return mv;
    }

    /**
     * 登出方法
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        if (admin != null) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "登出",
                "管理员 " + admin.getAname() + " 退出系统"
            );
        }
        session.invalidate();
        return "index";
    }

    /**
     * 管理员主页
     */
    @RequestMapping("/adminindex")
    public ModelAndView adminIndex() {
        return new ModelAndView("admin/adminindex"); // 渲染管理员主页
    }

    @RequestMapping("/tohome")
    public ModelAndView tohome() {
        return new ModelAndView("admin/adminindex"); // 渲染管理员主页
    }

    @RequestMapping("/adminlist")
    public ModelAndView adminlist(HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "查看管理员列表",
            "管理员 " + admin.getAname() + " 查看所有管理员信息"
        );
    
        ModelAndView md = new ModelAndView();
        md.addObject("adminlist", adminService.findAll());
        md.setViewName("admin/admin-list");
        return md;
    }

    @RequestMapping("/toEditById")
    public ModelAndView toEditById(Integer aid, HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "编辑管理员",
            "管理员 " + admin.getAname() + " 修改管理员ID: " + aid + " 的信息"
        );
    
        ModelAndView md = new ModelAndView();
        md.addObject("admin", adminService.selectById(aid));
        md.setViewName("admin/admin-edit");
        return md;
    }

    @RequestMapping("/editById")
    public ModelAndView editById(adminUser adminUser, HttpSession session) {
        ModelAndView md = new ModelAndView();
        adminService.updateAdmin(adminUser);
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "编辑管理员",
            "管理员 " + admin.getAname() + " 修改管理员ID: " + adminUser.getAid() + " 的信息"
        );
        md.setViewName("redirect:/admin/adminlist");
        return md;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd() {
        ModelAndView md = new ModelAndView();
        md.setViewName("admin/admin-add");
        return md;
    }

    @RequestMapping("/adminAdd")
    public ModelAndView adminAdd(adminUser adminUser, HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        ModelAndView md = new ModelAndView();
    
        int i = adminService.addAdmin(adminUser);
        if (i > 0) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "添加管理员",
                "管理员 " + admin.getAname() + " 添加新管理员: " + adminUser.getAname()
            );
            md.setViewName("redirect:/admin/adminlist");
        } else {
            md.setViewName("error");
            md.addObject("error", "添加失败！");
        }
        return md;
    }

    @RequestMapping("/deleteById")
    public ModelAndView deleteById(Integer aid, HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
            admin.getAid(),
            "admin",
            admin.getAname(),
            "删除管理员",
            "管理员 " + admin.getAname() + " 删除管理员ID: " + aid
        );
    
        ModelAndView md = new ModelAndView();
        adminService.deleteById(aid);
        md.setViewName("redirect:/admin/adminlist");
        return md;
    }

    /**
     * 处理根路径，重定向到登录页面
     */
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/log")
    public ModelAndView Log() {
        ModelAndView md = new ModelAndView();
        md.addObject("logs", logService.getAllLogs());
        md.setViewName("log/admin-log-list");
        return md;
    }

    @RequestMapping("/log/view")
    public ModelAndView viewOperationLogs(@RequestParam(required = false) String type) {
        ModelAndView mv = new ModelAndView();
        List<OperationLog> logs;
        if (type != null && !type.isEmpty()) {
            logs = logService.findLogsByType(type);
        } else {
            logs = logService.findAllLogs();
        }
        mv.addObject("logs", logs);
        mv.setViewName("log/admin-log-list");
        return mv;
    }
}