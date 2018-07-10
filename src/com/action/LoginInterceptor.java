package com.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.*;

public class LoginInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        String empId = (String) session.get("empId");
        
        if (empId != null) {
            return invocation.invoke();
        }
        
        Object action = invocation.getAction();
        
        if (!(action instanceof LoginRequired)) {
            return invocation.invoke();
        }
        
        if (!(action instanceof LoginAction)) {
            return "loginRedirect";
        }
        
        return invocation.invoke();
    }

}
