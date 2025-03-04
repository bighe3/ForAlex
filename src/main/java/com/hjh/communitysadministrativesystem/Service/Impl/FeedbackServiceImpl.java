package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Service.FeedbackService;
import com.hjh.communitysadministrativesystem.dao.FeedbackDao;
import com.hjh.communitysadministrativesystem.Entity.Feedback;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackDao feedbackDao;

    @Override
    public List<Feedback> findallFeedback() {
        return feedbackDao.findallFeedback();
    }

    @Override
    public int insertFeedback(Feedback feedback) {
        return feedbackDao.insertFeedback(feedback);
    }

    @Override
    public int deleteFeedback(int id) {
        return feedbackDao.deleteFeedback(id);
    }

    @Override
    public int updateFeedback(Feedback feedback) {
        return feedbackDao.updateFeedback(feedback);
    }

    @Override
    public Feedback findFeedbackById(int id) {
        return feedbackDao.findFeedbackById(id);
    }

    @Override
    public List<Feedback> findFeedbackByUserId(int user_id) {
        return feedbackDao.findFeedbackByUserId(user_id);
    }
}
