package com.klef.jfsd.springboot.model;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student {
	
    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    
    @Column(name = "gender", nullable = false, length = 10)
    private String gender;
    
    @Column(name = "dob", nullable = false, length = 10)
    private String dob;
    
    @Column(name = "contact", nullable = false, length = 20, unique = true)
    private String contact;
    
    @Column(name = "fathername", nullable = false, length = 50)
    private String fathername;
    
    @Column(name = "email", nullable = false, length = 50, unique = true)
    private String email;
    
    @Column(name = "department", nullable = false, length = 50)
    private String department;
    
    @Column(name = "fee", nullable = false, precision = 10, scale = 2)
    private BigDecimal fee;
    
    @Column(name = "address", nullable = false, length = 80)
    private String address;
    
    @Column(name = "linkedin", nullable = false, length = 200)
    private String linkedin;
    
    @Column(name = "facebook", nullable = false, length = 200)
    private String facebook;
    
    @Column(name = "password", nullable = false, length = 50)
    private String password;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getDob() {
        return dob;
    }
    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getFathername() {
        return fathername;
    }
    public void setFathername(String fathername) {
        this.fathername = fathername;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getFacebook() {
        return facebook;
    }
    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public BigDecimal getFee() {
        return fee;
    }
    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }
    public String getLinkedin() {
        return linkedin;
    }
    public void setLinkedin(String linkedin) {
        this.linkedin = linkedin;
    }
}
