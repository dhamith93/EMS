package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "TASKS")
public class Task implements Serializable {
    private Long id;
    private Long deptId;
    private String name;
    private String desc;
    private String startOn;
    private String endOn;
    private int isCompleted;
    
    private double performance; // transient property
    private String notes;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Basic
    @Column(name = "DEPT_ID", nullable = true)
    public Long getDeptId() {
        return deptId;
    }
    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }
    
    @Basic
    @Column(name = "NAME", nullable = true, length = 25)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    @Basic
    @Column(name = "DESCRIPTION", nullable = true)
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    @Basic
    @Column(name = "START_ON", nullable = true)
    public String getStartOn() {
        return startOn;
    }
    public void setStartOn(String startOn) {
        this.startOn = startOn;
    }
    
    @Basic
    @Column(name = "END_ON", nullable = true)
    public String getEndOn() {
        return endOn;
    }
    public void setEndOn(String endOn) {
        this.endOn = endOn;
    }
    
    @Basic
    @Column(name = "IS_COMPLETED", nullable = true)
    public int getIsCompleted() {
        return isCompleted;
    }
    public void setIsCompleted(int isCompleted) {
        this.isCompleted = isCompleted;
    }

    @Transient
    public double getPerformance() {
        return performance;
    }
    public void setPerformance(double performance) {
        this.performance = performance;
    }

    @Transient
    public String getNotes() {
        return notes;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }
}
