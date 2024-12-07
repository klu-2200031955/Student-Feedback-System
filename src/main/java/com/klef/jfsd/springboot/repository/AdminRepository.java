package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Admin;

//import jakarta.transaction.Transactional;
//import java.util.List;


@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {
	
	public Admin findByIdAndPassword(int id, String password);
	
	
	
//	@Query("delete from Employee e where e.contact=?1")
//	@Modifying
//	@Transactional
//	public int deleteemployee(Integer id);
	
	

}
