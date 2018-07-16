package com.action;

import com.opensymphony.xwork2.ActionSupport;
import org.mindrot.jbcrypt.BCrypt;
import com.entity.*;
import com.database.*;

public class AddEmployeeAction extends ActionSupport implements LoginRequired {
    private String firstName;
    private String lastName;
    private String dob;
    private String gender;
    private String NIC;

    private String empId;
    private Long dept;
    private String position;
    private double salary;
    private String joinedDate;
    private String password;
    private String password2;

    private String addressLine1;
    private String addressLine2;
    private String city;
    private String telephoneNo;

    private String status;

    public String execute() {
        if (!emptyFields()) {
            if (EmployeeManager.employeeExists(empId)) {
                status = "{\"status\": \"duplicate-emp-id\"}";
            } else {                
                Employee e = new Employee();
                e.setFirstName(firstName);
                e.setLastName(lastName);
                e.setAddressLine1(addressLine1);
                e.setAddressLine2(addressLine2);
                e.setCity(city);
                e.setTelephoneNo(telephoneNo);
                e.setDept(dept);
                e.setDob(dob);
                e.setEmpId(empId);
                e.setGender(gender);
                e.setJoinedDate(joinedDate);
                e.setManagedBy(DepartmentManager.getManager(dept));
                e.setNIC(NIC);
                e.setPosition(position);
                e.setSalary(salary);
                
                if (password.equals(password2)) {
                    try {
                        EmployeeManager.save(e);
                        password = BCrypt.hashpw(password, BCrypt.gensalt());
                        EmployeeManager.addLoginInfo(e, password);
                        status = "{\"status\": \"OK\"}";
                    } catch (Exception ex) {
                        status = "{\"status\": \"ERROR\"}";
                    }
                } else {
                    status = "{\"status\": \"passwords-no-match\"}";
                }
            }
        } else {
            status = "{\"status\": \"empty-fields\"}";            
        }
        
        return SUCCESS;
    }
    
    private boolean emptyFields() {
        return (
            firstName.isEmpty() || lastName.isEmpty() || dob.isEmpty() || gender.isEmpty() ||
            NIC.isEmpty() || empId.isEmpty() || position.isEmpty() || dept == null ||
            joinedDate.isEmpty() || password.isEmpty() || password2.isEmpty() ||
            addressLine1.isEmpty() || city.isEmpty() || telephoneNo.isEmpty()
        );
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
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

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
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

    public String getJoinedDate() {
        return joinedDate;
    }

    public void setJoinedDate(String joinedDate) {
        this.joinedDate = joinedDate;
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

}
