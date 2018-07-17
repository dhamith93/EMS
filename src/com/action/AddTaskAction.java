package com.action;

import com.database.TaskManager;
import com.entity.Task;
import com.entity.TaskAssignment;
import com.opensymphony.xwork2.ActionSupport;

public class AddTaskAction extends  ActionSupport implements LoginRequired {
	private Long deptId;
	private String name;
    private String desc;
    private String startOn;
	private String endOn;
    private int isCompleted;
    private String empId;
    private Long taskId;

	private String status;
    
    
    public String execute() {
    	
    	Task task = new Task();
    	task.setDeptId(deptId);
    	task.setName(name);
    	task.setDesc(desc);
    	task.setStartOn(startOn);
    	task.setEndOn(endOn);
    	task.setIsCompleted(isCompleted);
    	
    	TaskAssignment ta = new TaskAssignment();
    	ta.setEmpId(empId);
    	//ta.setTaskId(taskId);
    	
    	try {
    		TaskManager.save(task, ta);
    		status = "{\"status\": \"OK\"}";
    	}
    	catch(Exception ex) {
    	    ex.printStackTrace();
    		System.out.println(ex);
    	}
    	
    	
    	
    	
    	return status;
    }
     
	public Long getDeptId() {
		return deptId;
	}
	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getStartOn() {
		return startOn;
	}
	public void setStartOn(String startOn) {
		this.startOn = startOn;
	}
	public String getEndOn() {
		return endOn;
	}
	public void setEndOn(String endOn) {
		this.endOn = endOn;
	}
	public int getIsCompleted() {
		return isCompleted;
	}
	public void setIsCompleted(int isCompleted) {
		this.isCompleted = isCompleted;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
