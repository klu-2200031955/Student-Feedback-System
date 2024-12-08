package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FacultyCourseMapping;
import com.klef.jfsd.springboot.repository.FacultyCourseMappingRepository;

@Service
public class FacultyCourseMappingServiceImpl implements FacultyCourseMappingService{

	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;

	@Override
	public List<FacultyCourseMapping> viewAllFCM() {
		return facultyCourseMappingRepository.findAll();
	}

	@Override
	public String insertFCM(FacultyCourseMapping FCM) {
		try {
			 facultyCourseMappingRepository.save(FCM);
			 return "FCM inserted Successfully";
	    } catch (Exception e) {
	          return "Error occurred while mapping the course with faculty: " + e.getMessage();
	    }
	}

	@Override
	public String deleteFCM(int fid) {
		try {
			facultyCourseMappingRepository.deleteById(fid);
			return "Faculty Course Mapping with id "+fid+"is deleted";
		} catch (Exception e) {
			return "Error occurred while deleting the FCM using id: " + e.getMessage();
		}		
	}

	@Override
	public List<FacultyCourseMapping> getFacultyBycourseId(String cid) {
		return facultyCourseMappingRepository.getFacultyByCid(cid);
	}

}
