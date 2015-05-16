package cn.itcast.ognl;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

@SuppressWarnings("serial")
public class OgnlAction extends ActionSupport {
	
	private String name = "oname";
	
	private String sex = "male";
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String test(){
		System.out.println("OgnlAction ************ test()");
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("username", "username_request");
		request.setAttribute("password", "password_request");
		
		Map sessionMap = ServletActionContext.getContext().getSession();
		sessionMap.put("username", "username_session");
		sessionMap.put("password", "password_session");
		
		ServletContext sc = ServletActionContext.getServletContext();
		sc.setAttribute("username", "username_application");
		sc.setAttribute("password", "password_application");
		
		//方法一：获取ValueStack对象
		ValueStack valueStack1 = (ValueStack)request.getAttribute("struts.valueStack");
		System.out.println("valueStack = "+valueStack1);
		
		/*
		 * 插入的内容，实际上是先放置在一个map集合中，又把这个map集合放置在对象栈里
		 */
		valueStack1.set("error", "error_valueStack");
		valueStack1.set("msg", "msg_valueStack");
		
//		valueStack1.getRoot().add(0, new Person());
		valueStack1.getRoot().add(0,new Employee());
		
		//方法二：获取ValueStack对象
		/*ValueStack valueStack2 = ServletActionContext.getContext().getValueStack();
		System.out.println("valueStack = "+valueStack2);*/
		
		
		return "ognl";
	}
	
}
