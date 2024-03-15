/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Elisa Bothy
 * @param <T> L'entité lié au formulaire
 * 
 */
public abstract class FormChecker <T>{
    protected Map<String, String> errors;
    protected Map<String, String> messages;
    protected HttpServletRequest request;

    public FormChecker(HttpServletRequest request) {
        this.errors = new HashMap<>();
        this.messages = new HashMap<>();
        this.request = request;
    } 
    
    public abstract T checkForm();

    public Map<String, String> getErrors() {
        return errors;
    }
    
    protected void setError(String key, String value){
        this.errors.put(key, value);
    }
     protected String getParameter(String key) {
        return request.getParameter(key) == null ? "" : request.getParameter(key);
    }

    public Map<String, String> getMessages() {
        return messages;
    }

    public void setMessage(String key, String value) {
        this.messages.put(key, value);
    }
}
