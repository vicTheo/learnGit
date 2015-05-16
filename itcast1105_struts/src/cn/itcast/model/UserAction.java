package cn.itcast.model;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private User user = new User();
	
	/*public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}*/
	
	public User getModel() {
		return user;
	}

	public String add(){
		System.out.println("UserAction ************* add()");
		return "add";
	}
	
	public String save(){
		System.out.println("UserAction ************* save()");
		
		return "success";
	}
	
	public String edit(){
		System.out.println("UserAction ************* edit()");
		
		//模拟数据库查询
		User newUser = new User();
		newUser.setUsername("zhang");
		newUser.setTel("13888888888");
		newUser.setDes("xxx");
		
		
		//页面回显技术
		//方法一
//		user.setUsername(newUser.getUsername());
//		user.setTel(newUser.getTel());
//		user.setDes(newUser.getDes());
		
		//方法二
		ValueStack valueStack = ServletActionContext.getContext().getValueStack();
		valueStack.pop();
		valueStack.push(newUser);
		
		return "edit";
	}
	
	public String update(){
		System.out.println("UserAction ************* update()");
		return "success";
	}
	
}
