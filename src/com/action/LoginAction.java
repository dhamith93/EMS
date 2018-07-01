package com.action;


import java.util.List;
import com.entity.*;
import com.database.*;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String userName;
	private String password;
	private String loginOption;
	private Employee employee;
	private List<Department> departments;
	
	
	public String execute() {
		
		try {
			employee = EmployeeManager.get(userName);
		} catch (Exception e) {
			return ERROR;
		}
		
		System.out.println(employee.getFirstName());
		
		switch (loginOption) {
			case "hr":
				departments = DepartmentManager.getAll();
				for (Department d : departments) {
					System.out.println(d.getName());
				}
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

	public List<Department> getDepartments() { return departments; }

	public void setDepartments(List<Department> departments) { this.departments = departments; }
	
}
