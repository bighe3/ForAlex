package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.Maintain;

import java.util.List;

public interface MaintainDao {
    List<Maintain> findallMaintain();
    Maintain findMaintainById(int id);
    int addMaintain(Maintain maintain);
    int updateMaintain(Maintain maintain);
    int deleteMaintain(int id);

    List<Maintain> findMaintainsById(int id);

    List<Maintain> selectMaintainByCustomId(Integer custom_id);


}
