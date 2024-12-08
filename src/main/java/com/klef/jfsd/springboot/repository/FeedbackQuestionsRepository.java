package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.FeedbackQuestions;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackQuestionsRepository extends JpaRepository<FeedbackQuestions, Long> {
}
