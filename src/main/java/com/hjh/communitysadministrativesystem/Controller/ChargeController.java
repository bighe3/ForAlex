package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Charge;
import com.hjh.communitysadministrativesystem.Service.ChargeService;
import com.hjh.communitysadministrativesystem.Service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Date;
import jakarta.servlet.http.HttpSession;
import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.Service.CustomService;
import com.hjh.communitysadministrativesystem.Entity.adminUser;

@Controller
@RequestMapping("/charge")
public class ChargeController {

    @Autowired
    private ChargeService chargeService;

    @Autowired
    private WalletService walletService;

    @Autowired
    private LogService logService;

    @Autowired
    private CustomService customService;

    @RequestMapping("/toChargeList")
    public ModelAndView toChargeList(HttpSession session)
    {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "查看收费记录",
                "管理员 " + admin.getAname() + " 查看所有收费记录"
        );

        ModelAndView md = new ModelAndView();
        md.addObject("charges", chargeService.selectAllCharge());
        md.setViewName("charge/charge-list");
        return md;

    }

    @RequestMapping("/toChargeAdd")
    public ModelAndView toChargeAdd()
    {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("charge/charge-add");
        return mv;
    }

    @RequestMapping("/addCharge")
    public ModelAndView addCharge(Charge charge, HttpSession session) {
        ModelAndView md = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        // 设置默认值
        charge.setStatus("unpaid");
        charge.setSdate(new Date());
        
        Charge result = chargeService.insertCharge(charge);
        if (result != null) {
            // 直接使用传入的 charge 对象，因为它包含了生成的 ID
            Custom custom = customService.findCustomById(charge.getCustom_id());
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "添加收费",
                String.format("管理员 %s 为业主 %s 添加收费项目: %s, 金额: %.2f", 
                    admin.getAname(), 
                    custom.getOname(),
                    charge.getName(),
                    charge.getTcost())
            );
            md.setViewName("redirect:/charge/toChargeList");
        } else {
            md.setViewName("error");
        }
        return md;
    }

    @RequestMapping("/toEditById")
    public ModelAndView toEditById(int id)
    {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("charge/charge-edit");
        mv.addObject("charge",chargeService.getChargeById(id));
        return mv;
    }

    @RequestMapping("/updateCharge")
    public ModelAndView updateCharge(Charge charge, HttpSession session) {
        ModelAndView md = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        Charge result = chargeService.updateCharge(charge);
        if (result != null) {
            Custom custom = customService.findCustomById(charge.getCustom_id());
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "修改收费",
                String.format("管理员 %s 修改业主 %s 的收费项目: %s, 新金额: %.2f",
                    admin.getAname(),
                    custom.getOname(),
                    charge.getName(),
                    charge.getTcost())
            );
            md.setViewName("redirect:/charge/toChargeList");
        } else {
            md.setViewName("error");
        }
        return md;
    }

    @RequestMapping("/chargeDelete")
    public ModelAndView chargeDelete(int id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        
        // 在删除前先获取收费记录信息
        Charge charge = chargeService.getChargeById(id);
        if (charge != null) {
            Custom custom = customService.findCustomById(charge.getCustom_id());
            
            // 执行删除操作
            chargeService.deleteCharge(id);
            
            // 记录日志
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "删除收费",
                String.format("管理员 %s 删除业主 %s 的收费项目: %s, 金额: %.2f",
                    admin.getAname(),
                    custom.getOname(),
                    charge.getName(),
                    charge.getTcost())
            );
        }
        
        mv.setViewName("redirect:/charge/toChargeList");
        return mv;
    }

    // 生成月度账单
    @PostMapping("/generateMonthly")
    @ResponseBody
    public String generateMonthlyCharges(@RequestParam String billMonth, 
                                       @RequestParam Double pricePerMetre,
                                       HttpSession session) {
        adminUser admin = (adminUser) session.getAttribute("adminUser");
        boolean success = chargeService.generateMonthlyCharges(billMonth, pricePerMetre);
        
        if (success) {
            logService.recordLog(
                admin.getAid(),
                "admin",
                admin.getAname(),
                "生成月度账单",
                String.format("管理员 %s 生成 %s 月度账单, 单价: %.2f/㎡",
                    admin.getAname(),
                    billMonth,
                    pricePerMetre)
            );
        }
        return success ? "success" : "failed";
    }
    
    // 支付账单
    @PostMapping("/pay/{id}")
    @ResponseBody
    public String payCharge(@PathVariable("id") Long id, 
                           @RequestParam Double amount,
                           HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        Charge charge = chargeService.getChargeById(id.intValue());
        
        int type = 1;
        boolean success = chargeService.payCharge(id, amount, type);
        
        if (success) {
            logService.recordLog(
                custom.getOid(),
                "user",
                custom.getOname(),
                "支付账单",
                String.format("业主 %s 支付账单: %s, 金额: %.2f",
                    custom.getOname(),
                    charge.getName(),
                    amount)
            );
        }
        return success ? "success" : "failed";
    }

}
