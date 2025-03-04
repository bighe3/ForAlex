package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.Charge;

import java.util.List;

public interface ChargeService {
    Charge insertCharge(Charge charge);
    Charge getChargeById(int id);
    Charge updateCharge(Charge charge);
    boolean deleteCharge(int id);
    boolean generateMonthlyCharges(String billMonth, Double pricePerMetre);
    boolean payCharge(Long id, Double amount, int type);
    void deleteByCustomId(int customId);
    List<Charge> selectChargeByCustomId(Integer customId);
    List<Charge> selectAllCharge();


}
