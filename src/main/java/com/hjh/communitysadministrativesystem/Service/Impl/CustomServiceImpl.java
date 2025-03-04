package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Entity.Custom;
import com.hjh.communitysadministrativesystem.Service.CustomService;
import com.hjh.communitysadministrativesystem.dao.CustomDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomServiceImpl implements CustomService {

    @Autowired
    private CustomDao customDao;

    @Override
    public Custom selectOne(String oaccount, String opassword) {
        return customDao.selectOne(oaccount, opassword);
    }

    @Override
    public List<Custom> selectAllCustom() {
        return customDao.selectAllCustom();
    }

    @Override
    public Custom selectOneById(Integer oid) {
        Custom custom = customDao.selectOneById(oid);
        return custom;
    }

    @Override
    public int updateCustom(Custom custom) {
        int i = customDao.updateCustom(custom);
        return i;
    }

    @Override
    public int addCustom(Custom custom) {
        int i = customDao.addCustom(custom);
        return i;
    }

    @Override
    public int deleteById(Integer oid) {
        int i = customDao.deleteById(oid);
        return i;
    }

    @Override
    public int selectLastOwner() {
        int oid=customDao.selectLastOwner().getOid()+1;
        return oid;
    }

    @Override
    public Custom select(String oaccount, String opassword) {
        throw new UnsupportedOperationException("Unimplemented method 'select'");
    }

    @Override
    public Custom findCustomById(int oid) {
        return customDao.selectOneById(oid);
    }

}
