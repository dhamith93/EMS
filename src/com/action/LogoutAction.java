package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware {
    private Map session;

    public Map getSession() {
        return session;
    }
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;        
    }
    
    public String execute() {
        session.remove("empId");
        return SUCCESS;
    }
}
