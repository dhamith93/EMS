package com.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "TASK_ASSIGNMENT")
public class TaskAssignment implements Serializable {
    private Long id;
    private String empId;
    private Long taskId;
    private double progress;
        
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
    @Column(name = "PROGRESS", nullable = true)
    public double getProgress() {
        return progress;
    }
    public void setProgress(double progress) {
        this.progress = progress;
    }   
    
}
