package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {
	
	@Query("select a from Student a where a.id=?1 and a.password=?2")
    public Student checkstudentlogin(Integer id,String pwd);
	
	

}
