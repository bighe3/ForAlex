package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.Custom;

import java.util.List;

public interface CustomDao {

    public List<Custom> selectAllCustom();

    public Custom selectOneById(Integer oid);

    public int updateCustom(Custom custom);

    public int addCustom(Custom custom);

    public int deleteById(Integer oid);

    public Custom selectOne(String aaccount, String apassword);

    public Custom selectLastOwner();

    Custom selectOneById(int oid);

    // 搜索业主
    List<Custom> searchCustoms(String keyword);

}
