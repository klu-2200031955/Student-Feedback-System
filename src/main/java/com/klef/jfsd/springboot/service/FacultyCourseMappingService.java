package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.FacultyCourseMapping;

public interface FacultyCourseMappingService {
	public List<FacultyCourseMapping> viewAllFCM();
	public String insertFCM(FacultyCourseMapping FCM);
	public String deleteFCM(int fid);
	public List<FacultyCourseMapping> getFacultyBycourseId(String cid);
}
