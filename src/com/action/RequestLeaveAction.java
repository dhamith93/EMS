package com.action;

import com.database.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionSupport;

public class RequestLeaveAction extends ActionSupport {
	private String empId;
	private Long managedBy;
	private String reason;
	private String type;
	private String dateFrom;
	private String dateTo;
	private String timeFrom;
	private String timeTo;
	
	private String status;
	
	public String execute() {
		Leave leave = new Leave();
		System.out.println(managedBy);
		leave.setEmpId(empId);
		leave.setManagedBy(managedBy);
		leave.setType(type);
		leave.setReason(reason);
		leave.setDateFrom(dateFrom);
		leave.setDateTo(dateTo);
		leave.setTimeFrom(timeFrom);
		leave.setTimeTo(timeTo);
		leave.setIsApproved(0);
		leave.setIsConfirmed(0);
		
		try {
			EmployeeManager.requestLeave(leave);
			status = "{\"status\": \"OK\"}";
		} catch (Exception ex) {
			status = "{\"status\": \"ERROR\"}";
		}
		
		return SUCCESS;
	}
	
	public String getReason() { return reason; }
	
	public void setReason(String reason) { this.reason = reason; }
	

	public String getType() { return type; }
	
	public void setType(String type) { this.type = type; }
	

	public String getDateFrom() { return dateFrom; }
		
	public void setDateFrom(String dateFrom) { this.dateFrom = dateFrom; }
	

	public String getDateTo() { return dateTo; }
	
	public void setDateTo(String dateTo) { this.dateTo = dateTo; }
	

	public String getTimeFrom() { return timeFrom; }
	
	public void setTimeFrom(String timeFrom) { this.timeFrom = timeFrom; }
	

	public String getTimeTo() { return timeTo; }
	
	public void setTimeTo(String timeTo) { this.timeTo = timeTo; }

	
	public String getEmpId() { return empId; }

	public void setEmpId(String empId) { this.empId = empId; }
	
	public Long getManagedBy() { return managedBy; }

	public void setManagedBy(Long managedBy) { this.managedBy = managedBy; }

	
	public String getStatus() { return status; }

	public void setStatus(String status) { this.status = status; }
}
