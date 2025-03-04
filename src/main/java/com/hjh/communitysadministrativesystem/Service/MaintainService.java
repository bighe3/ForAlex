package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.Maintain;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MaintainService{


    List<Maintain> findallMaintain();
    Maintain findMaintainById(int mid);
    int addMaintain(Maintain maintain);
    int updateMaintain(Maintain maintain);
    int deleteMaintain(int id);

    List<Maintain> findMaintainsById(int id);

    List<Maintain> selectMaintainByCustomId(Integer custom_id);

}
