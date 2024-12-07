package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.FacultyRequest;

public interface FacultyService {
    
    public Faculty displayFacultyById(int fid);
    public String updateFacultyProfile(Faculty f);
    public String facultyrequest(FacultyRequest f); 
    public Faculty getFacultyById(int id);
    public Faculty updateFaculty(Faculty faculty);
    public Faculty findIdandPassword(Integer id,String password);

}
