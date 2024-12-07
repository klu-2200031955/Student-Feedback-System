package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.FacultyRequest;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.FacultyRequestRepository;

@Service // Add this annotation to indicate that it's a service
public class FacultyServiceImpl implements FacultyService {

    @Autowired
    private FacultyRequestRepository facultyRequestRepository;

    @Autowired
    private FacultyRepository facultyRepository;


    @Override
    public Faculty displayFacultyById(int fid) {
        return facultyRepository.findById(fid).get();
    }


    @Override
	public String facultyrequest(FacultyRequest f) {
		facultyRequestRepository.save(f);
		return "faculty request inserted successful";
	}
    
    @Override
    public Faculty getFacultyById(int id) {
        return facultyRepository.findById(id).orElse(null);
    }

    @Override
    public Faculty updateFaculty(Faculty faculty) {
        return facultyRepository.save(faculty);
    }


    @Override
    public String updateFacultyProfile(Faculty f) {
        Faculty flt = facultyRepository.findById(f.getId())
                .orElseThrow(() -> new RuntimeException("Faculty not found")); // Add error handling

        flt.setAddress(f.getAddress());
        flt.setContact(f.getContact());
        flt.setDob(f.getDob());
        flt.setFathername(f.getFathername());
        flt.setLinkedin(f.getLinkedin());
        flt.setSalary(f.getSalary());
        flt.setDepartment(f.getDepartment());
        flt.setFacebook(f.getFacebook());
        flt.setGender(f.getGender());
        flt.setPassword(f.getPassword());

        facultyRepository.save(flt);
        return "Faculty Updated Successfully";
    }


	@Override
	public Faculty findIdandPassword(Integer id, String password) {
		return facultyRepository.findfacultybyIdandPassword(id, password);
	}
	
}
