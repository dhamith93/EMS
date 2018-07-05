package com.database;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.entity.*;

public class TaskManager extends Manager {
        
    public static void save(Task t, TaskAssignment ta) {
        init();
        session.save(t);
        Long id = t.getId();
        transaction.commit();
        ta.setTaskId(id);
        session.save(ta);
        transaction.commit();        
    }
    
    public static List<Task> getTasks(Employee emp) {
        init();
        String hql = "FROM TaskAssignment t WHERE t.empId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());

        List<TaskAssignment> taskAssignments = query.getResultList();
        List<Task> tasks = new ArrayList();
        for (TaskAssignment taskAssignment : taskAssignments) {
            hql = "FROM Task t WHERE t.id = :id";
            query = session.createQuery(hql);
            query.setParameter("id", taskAssignment.getTaskId());
            tasks.add((Task) query.getSingleResult());
        }
        
        return tasks;
    }
    
    public static List<Task> getTasks(Department dept) {
        init();
        String hql = "FROM Task t WHERE t.deptId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", dept.getId());
        List<Task> tasks = query.getResultList();
        
        return tasks;
    }
    
    public static void setProgress(String taskId, double prog) {
        init();
        String hql = "UPDATE TaskAssignment t SET t.progress = :prog WHERE t.id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", Long.parseLong(taskId));
        query.setParameter("prog", prog);
        query.executeUpdate();
        transaction.commit();
    }
    
    public static void assess(TaskAssessment ta) {
        init();
        session.save(ta);
        transaction.commit();
    }
}
