package com.database;

import java.util.List;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.entity.*;

public class EmployeeManager {
	private static Configuration config;
	private static SessionFactory sessionFactroy;
	private static Session session;
	private static Transaction transaction;
	
	private static void init() {
		config = new Configuration().configure();
		sessionFactroy = config.buildSessionFactory();
		session = sessionFactroy.getCurrentSession();
		transaction = session.beginTransaction();
	}
	
	private static void end() {
		session.close();
		sessionFactroy.close();
	}
	
	public static void save(Employee e) {
		init();
		session.save(e);
		transaction.commit();
	}
	
	public static void addLoginInfo(Employee e, String password) {
		init();
		Login login = new Login();
		
		login.setEmpId(e.getEmpId());
		login.setPassword(password);
		
		session.save(login);
		transaction.commit();
	}
	
	public static Login getLoginInfo(Employee e) {
		init();
		String hql = "FROM Login l WHERE l.empId LIKE :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", e.getEmpId());
		Login login = (Login) query.getResultList().get(0);
		
		return login;
	}
	
	public static Employee get(String empId) {
		init();
		String hql = "FROM Employee e WHERE e.empId LIKE :val";
		Query query = session.createQuery(hql);
		query.setParameter("val", empId);
		
		Employee employee = (Employee) query.getSingleResult();
		
		hql = "FROM Department d WHERE d.id = :id";
		query = session.createQuery(hql);
		query.setParameter("id", employee.getDept());
		Department department = (Department) query.getResultList().get(0);
		employee.setDeptName(department.getName());
		
		return employee;
	}
	
	public static List<Employee> search(String value, String option) {
		init();		
		String hql = "";
		
		switch(option) {
		case "id":
			hql = "FROM Employee e WHERE e.empId LIKE :val";
			break;
		case "name":
			hql = "FROM Employee e WHERE e.firstName LIKE concat(:val,'%') OR e.lastName LIKE concat(:val,'%') OR concat(e.firstName, ' ', e.lastName) LIKE concat(:val,'%')";
			break;
		case "dept":
			hql = "FROM Employee e WHERE e.dept = (SELECT id FROM Department WHERE name = :val)";
			break;
		default:
			hql = "FROM Employee e WHERE e.firstName LIKE :val OR e.lastName LIKE :val";
			break;
		}
		
		Query query = session.createQuery(hql);
		query.setParameter("val", value);
		
		List<Employee> results = query.getResultList();
		
		for (Employee e : results) {
			hql = "FROM Department d WHERE d.id = :id";
			query = session.createQuery(hql);
			query.setParameter("id", e.getDept());
			Department department = (Department) query.getResultList().get(0);
			e.setDeptName(department.getName());
		}
		
		end();
		
		return results;
	}	
	
	public static void requestLeave(Leave leave) {
		init();
		session.save(leave);
		transaction.commit();
	}
}
