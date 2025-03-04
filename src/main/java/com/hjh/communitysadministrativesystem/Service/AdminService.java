package com.hjh.communitysadministrativesystem.Service;

import com.github.pagehelper.PageInfo;
import com.hjh.communitysadministrativesystem.Entity.adminUser;

import java.util.List;

public interface AdminService {
    public PageInfo<adminUser> findPage(int pageNum,int pageSize);

    public adminUser selectOne(String aaccount, String apassword);

    public List<adminUser> findAll();


    public adminUser selectById(Integer aid);

    public int updateAdmin(adminUser adminUser);

    public int addAdmin(adminUser adminUser);

    public int deleteById(Integer aid);
}
