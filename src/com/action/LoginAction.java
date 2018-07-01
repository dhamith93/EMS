package com.action;

import com.entity.*;
import com.database.*;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String userName;
	private String password;
	private String loginOption;
	private Employee employee;
	
	
	public String execute() {
		System.out.println(userName);
		System.out.println(password);
		
		try {
			employee = EmployeeManager.get(userName);			
		} catch (Exception e) {
			return ERROR;
		}
		
		System.out.println(employee.getFirstName());
		
		switch (loginOption) {
			case "hr":
				return "HR";
			case "man":
				return "MAN";
			case "emp":
				return "EMP";
		}
		
		return ERROR;
	}

	public String getUserName() { return userName; }

	public void setUserName(String userName) { this.userName = userName; }

	public String getPassword() { return password; }

	public void setPassword(String password) { this.password = password; }
	
	public String getLoginOption() { return loginOption; }

	public void setLoginOption(String loginOption) { this.loginOption = loginOption; }

	public Employee getEmployee() { return employee; }

	public void setEmployee(Employee employee) { this.employee = employee; }
	
	
	
}
