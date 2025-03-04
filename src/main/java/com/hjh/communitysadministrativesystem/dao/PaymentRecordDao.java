package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.PaymentRecord;

import java.util.List;

public interface PaymentRecordDao {

    List<PaymentRecord> selectByWalletId(int walletId);

    void insert(PaymentRecord paymentRecord);

    void delete(Long id);

    void deleteByWalletId(Integer walletId);
}