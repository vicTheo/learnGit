<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="description" content="This is my page">
  </head>
  <body> 
     &lt;:ognl.jsp<br>
	使用EL表达式取值-----------------------------------------<br>
	${requestScope.username}<br>
	${sessionScope.username}<br>
	${applicationScope.username}<br><br><br><br>
	使用Ognl表达式取值-----------------------------------------<br>
	1 # 如果访问其他Context中的对象，由于他们不是根对象，所以在访问时，需要添加#前缀。<br>
	<s:property value="#request.username"/><br>
	<s:property value="#session.username"/><br>
	<s:property value="#application.username"/><br><br>
	<s:property value="#request['username']"/><br>
	<s:property value="#parameters.cid[0]"/><br>
	<s:property value="#attr.username"/><br><br>
	2 # 如果要访问根对象（即ValueStack）中对象的属性，则可以省略#命名对象，直接访问该对象的属性即可。<br>
	<s:property value="msg"/><br><br>
	深入理解值栈中的 ObjectStack<br>
	<s:property value="name"/><br>
	<s:property value="sex"/><br>
	<s:property value="age"/><br>
	<s:property value="salary"/><br><br>
	
	
	用法3:构造Map<br>
	<s:radio list="#{'01':'男','02':'女'}"></s:radio><br><br><br><br>
	%的用法：“%”符号的用途是在标签的属性值被理解为字符串类型时，告诉执行环境%{}里的是OGNL表达式。 <br>
	<s:property value="#request.username"/><br>
	<s:property value="%{#request.username}"/>%{}是万能用法，无论里面的表达式是不是ognl表达式，都会强制理解为ognl表达式<br><br>
	
	“$”有两个主要的用途<br>
    *  用于在国际化资源文件中，引用OGNL表达式<br>
	<s:text name="ognl" /><br><br>
    
    *  在Struts 2配置文件中，引用OGNL表达式<br>
    <s:property value="#parameters.msgxx[0]"/><br><br>

	<s:debug></s:debug>
  </body>
</html>
