package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Entity.Maintain;
import com.hjh.communitysadministrativesystem.Service.MaintainService;
import com.hjh.communitysadministrativesystem.dao.MaintainDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaintainServiceImpl implements MaintainService {

    @Autowired
    private MaintainDao maintainDao;

    @Override
    public List<Maintain> findallMaintain() {
        List<Maintain> maintainList = maintainDao.findallMaintain();
        return maintainList;
    }

    @Override
    public Maintain findMaintainById(int mid) {
        return maintainDao.findMaintainById(mid);
    }

    @Override
    public int addMaintain(Maintain maintain) {
        int i = maintainDao.addMaintain(maintain);
        return i;
    }

    @Override
    public int updateMaintain(Maintain maintain) {
        int i = maintainDao.updateMaintain(maintain);
        return i;
    }

    @Override
    public int deleteMaintain(int mid) {
        int i = maintainDao.deleteMaintain(mid);
        return i;
    }

    @Override
    public List<Maintain> findMaintainsById(int mid) {
        List<Maintain> maintainList = maintainDao.findMaintainsById(mid);
        return maintainList;
    }

    @Override
    public List<Maintain> selectMaintainByCustomId(Integer custom_id) {
        List<Maintain> maintainList= maintainDao.selectMaintainByCustomId(custom_id);
        return maintainList;
    }
}
