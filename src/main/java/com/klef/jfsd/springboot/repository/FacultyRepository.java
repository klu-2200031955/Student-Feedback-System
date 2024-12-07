package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Faculty;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer> {
	
	@Query("select a from Faculty a where a.id=?1 and a.password=?2")
    public Faculty findfacultybyIdandPassword(Integer id,String pwd);

}
