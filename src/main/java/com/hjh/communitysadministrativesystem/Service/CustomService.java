package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.Custom;

import java.util.List;

public interface CustomService {

    public Custom selectOne(String aaccount, String apassword);

    public Custom select(String oaccount, String opassword);

    public List<Custom> selectAllCustom();

    public Custom selectOneById(Integer oid);

    public int updateCustom(Custom custom);

    public int addCustom(Custom custom);

    public int deleteById(Integer oid);

    public int selectLastOwner();

    public Custom findCustomById(int oid);

}
