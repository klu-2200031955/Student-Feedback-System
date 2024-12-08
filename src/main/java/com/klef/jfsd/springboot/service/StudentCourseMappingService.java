package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.StudentCourseMapping;

public interface StudentCourseMappingService {
	public List<StudentCourseMapping> viewAllSCM();
	public String insertSCM(StudentCourseMapping SCM);
}
