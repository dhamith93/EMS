package com.action;

import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import com.entity.*;
import com.database.*;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
    private String userName;
    private String password;
    private String loginOption;
    private Employee employee;
    private List<Leave> leaves;
    private LeavesLeft leavesLeft;
    private List<Department> departments;

    public String execute() {

        Login login;

        try {
            employee = EmployeeManager.get(userName);
            login = EmployeeManager.getLoginInfo(employee);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return ERROR;
        }

        if (login != null) {
            if (BCrypt.checkpw(password, login.getPassword())) {
                switch (loginOption) {
                case "hr":
                    if (employee.getDeptName().equals("HR")) {
                        departments = DepartmentManager.getAll();
                        return "HR";
                    }
                case "man":
                    Long deptManId = DepartmentManager.getManager(employee.getDept());
                    if (deptManId == employee.getId())
                        return "MAN";
                case "emp":
                    leaves = EmployeeManager.getLeaves(employee);
                    leavesLeft = EmployeeManager.getLeavesLeft(employee);
                    return "EMP";
                default:
                    return ERROR;
                }
            }
        }

        return ERROR;
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

}
