package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentRequest;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.StudentRequestRepository;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRequestRepository studentRequestRepository;

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public Student displayStudentById(int sid) {
        return studentRepository.findById(sid).get();
    }

    @Override
    public String studentRequest(StudentRequest s) {
        studentRequestRepository.save(s);
        return "Student request inserted successfully";
    }

    @Override
    public Student getStudentById(int id) {
        return studentRepository.findById(id).orElse(null);
    }

    @Override
    public Student updateStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public String updateStudentProfile(Student s) {
        Student std = studentRepository.findById(s.getId())
                .orElseThrow(() -> new RuntimeException("Student not found")); // Add error handling

        std.setAddress(s.getAddress());
        std.setContact(s.getContact());
        std.setDob(s.getDob());
        std.setFathername(s.getFathername());
        std.setLinkedin(s.getLinkedin());
        std.setDepartment(s.getDepartment());
        std.setFacebook(s.getFacebook());
        std.setGender(s.getGender());
        std.setPassword(s.getPassword());

        studentRepository.save(std);
        return "Student Updated Successfully";
    }

	@Override
	public Student findIdandPassword(Integer id, String password) {
		return studentRepository.checkstudentlogin(id, password);
	}
}
