package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.FacultyReject;
import com.klef.jfsd.springboot.model.FacultyRequest;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentReject;
import com.klef.jfsd.springboot.model.StudentRequest;

public interface AdminService {
	
	public List<Course> viewAllCourses();
	public List<Faculty> viewAllFaculty();
	public List<Student> viewAllStudents();
	public List<FacultyRequest> viewAllFacultyRequests();
	public List<StudentRequest> viewAllStudentRequests();
	public List<FacultyReject> viewAllFacultyRejects();
	public List<StudentReject> viewAllStudentRejects();
	
	public long facultyCount();
	public long studentCount();
	public long coursesCount();
	
	public String addFaculty(Faculty f);
	public String addStudent(Student s);
	public String addCourse(Course c);
	
	public String acceptFaculty(int id);
    public String rejectFaculty(int id);
    public String deleteFaculty(int id);
    public String restoreFaculty(int id);
    public Faculty findFacultyById(int id);
    public FacultyReject findRFacultyById(int id);
    
    public String acceptStudent(int id);
    public String rejectStudent(int id);
    public String deleteStudent(int id);
    public String restoreStudent(int id);
    public Student findStudentById(int id);
    public StudentReject findRStudentReject(int id);
	
	public Admin findByIdAndPassword(Integer id,String password);
	
	public Admin updateAdmin(Admin admin);
    public Admin getAdminById(int id);
	
    public Course getCourseById(String id);
    public String updateCourse(Course c);
    

}
