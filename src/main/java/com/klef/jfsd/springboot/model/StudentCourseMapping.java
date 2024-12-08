package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="studentcoursemapping_table")
public class StudentCourseMapping {

	@Id
	private int smapid;
	
	@Column(name="cid",nullable = false)
	private String cid;
	
	@Column(name="facultyid",nullable = false)
	private int facultyid;
	
	@Column(name="fmapid",nullable = false)
	private int fmapid;
	
	@Column(name="studentid",nullable = false)
	private int studentid;
	
	@Column(name="fullname",nullable = false)
	private String fullname;

	public int getSmapid() {
		return smapid;
	}

	public void setSmapid(int smapid) {
		this.smapid = smapid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public int getFacultyid() {
		return facultyid;
	}

	public void setFacultyid(int facultyid) {
		this.facultyid = facultyid;
	}

	public int getFmapid() {
		return fmapid;
	}

	public void setFmapid(int fmapid) {
		this.fmapid = fmapid;
	}

	public int getStudentid() {
		return studentid;
	}

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	
}
