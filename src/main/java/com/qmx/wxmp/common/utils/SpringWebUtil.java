package com.qmx.wxmp.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.qmx.wxmp.entity.order.Account;
  
public class SpringWebUtil {  

	public static final String FLAG_ACCOUNT_KEY = "account";
	
    public static HttpServletRequest getRequest(){  
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();  
        return requestAttributes==null? null : requestAttributes.getRequest();  
    }  
      
    public static HttpSession getSession(){  
        return getRequest().getSession(false);  
    }  
      
    public static String getRealRootPath(){  
        return getRequest().getServletContext().getRealPath("/");  
    }  
      
    public static String getIp() {  
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder  
                .getRequestAttributes();  
        if(servletRequestAttributes!=null){  
            HttpServletRequest request = servletRequestAttributes.getRequest();  
            return request.getRemoteAddr();  
        }  
        return null;  
    }  
      
    public static Object getSessionAttribute(String name){  
        HttpServletRequest request = getRequest();  
        return request == null?null:request.getSession().getAttribute(name);  
    }  
      
    public static void setSessionAttribute(String name,Object value){  
        HttpServletRequest request = getRequest();  
        if(request!=null){  
            request.getSession().setAttribute(name, value);   
        }  
    }  
      
    public static Object getRequestAttribute(String name){  
        HttpServletRequest request = getRequest();  
        return request == null?null:request.getAttribute(name);  
    }  
    public static void setRequestAttribute(String name,Object value){  
        HttpServletRequest request = getRequest();  
        if(request!=null){  
            request.setAttribute(name, value);    
        }  
    }  
  
    public static String getContextPath() {  
        return getRequest().getContextPath();  
    }  
  
    public static void removeSessionAttribute(String name) {  
        getRequest().getSession().removeAttribute(name);  
    }  
      
    public static void setAccount(Account account){
    	HttpServletRequest request = getRequest();  
        if(request!=null){  
            request.getSession().setAttribute(FLAG_ACCOUNT_KEY, account);   
        }
    }
    
    public static Account getAccount(){  
        HttpServletRequest request = getRequest();  
        return request == null?null:(Account)request.getSession().getAttribute(FLAG_ACCOUNT_KEY);  
    }
}  
