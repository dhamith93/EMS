package com.entity;

import java.io.Serializable;

import javax.persistence.* ;

@Entity
@Table(name="EMPLOYEE")
public class Employee implements Serializable {
	
	private Long id;
	private String firstName;
	private String lastName;
	private String dob;
	private String gender;
	private String NIC;
	
	private String empId;
	private double salary;
	private String joinedDate;
	private Long managedBy;	
	private Long dept;
	private String position;
	
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String telephoneNo;
	
	private String deptName; // transient property
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() { return id; }
	
	public void setId(Long id) { this.id = id; }
	
	@Basic
    @Column(name = "FIRST_NAME", nullable = true, length = 30)
	public String getFirstName() { return firstName; }
	
	public void setFirstName(String firstName) { this.firstName = firstName; }
	
	@Basic
    @Column(name = "LAST_NAME", nullable = true, length = 30)
	public String getLastName() { return lastName; }
	
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	@Basic
    @Column(name = "DOB", nullable = true)
	public String getDob() { return dob; }
	
	public void setDob(String dob) { this.dob = dob; }
	
	@Basic
    @Column(name = "GENDER", nullable = true, length = 6)
	public String getGender() { return gender; }
	
	public void setGender(String gender) { this.gender = gender; }
	
	@Basic
    @Column(name = "NIC", nullable = true, length = 13)
	public String getNIC() { return NIC; }

	public void setNIC(String NIC) { this.NIC = NIC; }
	
	
	@Basic
    @Column(name = "EMP_ID", nullable = true, length = 10)
	public String getEmpId() { return empId; }
	
	public void setEmpId(String empId) { this.empId = empId; }
	
	@Basic
    @Column(name = "SALARY", nullable = true)
	public double getSalary() { return salary; }

	public void setSalary(double salary) { this.salary = salary; }

	@Basic
    @Column(name = "JOINED_DATE", nullable = true)
	public String getJoinedDate() { return joinedDate; }

	public void setJoinedDate(String joinedDate) { this.joinedDate = joinedDate; }
	
	@Basic
    @Column(name = "MANAGED_BY", nullable = true)
	public Long getManagedBy() { return managedBy; }

	public void setManagedBy(Long managedBy) { this.managedBy = managedBy; }
	
	@Basic
    @Column(name = "DEPARTMENT", nullable = true)
	public Long getDept() { return dept; }

	public void setDept(Long dept) { this.dept = dept; }
	
	@Basic
    @Column(name = "POSITION", nullable = true, length = 10)
	public String getPosition() { return position; }

	public void setPosition(String position) { this.position = position; }
	
	
	@Basic
    @Column(name = "ADDRESS_LINE_1", nullable = true, length = 100)
	public String getAddressLine1() { return addressLine1; }

	public void setAddressLine1(String addressLine1) { this.addressLine1 = addressLine1; }

	@Basic
    @Column(name = "ADDRESS_LINE_2", nullable = true, length = 100)
	public String getAddressLine2() { return addressLine2; }

	public void setAddressLine2(String addressLine2) { this.addressLine2 = addressLine2; }

	@Basic
    @Column(name = "CITY", nullable = true, length = 50)
	public String getCity() { return city; }

	public void setCity(String city) { this.city = city; }

	@Basic
    @Column(name = "TELEPHONE_NO", nullable = true, length = 10)
	public String getTelephoneNo() { return telephoneNo; }

	public void setTelephoneNo(String telephoneNo) { this.telephoneNo = telephoneNo; }
	
	
	@Transient
	public String getDeptName() { return deptName; }

	public void setDeptName(String deptName) { this.deptName = deptName; }
	
}
