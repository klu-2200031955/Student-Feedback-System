package com.klef.jfsd.springboot.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.FacultyCourseMapping;

@Repository
public interface FacultyCourseMappingRepository extends JpaRepository<FacultyCourseMapping,Integer>{

	@Query("select a from FacultyCourseMapping a where a.cid =?1")
	public List<FacultyCourseMapping> getFacultyByCid(String cid);
}
