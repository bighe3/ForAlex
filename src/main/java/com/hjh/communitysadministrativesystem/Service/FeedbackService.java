package com.hjh.communitysadministrativesystem.Service;


import com.hjh.communitysadministrativesystem.Entity.Feedback;

import java.util.List;

public interface FeedbackService {
    List<Feedback> findallFeedback();

    int insertFeedback(Feedback feedback);

    int deleteFeedback(int id);

    int updateFeedback(Feedback feedback);

    Feedback findFeedbackById(int id);

    List<Feedback> findFeedbackByUserId(int user_id);
}
