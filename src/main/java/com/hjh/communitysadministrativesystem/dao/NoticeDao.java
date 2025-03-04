package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.notice;

import java.util.List;

public interface NoticeDao {

    List<notice> findAllNotice();

    notice selectById(Long id);

    int updateNotice(notice notice);

    int addNotice(notice notice);

    int deleteById(Long id);
}
