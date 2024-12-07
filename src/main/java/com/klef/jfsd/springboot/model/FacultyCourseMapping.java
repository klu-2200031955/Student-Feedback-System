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
    private String facultyId;

    @Column(name = "fullname", nullable = false)
    private String fullName;

    @Column(name = "ccode", nullable = false)
    private String cCode;

    @Column(name = "ctitle", nullable = false)
    private String cTitle;

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

    public String getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(String facultyId) {
        this.facultyId = facultyId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCCode() {
        return cCode;
    }

    public void setCCode(String cCode) {
        this.cCode = cCode;
    }

    public String getCTitle() {
        return cTitle;
    }

    public void setCTitle(String cTitle) {
        this.cTitle = cTitle;
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
