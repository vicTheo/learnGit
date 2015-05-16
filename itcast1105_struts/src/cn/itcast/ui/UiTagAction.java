package cn.itcast.ui;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UiTagAction extends ActionSupport {

	public String ui(){
		System.out.println("UiTagAction *********** ui()");
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<Person> list = new ArrayList<Person>();
		
		for(int i=0;i<10;i++){
			Person person = new Person(i, "tom"+i, 20+i);
			list.add(person);
		}
		
		request.setAttribute("persons", list);
		
		return "ui";
	}
	
}
