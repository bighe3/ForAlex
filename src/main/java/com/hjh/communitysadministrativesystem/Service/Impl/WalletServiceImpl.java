package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Service.WalletService;
import com.hjh.communitysadministrativesystem.dao.WalletDao;
import com.hjh.communitysadministrativesystem.Entity.Wallet;
import com.hjh.communitysadministrativesystem.Entity.PaymentRecord;
import com.hjh.communitysadministrativesystem.dao.PaymentRecordDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class WalletServiceImpl implements WalletService {

    @Autowired
    private WalletDao walletDao;

    @Autowired
    private PaymentRecordDao paymentRecordDao;

    @Override
    public int insert(Wallet wallet) {
        return walletDao.insert(wallet);
    }

    @Override
    public Wallet selectById(int wallet_id) {
        return walletDao.selectById(wallet_id);
    }

    @Override
    public List<Wallet> selectAll() {
        return walletDao.selectAll();
    }

    @Override
    public int update(Wallet wallet) {
        return walletDao.update(wallet);
    }

    @Override
    public int delete(int wallet_id) {
        return walletDao.delete(wallet_id);
    }

    @Override
    public Wallet selectByCustomId(Integer custom_id) {
        return walletDao.selectByCustomId(custom_id);
    }

    @Override
    public List<PaymentRecord> getPaymentRecordsByWalletId(int walletId) {
        return paymentRecordDao.selectByWalletId(walletId);
    }

    @Override
    public void insertPaymentRecord(PaymentRecord paymentRecord) {
        paymentRecordDao.insert(paymentRecord);
    }

    @Override
    public Wallet getWalletByCustomId(Integer customId) {
        if (customId == null) {
            return null;
        }
        return walletDao.selectByCustomId(customId);
    }

    @Transactional
    @Override
    public boolean deductBalance(Integer walletId, Double amount) {
        try {
            Wallet wallet = walletDao.selectById(walletId);
            if (wallet == null || wallet.getBalance() < amount) {
                return false;
            }

            double newBalance = wallet.getBalance() - amount;
            wallet.setBalance(newBalance);
            wallet.setWallet_id(walletId);

            boolean success = walletDao.update(wallet) > 0;
            if (success) {
                PaymentRecord record = new PaymentRecord();
                record.setWallet_id(walletId);
                record.setAmount(-amount);
                record.setPayment_date(new Date());
                record.setDescription("物业费支付");
                paymentRecordDao.insert(record);
            }
            return success;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public void deleteByCustomId(Integer customId) {
        if (customId == null) {
            return;
        }
        
        // 1. 获取钱包信息
        Wallet wallet = walletDao.selectByCustomId(customId);
        if (wallet == null) {
            return;
        }
        
        // 2. 删除钱包相关的支付记录
        paymentRecordDao.deleteByWalletId(wallet.getWallet_id());
        
        // 3. 删除钱包
        walletDao.delete(wallet.getWallet_id());
    }

    @Override
    public int updateBalance(Wallet wallet) {
        return walletDao.updateBalance(wallet);
    }
}