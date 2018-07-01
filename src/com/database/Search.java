package com.database;

import java.util.List;
import com.entity.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class Search {
	
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
}
