package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Entity.Charge;
import com.hjh.communitysadministrativesystem.Entity.Wallet;
import com.hjh.communitysadministrativesystem.Entity.Maintain;
import com.hjh.communitysadministrativesystem.Entity.PaymentRecord;
import com.hjh.communitysadministrativesystem.Service.ChargeService;
import com.hjh.communitysadministrativesystem.Service.WalletService;
import com.hjh.communitysadministrativesystem.dao.ChargeDao;
import com.hjh.communitysadministrativesystem.dao.PaymentRecordDao;
import com.hjh.communitysadministrativesystem.dao.MaintainDao;
import com.hjh.communitysadministrativesystem.dao.WalletDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ChargeServiceImpl implements ChargeService {

    @Autowired
    private ChargeDao chargeDao;

    @Autowired
    private WalletService walletService;

    @Autowired
    private PaymentRecordDao paymentRecordDao;

    @Autowired
    private MaintainDao maintainDao;

    @Autowired
    private WalletDao walletDao;

    @Override
    public void deleteByCustomId(int customId) {
        chargeDao.deleteByCustomId(customId);
    }

    @Override
    public List<Charge> selectChargeByCustomId(Integer customId) {
        return chargeDao.selectChargeByCustomId(customId);
    }

    @Override
    public List<Charge> selectAllCharge() {
        return chargeDao.selectAllCharge();
    }

    @Override
    public Charge insertCharge(Charge charge) {
        chargeDao.insertCharge(charge);
        return chargeDao.getChargeById(charge.getId());
    }

    @Override
    public Charge getChargeById(int id) {
        return chargeDao.getChargeById((long) id);
    }

    @Override
    public Charge updateCharge(Charge charge) {
        chargeDao.updateCharge(charge);
        return chargeDao.getChargeById(charge.getId());
    }

    @Override
    public boolean deleteCharge(int id) {
        return chargeDao.deleteCharge(id);
    }

    @Override
    public boolean generateMonthlyCharges(String billMonth, Double pricePerMetre) {
        List<Charge> charges = chargeDao.selectAllCharge();
        for (Charge charge : charges) {
            Charge newCharge = new Charge();
            newCharge.setName(charge.getName());
            newCharge.setMetre(charge.getMetre());
            newCharge.setUsername(charge.getUsername());
            newCharge.setStatus("unpaid");
            newCharge.setSdate(new Date());
            newCharge.setTcost(charge.getMetre() * pricePerMetre);
            newCharge.setScost(0.0);
            newCharge.setSmemo("Monthly charge for " + billMonth);
            newCharge.setCustom_id(charge.getCustom_id());
            newCharge.setBillMonth(billMonth);
            chargeDao.insertCharge(newCharge);
        }
        return true;
    }

    @Override
    public boolean payCharge(Long id, Double amount, int type) {
        if (type == 1) {
            try {
                // 1. 获取账单信息
                Charge charge = chargeDao.getChargeById(id);
                if (charge == null || !"unpaid".equals(charge.getStatus())) {
                    return false;
                }

                // 2. 获取钱包信息
                Wallet wallet = walletService.getWalletByCustomId(charge.getCustom_id());
                if (wallet == null) {
                    return false;
                }

                // 3. 扣款
                boolean deductSuccess = walletService.deductBalance(wallet.getWallet_id(), amount);
                if (!deductSuccess) {
                    return false;
                }

                // 4. 更新账单状态
                charge.setStatus("paid");
                charge.setRdate(new Date());
                charge.setScost(amount);

                return chargeDao.updateCharge(charge) > 0;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        } else if (type == 2) {
            try {
                // 1. 获取维修记录
                Maintain maintain = maintainDao.findMaintainById(id.intValue());
                if (maintain == null) {
                    return false;
                }

                // 2. 获取钱包信息
                Wallet wallet = walletService.getWalletByCustomId(maintain.getCustom_id());
                if (wallet == null) {
                    return false;
                }

                // 3. 直接更新钱包余额，不创建支付记录
                double newBalance = wallet.getBalance() - amount;
                if (newBalance < 0) {
                    return false;
                }
                wallet.setBalance(newBalance);
                if (walletDao.updateBalance(wallet) <= 0) {
                    return false;
                }

                // 4. 创建维修费用的支付记录
                PaymentRecord record = new PaymentRecord();
                record.setWallet_id(wallet.getWallet_id());
                record.setAmount(-amount);
                record.setPayment_date(new Date());
                record.setDescription("维修费用支付 - " + maintain.getThing());
                paymentRecordDao.insert(record);

                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        } else {
            return false;
        }
    }
}