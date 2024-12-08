package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.StudentCourseMapping;
import com.klef.jfsd.springboot.repository.StudentCourseMappingRepository;

@Service
public class StudentCourseMappingServiceImpl implements StudentCourseMappingService{

	@Autowired
	private StudentCourseMappingRepository studentCourseMappingRepository;
	
	@Override
	public List<StudentCourseMapping> viewAllSCM() {
		return studentCourseMappingRepository.findAll();
	}

	@Override
	public String insertSCM(StudentCourseMapping SCM) {
		studentCourseMappingRepository.save(SCM);
		return "Mapping has been done successfully";
	}

}
