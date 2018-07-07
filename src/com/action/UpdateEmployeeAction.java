package com.action;

import com.database.*;
import com.entity.*;
import org.mindrot.jbcrypt.BCrypt;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateEmployeeAction extends ActionSupport {
    private String firstName;
    private String lastName;
    private String dob;
    private String gender;
    private String NIC;

    private String empId;
    private String joinedDate;
    private Long dept;
    private String position;
    private double salary;
    private String password;
    private String password2;

    private String addressLine1;
    private String addressLine2;
    private String city;
    private String telephoneNo;

    private String status;
    
    public String execute() {
        Employee e = EmployeeManager.get(empId);
        Employee employee = new Employee();
        employee.setId(e.getId());
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setDob(dob);
        employee.setGender(gender);
        employee.setNIC(NIC);
        employee.setEmpId(empId);
        employee.setJoinedDate(joinedDate);
        employee.setDept(dept);
        employee.setManagedBy(DepartmentManager.getManager(dept));
        employee.setPosition(position);
        employee.setSalary(salary);
        employee.setAddressLine1(addressLine1);
        employee.setAddressLine2(addressLine2);
        employee.setTelephoneNo(telephoneNo);
        employee.setCity(city);
        try {
            EmployeeManager.update(employee);
            status = "{\"status\": \"OK\"}";
        } catch (Exception ex) {
            status = "{\"status\": \"ERROR\"}";
        }
        
        if (password != null && !password.equals("")) {
            if (password.equals(password2)) {
                password = BCrypt.hashpw(password, BCrypt.gensalt());
                Login login = new Login();
                login.setEmpId(empId);
                login.setPassword(password);
                try {
                    EmployeeManager.updateLoginInfo(login);
                    status = "{\"status\": \"OK\"}";
                } catch (Exception ex) {
                    status = "{\"status\": \"ERROR_PASSWORD\"}";
                }
            } else {
                status = "{\"status\": \"passwords-no-match\"}";
            }
        }
        
        return SUCCESS;
    }
    
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String nIC) {
        NIC = nIC;
    }

    public Long getDept() {
        return dept;
    }

    public void setDept(Long dept) {
        this.dept = dept;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTelephoneNo() {
        return telephoneNo;
    }

    public void setTelephoneNo(String telephoneNo) {
        this.telephoneNo = telephoneNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }


    public String getDob() {
        return dob;
    }


    public void setDob(String dob) {
        this.dob = dob;
    }


    public String getJoinedDate() {
        return joinedDate;
    }


    public void setJoinedDate(String joinedDate) {
        this.joinedDate = joinedDate;
    }    
}
