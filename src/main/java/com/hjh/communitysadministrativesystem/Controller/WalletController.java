package com.hjh.communitysadministrativesystem.Controller;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Entity.PaymentRecord;
import com.hjh.communitysadministrativesystem.Entity.Wallet;
import com.hjh.communitysadministrativesystem.Service.WalletService;
import com.hjh.communitysadministrativesystem.Service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/wallet")
public class WalletController {

    @Autowired
    private WalletService walletService;

    @Autowired
    private LogService logService;

    @RequestMapping("/WalletList")
    public ModelAndView WalletList(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("walletList",walletService.selectAll());
        mv.setViewName("wallet/admin-wallet-list");
        return mv;
    }

    @PostMapping("/recharge")
    public String recharge(@RequestParam int wallet_id, @RequestParam double amount, HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        Wallet wallet = walletService.selectById(wallet_id);
        
        if (wallet != null) {
            wallet.setBalance(wallet.getBalance() + amount);
            int result = walletService.update(wallet);
            
            if (result > 0) {
                // 添加充值记录
                PaymentRecord paymentRecord = new PaymentRecord();
                paymentRecord.setWallet_id(wallet_id);
                paymentRecord.setAmount(amount);
                paymentRecord.setPayment_date(new Date());
                paymentRecord.setDescription("充值");
                walletService.insertPaymentRecord(paymentRecord);
                
                // 记录日志
                logService.recordLog(
                    custom.getOid(),
                    "user",
                    custom.getOname(),
                    "钱包充值",
                    String.format("业主 %s 充值金额: %.2f",
                        custom.getOname(),
                        amount)
                );
                return "success";
            }
        }
        return "failure";
    }

    @PostMapping("/refund")
    public String refund(@RequestParam int wallet_id, @RequestParam double amount) {
        Wallet wallet = walletService.selectById(wallet_id);
        if (wallet != null && wallet.getBalance() >= amount) {
            wallet.setBalance(wallet.getBalance() - amount);
            int result = walletService.update(wallet);
            if (result > 0) {
                // 添加退款记录到支付记录表
                PaymentRecord paymentRecord = new PaymentRecord();
                paymentRecord.setWallet_id(wallet_id);
                paymentRecord.setAmount(-amount); // 退款金额为负数
                paymentRecord.setPayment_date(new Date()); // 修改: setPaymentDate -> setPayment_date
                paymentRecord.setDescription("退款");
                walletService.insertPaymentRecord(paymentRecord);
                return "success";
            } else {
                return "failure";
            }
        } else {
            return "failure"; // 退款金额大于余额时返回失败
        }
    }

    @GetMapping("/payment-records")
    public ModelAndView paymentRecords(@RequestParam int id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Custom custom = (Custom) session.getAttribute("custom");
        List<PaymentRecord> paymentRecords = walletService.getPaymentRecordsByWalletId(id);
        mv.addObject("paymentRecords", paymentRecords);
        mv.setViewName("wallet/payment-records");
        
        // 获取钱包对应的 custom 对象
        Custom custom1 = walletService.selectById(id).getCustom();
        
        // 确保 custom1 不为空
        if (custom1 != null) {
            logService.recordLog(
                custom1.getOid(),
                "user",
                custom1.getOname(),
                "查看交易记录",
                String.format("业主 %s 查看钱包交易记录", custom1.getOname())
            );
        } else {
            // 如果 custom1 为空，使用 session 中的 custom 对象
            if (custom != null) {
                logService.recordLog(
                    custom.getOid(),
                    "user",
                    custom.getOname(),
                    "查看交易记录",
                    String.format("业主 %s 查看钱包交易记录", custom.getOname())
                );
            }
        }
        
        return mv;
    }

    @GetMapping("/balance/{walletId}")
    @ResponseBody
    public Double getBalance(@PathVariable Integer walletId,
                           HttpSession session) {
        Custom custom = (Custom) session.getAttribute("custom");
        Double balance = walletService.selectById(walletId).getBalance();
        
        logService.recordLog(
            custom.getOid(),
            "user",
            custom.getOname(),
            "查看余额",
            String.format("业主 %s 查看钱包余额: %.2f",
                custom.getOname(),
                balance)
        );
        return balance;
    }
}