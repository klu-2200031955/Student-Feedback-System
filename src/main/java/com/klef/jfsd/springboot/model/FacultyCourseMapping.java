package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "faculty_course_mapping")
public class FacultyCourseMapping {

    @Id
    @Column(name = "fmapid")
    private int fmapId;

    @Column(name = "facultyid", nullable = false)
    private int facultyId;

    @Column(name = "fullname", nullable = false)
    private String fullName;

    @Column(name = "cid", nullable = false)
    private String cid;

    @Column(name = "cname", nullable = false)
    private String cname;

    @ElementCollection
    @CollectionTable(name = "components", joinColumns = @JoinColumn(name = "fmapid"))
    @Column(name = "component")
    @Enumerated(EnumType.STRING)
    private List<Component> components;

    @Column(name = "section", nullable = false)
    private int section;

    public enum Component {
        L, T, P, S
    }

    public int getFmapId() {
        return fmapId;
    }

    public void setFmapId(int fmapId) {
        this.fmapId = fmapId;
    }

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public List<Component> getComponents() {
        return components;
    }

    public void setComponents(List<Component> components) {
        this.components = components;
    }

    public int getSection() {
        return section;
    }

    public void setSection(int section) {
        this.section = section;
    }
    
}
