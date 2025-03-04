package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Entity.notice;
import com.hjh.communitysadministrativesystem.Service.NoticeService;
import com.hjh.communitysadministrativesystem.dao.NoticeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<notice> findAllNotice() {
        return noticeDao.findAllNotice();
    }

    @Override
    public notice selectById(Long id) {
        return noticeDao.selectById(id);
    }

    @Override
    public int updateNotice(notice notice) {
        int i = noticeDao.updateNotice(notice);
        return i;
    }

    @Override
    public int addNotice(notice notice) {
        int i = noticeDao.addNotice(notice);
        return i;
    }

    @Override
    public int deleteById(Long id) {
        int i = noticeDao.deleteById(id);
        return i;
    }


}
