package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "TASK_ASSESSMENT")
public class TaskAssessment implements Serializable {
    private Long id;
    private String empId;
    private Long taskId;
    private double performance;
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
    @Column(name = "EMP_ID", nullable = true, length = 10)
    public String getEmpId() {
        return empId;
    }
    public void setEmpId(String empId) {
        this.empId = empId;
    }
    
    @Basic
    @Column(name = "TASK_ID", nullable = true)
    public Long getTaskId() {
        return taskId;
    }
    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }
    
    @Basic
    @Column(name = "PERFORMANCE", nullable = true)
    public double getPerformance() {
        return performance;
    }
    public void setPerformance(double performance) {
        this.performance = performance;
    }
    
    @Basic
    @Column(name = "NOTES", nullable = true)
    public String getNotes() {
        return notes;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }
    
}
