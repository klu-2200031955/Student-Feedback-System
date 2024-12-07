package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentRequest;

public interface StudentService {

    public Student displayStudentById(int sid);
    public String updateStudentProfile(Student s);
    public String studentRequest(StudentRequest s); 
    public Student getStudentById(int id);
    public Student updateStudent(Student student);
    public Student findIdandPassword(Integer id,String password);
}
