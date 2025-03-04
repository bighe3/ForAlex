package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.Wallet;


import java.util.List;

public interface WalletDao {

    int insert(Wallet wallet);

    Wallet selectById(int wallet_id);

    List<Wallet> selectAll();

    List<Wallet> selectAllWithCustomInfo();

    int update(Wallet wallet);

    int delete(int wallet_id);

    Wallet selectByCustomId(Integer custom_id);

    int updateBalance(Wallet wallet);
}