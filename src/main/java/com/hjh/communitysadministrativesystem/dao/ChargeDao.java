package com.hjh.communitysadministrativesystem.dao;

import java.util.List;
import com.hjh.communitysadministrativesystem.Entity.Charge;

public interface ChargeDao {

    void deleteByCustomId(int customId);

    List<Charge> selectChargeByCustomId(Integer customId);

    List<Charge> selectAllCharge();

    void insertCharge(Charge charge);

    Charge getChargeById(Long id);

    int updateCharge(Charge charge);

    boolean deleteCharge(int id);
}
