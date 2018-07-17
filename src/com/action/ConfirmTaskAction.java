package com.action;

import com.database.TaskManager;
import com.entity.TaskAssessment;
import com.opensymphony.xwork2.ActionSupport;

public class ConfirmTaskAction extends  ActionSupport implements LoginRequired  {
    
	private String empId;
    private Long taskId;
    private double performance;
    private String notes;
    
    private String status;
    


	public String execute() {
    	TaskAssessment ta = new TaskAssessment();
    	ta.setEmpId(empId);
    	ta.setTaskId(taskId);
    	ta.setPerformance(performance);
    	ta.setNotes(notes);
    	
    	TaskManager.assess(ta);
    	TaskManager.markComplete(taskId);
    	
    	try {
        	TaskManager.assess(ta);
        	TaskManager.markComplete(taskId);
    		status = "{\"status\": \"OK\"}";
    	}
    	catch(Exception ex) {
    	    status = "{\"status\": \"ERROR\"}";
    	    ex.printStackTrace();
    	}
    	
    	return SUCCESS;
    }
    
    
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Long getTaskId() {
		return taskId;
	}
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}
	public double getPerformance() {
		return performance;
	}
	public void setPerformance(double performance) {
		this.performance = performance;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

    
}
