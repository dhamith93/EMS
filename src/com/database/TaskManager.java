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
        ta.setTaskId(id);
        session.save(ta);
        transaction.commit(); 
        session.close();
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
            tasks.add((Task) query.getResultList().get(0));
        }
        
        session.close();
        return tasks;
    }
    
    public static List<Task> getTasksForHR(Employee emp) {
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
            Task task = (Task) query.getSingleResult();
            if (task.getIsCompleted() != 0) {
                hql = "FROM TaskAssessment t WHERE t.taskId = :id";
                query = session.createQuery(hql);
                query.setParameter("id", task.getId());
                TaskAssessment taskAssessment = (TaskAssessment) query.getSingleResult();
                task.setPerformance(taskAssessment.getPerformance());
                task.setNotes(taskAssessment.getNotes());
                tasks.add(task);
            }
        }
        
        session.close();
        return tasks;
    }
    
    public static List<Task> getTasks(Department dept) {
        init();
        String hql = "FROM Task t WHERE t.deptId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", dept.getId());
        List<Task> tasks = query.getResultList();
        for (Task task : tasks) {
            hql = "FROM TaskAssignment t WHERE t.taskId = :id";
            query = session.createQuery(hql);
            query.setParameter("id", task.getId());
            TaskAssignment taskAssignemnt = (TaskAssignment) query.getResultList().get(0);
            task.setPerformance(taskAssignemnt.getProgress());
            task.setEmpId(taskAssignemnt.getEmpId());
        }
        
        session.close();
        return tasks;
    }
    
    public static Long getFinishedTaskCount(Department dept) {
        init();
        String hql = "SELECT COUNT(*) FROM Task t, TaskAssignment ta WHERE t.deptId = :id AND t.isCompleted = 0 AND ta.taskId = t.id AND ta.progress >= 100";
        Query query = session.createQuery(hql);
        query.setParameter("id", dept.getId());
        Long count = (Long) query.uniqueResult();
        session.close();
        return count;
    }
    
    public static void setProgress(String taskId, double prog) {
        init();
        String hql = "UPDATE TaskAssignment t SET t.progress = :prog WHERE t.taskId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", Long.parseLong(taskId));
        query.setParameter("prog", prog);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
    public static void markComplete(Long taskId) {
        init();
        String hql = "UPDATE Task t SET t.isCompleted = 1 WHERE t.id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", taskId);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
    public static List<TaskAssignment> getAssignments(Employee emp) {
        init();
        String hql = "FROM TaskAssignment t WHERE t.empId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());

        List<TaskAssignment> taskAssignments = query.getResultList();
        
        session.close();
        return taskAssignments;
    }
    
    public static List<TaskAssessment> getAssessments(Employee emp) {
        init();
        String hql = "FROM TaskAssessment t WHERE t.empId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", emp.getEmpId());

        List<TaskAssessment> taskAssignments = query.getResultList();
        
        session.close();
        return taskAssignments;
    }
    
    public static void assess(TaskAssessment ta) {
        init();
        session.save(ta);
        transaction.commit();
        session.close();
    }
}
