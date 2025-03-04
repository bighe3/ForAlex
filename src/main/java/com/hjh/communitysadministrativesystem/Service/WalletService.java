package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.PaymentRecord;
import com.hjh.communitysadministrativesystem.Entity.Wallet;

import java.util.List;

public interface WalletService {

    int insert(Wallet wallet);

    Wallet selectById(int wallet_id);

    List<Wallet> selectAll();

    int update(Wallet wallet);

    int delete(int wallet_id);

    Wallet selectByCustomId(Integer custom_id);

    List<PaymentRecord> getPaymentRecordsByWalletId(int walletId);

    void insertPaymentRecord(PaymentRecord paymentRecord);

    Wallet getWalletByCustomId(Integer customId);
    
    boolean deductBalance(Integer walletId, Double amount);

    void deleteByCustomId(Integer customId);

    int updateBalance(Wallet wallet);
}