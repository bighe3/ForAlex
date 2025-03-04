package com.hjh.communitysadministrativesystem.dao;


import com.hjh.communitysadministrativesystem.Entity.adminUser;

import java.util.List;


public interface AdminDao {
    adminUser selectOne(String aaccount, String apassword);

    List<adminUser> selectList();

    List<adminUser> findAll();


    adminUser selectById(Integer aid);

    int updateAdmin(adminUser adminUser);

    int addAdmin(adminUser adminUser);

    int deleteById(Integer aid);
}
