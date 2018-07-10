package com.action;

import java.util.List;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.entity.*;
import com.database.*;

public class SearchAction extends ActionSupport implements LoginRequired {
    private String searchValue;
    private String searchOption;
    private String jsonString;

    public String execute() {
        Gson gson = new Gson();
        List<Employee> result = EmployeeManager.search(searchValue, searchOption);
        jsonString = gson.toJson(result);
        return SUCCESS;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public String getSearchOption() {
        return searchOption;
    }

    public void setSearchOption(String searchOption) {
        this.searchOption = searchOption;
    }

    public String getJsonString() {
        return jsonString;
    }

    public void setJsonString(String jsonString) {
        this.jsonString = jsonString;
    }

}
