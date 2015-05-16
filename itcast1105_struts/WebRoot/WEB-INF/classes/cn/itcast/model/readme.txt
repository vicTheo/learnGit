模型驱动：
	* 要从页面中获取表单元素的值，需要在动作类中声明与页面元素同名的属性。导致动作类中既有javabean又有业务方法。
	
	* 将javabean和业务方法进行分离：
		* 将重新创建一个javabean，将javabean的内容放置其中。
		* 动作类action中只留业务方法
	
	* 在动作类中声明的javabean无法从页面中获取同名的属性
	
	* 需要使用struts2框架提供"ModelDriven(模型驱动)"
		
		* 实现ModelDriven这个接口
		
		* 重写getModel()方法，返回该javabean的实例
		
		* 代码如下：
			public class UserAction extends ActionSupport implements ModelDriven<User> {

				private User user = new User();
				
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
			}
		
		* 模型驱动的原理：
			
			* 在不使用模型驱动的时候，之所以在动作类中获取不到对应的属性的原因：
				* 在ValueStack中没有对应javabean的所有属性
				
			* 模型驱动的作用，就是将javabean的实例压入对象栈的栈顶，从而可以获取到对应的属性的值


页面回显技术：
	* 通过模型驱动，在动作类action中，可以获取到页面中元素的值
	
	//方法一
	* 通过javabean实例的set()方法，将新的内容set到javabean中，从而放置在页面对应元素中
		user.setUsername(newUser.getUsername());
		user.setTel(newUser.getTel());
		user.setDes(newUser.getDes());
	
	//方法二
	* 首先将值栈中，旧的javabean的内容，删除掉
	* 然后将新的内容压入到值栈中的栈顶
		ValueStack valueStack = ServletActionContext.getContext().getValueStack();
		valueStack.pop();
		valueStack.push(newUser);


处理表单重复提交：
	
	* 在页面中增加一个隐藏域：<s:token></s:token>
	
	* 创建一个struts.xml的配置文件，具体配置如下：
		<!-- 配置默认执行的拦截器栈，增加令牌拦截器 -->
		<interceptors>
			<interceptor-stack name="tokenStack">
				<interceptor-ref name="defaultStack" />
				<interceptor-ref name="token" >
					<!-- 配置令牌拦截器，拦截的方法名，如果配置多个方法时，用","隔开 -->
					<param name="includeMethods">save,update</param>
				</interceptor-ref>
			</interceptor-stack>
		</interceptors>
		
		<default-interceptor-ref name="tokenStack" />
	
	* 在struts.xml配置文件中，增加一个result结果类型：
		<!-- 配置表单重复提交后，要转向到的页面 -->
		<result name="invalid.token">/model/error.jsp</result>
	
	* 在表单重复提交后，要转向到的页面中通过<s:actionerror>获取struts2框架底层提供错误提示信息
	
	* 将struts2框架底层提供错误提示信息改成中文：
		
		* 在与动作类action同级目录下，创建名为"token.properties"的资源文件，文件内容如下：
			struts.messages.invalid.token=表单重复提交，请刷新后重试！

		