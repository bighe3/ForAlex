package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.*;
import com.hjh.communitysadministrativesystem.Service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private CustomService customService;

    @Autowired
    private ChargeService chargeService;

    @Autowired
    private MaintainService maintainService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private WalletService walletService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private ImageUpService imageUpService;

    @Autowired
    private LogService logService;

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "登出",
                "业主 " + custom.getOname() + " 退出系统"
            );
        }
        session.invalidate();
        return "index";
    }

    @RequestMapping("/customindex")
    public ModelAndView customindex(HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "访问主页",
                "业主 " + custom.getOname() + " 访问主页"
            );
        }
        return new ModelAndView("custom/customindex");
    }

    @RequestMapping("/NoticeList")
    public ModelAndView NoticeList(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-notice-list");
        mv.addObject("notice", noticeService.findAllNotice());
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看公告",
                "业主 " + custom.getOname() + " 查看所有公告"
            );
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

    @RequestMapping("/findById")
    public ModelAndView findById(Integer oid, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-notice-list");
        mv.addObject("notice", noticeService.findAllNotice());
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看公告",
                "业主 " + custom.getOname() + " 查看所有公告"
            );
        }
        return mv;
    }

    @RequestMapping("/findCustomById")
    public ModelAndView findCustomById(Integer oid, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-custom-list");
        mv.addObject("custom", customService.selectOneById(oid));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看业主信息",
                "业主 " + custom.getOname() + " 查看业主ID: " + oid
            );
        }
        return mv;
    }

    @RequestMapping("/toEditById")
    public ModelAndView toEditById(Integer oid, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-change");
        mv.addObject("custom", customService.selectOneById(oid));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "编辑业主信息",
                "业主 " + custom.getOname() + " 编辑业主ID: " + oid
            );
        }
        return mv;
    }

    @RequestMapping("/findByIdToCharge")
    public ModelAndView findByIdToCharge(Integer custom_id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-charge-list");
        mv.addObject("charges", chargeService.selectChargeByCustomId(custom_id));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看收费记录",
                "业主 " + custom.getOname() + " 查看所有收费记录"
            );
        }
        return mv;
    }

    @RequestMapping("/findCustomMaintainById")
    public ModelAndView findCustomMaintainById(Integer custom_id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-maintain-list");
        mv.addObject("maintains", maintainService.selectMaintainByCustomId(custom_id));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看维修记录",
                "业主 " + custom.getOname() + " 查看所有维修记录"
            );
        }
        return mv;
    }

    @RequestMapping("/findCustomByIdToHouse")
    public ModelAndView findCustomByIdToHouse(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            List<House> houses = houseService.selectHouseByCustomId(custom.getOid());
            
            // 检查房屋列表是否为空或房屋对象是否为null
            if (houses == null || houses.isEmpty()) {
                mv.addObject("error", "没有找到该业主的房屋信息");
                mv.setViewName("custom/user-house-list");
                return mv;
            }

            // 获取最新的图片（包括已审核和待审核）
            for (House house : houses) {
                if (house == null) {
                    mv.addObject("error", "房屋信息不完整");
                    mv.setViewName("custom/user-house-list");
                    return mv;
                }
                List<Image> latestImages = imageUpService.getLatestImages(house.getCustomId());
                // 设置最新的审核通过图片和待审核图片
                for (Image image : latestImages) {
                    if ("approved".equals(image.getStatus())) {
                        house.setLatestApprovedImage(image);
                    } else if ("pending".equals(image.getStatus())) {
                        house.setLatestPendingImage(image);
                    }
                }
            }
            
            mv.setViewName("custom/user-house-list");
            mv.addObject("house", houses);
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看房屋信息",
                "业主 " + custom.getOname() + " 查看所有房屋信息"
            );
        } else {
            mv.setViewName("redirect:/login");
        }
        return mv;
    }

    @RequestMapping("/toAddMaintain")
    public ModelAndView toAddMaintain() {
        return new ModelAndView("custom/user-maintain-add");
    }

    @RequestMapping("/addMaintain")
    public ModelAndView addMaintain(Maintain maintain, HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        maintain.setCustom_id(custom.getOid());
        ModelAndView mv = new ModelAndView();
        mv.addObject("maintains", maintainService.addMaintain(maintain));
        mv.setViewName("redirect:/user/findCustomMaintainById?custom_id=" + custom.getOid());
        logService.recordLog(
            custom.getOid(),
            "user",
            custom.getOname(),
            "添加维修记录",
            "业主 " + custom.getOname() + " 添加维修记录"
        );
        return mv;
    }

    @RequestMapping("/deleteById")
    public ModelAndView deleteById(Integer mid, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Custom custom = (Custom) session.getAttribute("custom");
        mv.addObject("maintains", maintainService.deleteMaintain(mid));
        mv.setViewName("redirect:/user/findCustomMaintainById?custom_id=" + custom.getOid());
        logService.recordLog(
            custom.getOid(),
            "user",
            custom.getOname(),
            "删除维修记录",
            "业主 " + custom.getOname() + " 删除维修记录ID: " + mid
        );
        return mv;
    }

    @RequestMapping("/toWalletByCustomOid")
    public ModelAndView toWalletByCustomOid(Integer custom_oid, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-wallet");
        mv.addObject("wallets", walletService.selectByCustomId(custom_oid));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看钱包信息",
                "业主 " + custom.getOname() + " 查看钱包信息"
            );
        }
        return mv;
    }

    @RequestMapping("/payment-records")
    public ModelAndView paymentRecords(Integer walletId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-payment-records");
        mv.addObject("paymentRecords", walletService.getPaymentRecordsByWalletId(walletId));
        Custom custom = (Custom) session.getAttribute("custom");
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看支付记录",
                "业主 " + custom.getOname() + " 查看支付记录"
            );
        }
        return mv;
    }

    @RequestMapping("/toFeedbackList")
    public ModelAndView toFeedbackList(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("custom/user-feedback-list");
        Custom custom = (Custom) session.getAttribute("custom");
        mv.addObject("feedbacks", feedbackService.findFeedbackByUserId(custom.getOid()));
        if (custom != null) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "查看反馈信息",
                    "业主 " + custom.getOname() + " 查看支付记录"
            );
        }
        return mv;
    }

    @RequestMapping("/toAddFeedback")
    public ModelAndView toAddFeedback() {
        return new ModelAndView("custom/user-feedback-add");
    }

    @RequestMapping("/addFeedback")
    public ModelAndView addFeedback(Feedback feedback, HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        System.out.println(feedback);
        ModelAndView mv = new ModelAndView();
        mv.addObject("feedbacks", feedbackService.insertFeedback(feedback));
        mv.setViewName("redirect:/user/toFeedbackList");
        logService.recordLog(
            custom.getOid(),
            "user",
            custom.getOname(),
                "添加反馈信息",
                "业主 " + custom.getOname() + "添加反馈"
        );
        return mv;
    }

    @RequestMapping("/log")
    public ModelAndView log(HttpSession session) {
        ModelAndView mv=new ModelAndView();
        String Oname=((Custom)session.getAttribute("custom")).getOname();
        mv.addObject("logs",logService.findLogsByTypeAndOname("user",Oname));

        mv.setViewName("log/user-log-list");


        return mv;
    }


}