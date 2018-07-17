package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.mindrot.jbcrypt.BCrypt;
import com.entity.*;
import com.database.*;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
    private String userName;
    private String password;
    private String loginOption;
    private Employee employee;
    private Department department;
    private List<Employee> employeeDept;
	private List<Leave> leaves;
    private LeavesLeft leavesLeft;
    private List<Department> departments;
    private List<Task> tasks;
    private List<TaskAssignment> taskAssignments;
    private Long approvedLeaveCount;
    private boolean isClockedIn;
    
    private Map session;

    public Map getSession() {
        return session;
    }
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;        
    }

    public String execute() {
        Login login;
        
        try {
            employee = EmployeeManager.get(userName);
            login = EmployeeManager.getLoginInfo(employee);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            addFieldError("error", "User '" + userName + "' does not exist!");
            return INPUT;
        }

        if (login != null) {
            if (BCrypt.checkpw(password, login.getPassword())) {
                
                session.put("empId", employee.getEmpId());
                
                switch (loginOption) {
                    case "hr":
                        if (employee.getDeptName().equals("HR")) {
                            departments = DepartmentManager.getAll();
                            return "HR";
                        }
                    case "man":
                        Long deptManId = DepartmentManager.getManager(employee.getDept());
                        department = DepartmentManager.get(employee.getDeptName());
                        employeeDept = EmployeeManager.getEmployeeDept(employee.getDept());
                        tasks = TaskManager.getTasks(department);
                        taskAssignments = TaskManager.getAssignments(employee);
                        departments = DepartmentManager.getAll();
                        if (deptManId == employee.getId())
                            return "MAN";
                    case "emp":
                        leaves = EmployeeManager.getLeaves(employee);
                        leavesLeft = EmployeeManager.getLeavesLeft(employee);
                        tasks = TaskManager.getTasks(employee);
                        taskAssignments = TaskManager.getAssignments(employee);
                        approvedLeaveCount = EmployeeManager.getApprovedLeaveCount(employee);
                        Attendance attendance = EmployeeManager.getLastAttendance(employee.getEmpId());
                        isClockedIn = (attendance != null && attendance.getIsClockedOut() == 0);
                        return "EMP";
                    default:                    
                        //return ERROR;
                }
            }
        }

        addFieldError("error", "You are not authorized to log in.");
        return INPUT;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLoginOption() {
        return loginOption;
    }

    public void setLoginOption(String loginOption) {
        this.loginOption = loginOption;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    public List<Leave> getLeaves() {
        return leaves;
    }

    public void setLeaves(List<Leave> leaves) {
        this.leaves = leaves;
    }
    
    public LeavesLeft getLeavesLeft() {
        return leavesLeft;
    }

    public void setLeavesLeft(LeavesLeft leavesLeft) {
        this.leavesLeft = leavesLeft;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public List<TaskAssignment> getTaskAssignments() {
        return taskAssignments;
    }

    public void setTaskAssignments(List<TaskAssignment> taskAssignments) {
        this.taskAssignments = taskAssignments;
    }

    public Long getApprovedLeaveCount() {
        return approvedLeaveCount;
    }

    public void setApprovedLeaveCount(Long approvedLeaveCount) {
        this.approvedLeaveCount = approvedLeaveCount;
    }

    public boolean getIsClockedIn() {
        return isClockedIn;
    }

    public void setIsClockedIn(boolean isClockedIn) {
        this.isClockedIn = isClockedIn;
    }
    
    public Department getDepartment() {
 		return department;
 	}

 	public void setDepartment(Department department) {
 		this.department = department;
 	}
	public List<Employee> getEmployeeDept() {
		return employeeDept;
	}

	public void setEmployeeDept(List<Employee> employeeDept) {
		this.employeeDept = employeeDept;
	}

}
