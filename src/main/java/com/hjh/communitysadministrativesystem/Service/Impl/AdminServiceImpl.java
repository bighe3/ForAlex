package com.hjh.communitysadministrativesystem.Service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import com.hjh.communitysadministrativesystem.Service.AdminService;
import com.hjh.communitysadministrativesystem.dao.AdminDao;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public PageInfo<adminUser> findPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<adminUser> adminUsers = adminDao.selectList();
        return new PageInfo<>(adminUsers);
    }
    @Override
    public adminUser selectOne(String aaccount, String apassword) {
        return adminDao.selectOne(aaccount,apassword);
    }

    @Override
    public List<adminUser> findAll() {
        List<adminUser> adminUsers = adminDao.selectList();
        return adminUsers;
    }


    @Override
    public adminUser selectById(Integer aid) {
        return adminDao.selectById(aid);
    }

    @Override
    public int updateAdmin(adminUser adminUser) {
        return adminDao.updateAdmin(adminUser);
    }

    @Override
    public int addAdmin(adminUser adminUser) {
        int i = adminDao.addAdmin(adminUser);
        return i;
    }

    @Override
    public int deleteById(Integer aid) {
        return adminDao.deleteById(aid);
    }
}
