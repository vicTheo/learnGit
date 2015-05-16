package cn.itcast.primer;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

//public class HelloWorldAction implements Action {
@SuppressWarnings("serial")
public class HelloWorldAction extends ActionSupport {

	public String execute() throws Exception {
		System.out.println("HelloWorldAction ************* execute()");
		return "success";
	}

}
