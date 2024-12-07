package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.FacultyReject;
import com.klef.jfsd.springboot.model.FacultyRequest;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentReject;
import com.klef.jfsd.springboot.model.StudentRequest;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.FacultyRejectRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.FacultyRequestRepository;
import com.klef.jfsd.springboot.repository.StudentRejectRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.StudentRequestRepository;

@Service
public class AdminServiceImpl implements AdminService {
    
    @Autowired
    private AdminRepository adminRepository;
    
    @Autowired
    private StudentRepository studentRepository;
    
    @Autowired
    private StudentRequestRepository studentRequestRepository;
    
    @Autowired
    private StudentRejectRepository studentRejectRepository;
    
    @Autowired
    private CourseRepository courseRepository;
    
    @Autowired
    private FacultyRequestRepository facultyRequestRepository;
    
    @Autowired
    private FacultyRejectRepository facultyRejectRepository;
    
    @Autowired
    private FacultyRepository facultyRepository;

    @Override
    public List<Course> viewAllCourses() {
        return courseRepository.findAll();
    }

    @Override
    public List<Faculty> viewAllFaculty() {
        return facultyRepository.findAll();
    }
    
    @Override
    public List<FacultyRequest> viewAllFacultyRequests() {
    	return facultyRequestRepository.findAll();
    }
    
    @Override
    public List<StudentRequest> viewAllStudentRequests() {
    	return studentRequestRepository.findAll();
    }
    
    @Override
    public List<FacultyReject> viewAllFacultyRejects() {
    	return facultyRejectRepository.findAll();
    }
    
    @Override
    public List<StudentReject> viewAllStudentRejects() {
    	return studentRejectRepository.findAll();
    }

    @Override
    public List<Student> viewAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public long facultyCount() {
        return facultyRepository.count();
    }

    @Override
    public long studentCount() {
        return studentRepository.count();
    }

    @Override
    public long coursesCount() {
        return courseRepository.count();
    }

    @Override
    public String addFaculty(Faculty faculty) {
        try {
            facultyRepository.save(faculty);
            return "Faculty added successfully";
        } catch (Exception e) {
            return "Error occurred while adding faculty: " + e.getMessage();
        }
    }

    @Override
    public String addStudent(Student student) {
        try {
            studentRepository.save(student);
            return "Student added successfully";
        } catch (Exception e) {
            return "Error occurred while adding student: " + e.getMessage();
        }
    }

    @Override
    public String addCourse(Course course) {
        try {
            courseRepository.save(course);
            return "Course added successfully";
        } catch (Exception e) {
            return "Error occurred while adding course: " + e.getMessage();
        }
    }
    
    
    @Override
    public String rejectFaculty(int value) {
    	int id = (int)(value);
        FacultyRequest request = facultyRequestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Request not found"));

        FacultyReject f = new FacultyReject();
        f.setId(id);
        f.setName(request.getName());
        f.setDob(request.getDob());
        f.setGender(request.getGender());
        f.setFathername(request.getFathername());
        f.setContact(request.getContact());
        f.setDepartment(request.getDepartment());
        f.setSalary(request.getSalary());
        f.setAddress(request.getAddress());
        f.setEmail(request.getEmail());
        f.setLinkedin(request.getLinkedin());
        f.setFacebook(request.getFacebook());
        f.setPassword(request.getPassword());

        facultyRejectRepository.save(f);
        facultyRequestRepository.delete(request);
        return "Faculty rejected";
    }
	
	@Override
	public String acceptFaculty(int value) {
		int id = (int)(value);
	    // Fetch the faculty request by ID
	    FacultyRequest request = facultyRequestRepository.findById(id)
	            .orElseThrow(() -> new RuntimeException("Request not found"));

	    Faculty f = new Faculty();
	    f.setId(id);
	    f.setName(request.getName());
	    f.setDob(request.getDob());
	    f.setGender(request.getGender());
	    f.setFathername(request.getFathername());
	    f.setContact(request.getContact());
	    f.setDepartment(request.getDepartment());
	    f.setSalary(request.getSalary());
	    f.setAddress(request.getAddress());
	    f.setEmail(request.getEmail());
	    f.setLinkedin(request.getLinkedin());
	    f.setFacebook(request.getFacebook());
	    f.setPassword(request.getPassword());

	    facultyRepository.save(f);
	    facultyRequestRepository.delete(request);
	    return "Faculty accepted and moved to the Faculty table.";
	}


	@Override
	public String deleteFaculty(int value) {
		int id = (int)(value);
	    Faculty request = facultyRepository.findById(id)
	            .orElseThrow(() -> new RuntimeException("Request not found"));
	
	    FacultyReject f = new FacultyReject();
        f.setId(id);
        f.setName(request.getName());
        f.setDob(request.getDob());
        f.setGender(request.getGender());
        f.setFathername(request.getFathername());
        f.setContact(request.getContact());
        f.setDepartment(request.getDepartment());
        f.setSalary(request.getSalary());
        f.setAddress(request.getAddress());
        f.setEmail(request.getEmail());
        f.setLinkedin(request.getLinkedin());
        f.setFacebook(request.getFacebook());
        f.setPassword(request.getPassword());

        facultyRejectRepository.save(f);
        facultyRepository.delete(request);
        return "Faculty deleted";
	}
	
	
	@Override
	public String restoreFaculty(int id) {
	    FacultyReject formerFaculty = facultyRejectRepository.findById(id)
	            .orElseThrow(() -> new RuntimeException("Former Faculty not found"));

	    Faculty restoredFaculty = new Faculty();
	    restoredFaculty.setId(formerFaculty.getId());
	    restoredFaculty.setName(formerFaculty.getName());
	    restoredFaculty.setDob(formerFaculty.getDob());
	    restoredFaculty.setGender(formerFaculty.getGender());
	    restoredFaculty.setFathername(formerFaculty.getFathername());
	    restoredFaculty.setContact(formerFaculty.getContact());
	    restoredFaculty.setDepartment(formerFaculty.getDepartment());
	    restoredFaculty.setSalary(formerFaculty.getSalary());
	    restoredFaculty.setAddress(formerFaculty.getAddress());
	    restoredFaculty.setEmail(formerFaculty.getEmail());
	    restoredFaculty.setLinkedin(formerFaculty.getLinkedin());
	    restoredFaculty.setFacebook(formerFaculty.getFacebook());
	    restoredFaculty.setPassword(formerFaculty.getPassword());

	    facultyRepository.save(restoredFaculty);
	    facultyRejectRepository.delete(formerFaculty);

	    return "Faculty restored successfully.";
	}
    
    @Override
    public Admin findByIdAndPassword(Integer id, String password) {
        return adminRepository.findByIdAndPassword(id, password);
    }

    @Override
    public String acceptStudent(int value) {
        int id = value;
        StudentRequest request = studentRequestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Request not found"));

        Student student = new Student();
        student.setId(id);
        student.setName(request.getName());
        student.setDob(request.getDob());
        student.setGender(request.getGender());
        student.setFathername(request.getFathername());
        student.setContact(request.getContact());
        student.setDepartment(request.getDepartment());
        student.setFee(request.getFee());
        student.setAddress(request.getAddress());
        student.setEmail(request.getEmail());
        student.setLinkedin(request.getLinkedin());
        student.setFacebook(request.getFacebook());
        student.setPassword(request.getPassword());

        studentRepository.save(student);
        studentRequestRepository.delete(request);
        return "Student accepted and moved to the Student table.";
    }

    @Override
    public String rejectStudent(int value) {
        int id = value;
        StudentRequest request = studentRequestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Request not found"));

        StudentReject studentReject = new StudentReject();
        studentReject.setId(id);
        studentReject.setName(request.getName());
        studentReject.setDob(request.getDob());
        studentReject.setGender(request.getGender());
        studentReject.setFathername(request.getFathername());
        studentReject.setContact(request.getContact());
        studentReject.setDepartment(request.getDepartment());
        studentReject.setFee(request.getFee());
        studentReject.setAddress(request.getAddress());
        studentReject.setEmail(request.getEmail());
        studentReject.setLinkedin(request.getLinkedin());
        studentReject.setFacebook(request.getFacebook());
        studentReject.setPassword(request.getPassword());

        studentRejectRepository.save(studentReject);
        studentRequestRepository.delete(request);
        return "Student rejected.";
    }

    @Override
    public String deleteStudent(int value) {
        int id = value;
        Student student = studentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Student not found"));

        StudentReject studentReject = new StudentReject();
        studentReject.setId(id);
        studentReject.setName(student.getName());
        studentReject.setDob(student.getDob());
        studentReject.setGender(student.getGender());
        studentReject.setFathername(student.getFathername());
        studentReject.setContact(student.getContact());
        studentReject.setDepartment(student.getDepartment());
        studentReject.setFee(student.getFee());
        studentReject.setAddress(student.getAddress());
        studentReject.setEmail(student.getEmail());
        studentReject.setLinkedin(student.getLinkedin());
        studentReject.setFacebook(student.getFacebook());
        studentReject.setPassword(student.getPassword());

        studentRejectRepository.save(studentReject);
        studentRepository.delete(student);
        return "Student deleted.";
    }

    @Override
    public String restoreStudent(int value) {
        int id = value;
        StudentReject formerStudent = studentRejectRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Rejected student not found"));

        Student restoredStudent = new Student();
        restoredStudent.setId(formerStudent.getId());
        restoredStudent.setName(formerStudent.getName());
        restoredStudent.setDob(formerStudent.getDob());
        restoredStudent.setGender(formerStudent.getGender());
        restoredStudent.setFathername(formerStudent.getFathername());
        restoredStudent.setContact(formerStudent.getContact());
        restoredStudent.setDepartment(formerStudent.getDepartment());
        restoredStudent.setFee(formerStudent.getFee());
        restoredStudent.setAddress(formerStudent.getAddress());
        restoredStudent.setEmail(formerStudent.getEmail());
        restoredStudent.setLinkedin(formerStudent.getLinkedin());
        restoredStudent.setFacebook(formerStudent.getFacebook());
        restoredStudent.setPassword(formerStudent.getPassword());

        studentRepository.save(restoredStudent);
        studentRejectRepository.delete(formerStudent);
        return "Student restored successfully.";
    }
    
    
    public Admin updateAdmin(Admin admin) {
        return adminRepository.save(admin);
    }

    public Admin getAdminById(int id) {
        Optional<Admin> optionalAdmin = adminRepository.findById(id);
        return optionalAdmin.orElse(null);
    }

	@Override
	public Faculty findFacultyById(int id) {
		return facultyRepository.findById(id).get();
	}

	@Override
	public FacultyReject findRFacultyById(int id) {
		return facultyRejectRepository.findById(id).get();
	}

	@Override
	public Student findStudentById(int id) {
		return studentRepository.findById(id).get();
	}

	@Override
	public StudentReject findRStudentReject(int id) {
		return studentRejectRepository.findById(id).get();
	}

	@Override
	public Course getCourseById(String id) {
		return courseRepository.findById(id).get();
	}

	@Override
	public String updateCourse(Course c) {
		Course course = courseRepository.findById(c.getId()).get();
		course.setName(c.getName());
		course.setCredits(c.getCredits());
		course.setYear(c.getYear());
		course.setDepartment(c.getDepartment());
		courseRepository.save(course);
		return "Course Updated Successfully";
	}


   


}
