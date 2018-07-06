package com.action;

import com.database.*;
import com.opensymphony.xwork2.ActionSupport;

public class SetTaskProgressAction extends ActionSupport {
    private String taskId;
    private double progress;
    private String jsonString;
    
    public String execute() {
        try {
            TaskManager.setProgress(taskId, progress);
            jsonString = "{\"status\": \"OK\"}";
        } catch (Exception ex) {            
            jsonString = "{\"status\": \"ERROR\"}";
        }
        return SUCCESS;
    }
    
    public String getTaskId() {
        return taskId;
    }
    
    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }
    
    public double getProgress() {
        return progress;
    }
    
    public void setProgress(double progress) {
        this.progress = progress;
    }
    
    public String getJsonString() {
        return jsonString;
    }

    public void setJsonString(String jsonString) {
        this.jsonString = jsonString;
    }
}
