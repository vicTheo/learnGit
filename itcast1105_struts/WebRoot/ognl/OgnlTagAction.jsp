<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="description" content="This is my page">
  </head>
  <style type="text/css">
       .oddClass{
           background-color: red;}
       .evenClass{
           background-color:blue;}
  </style>
  <body>
	ognlTag.jsp<br>
	-------------------------------------------------------------------------------------------------------<br>
	property标签用于输出指定值：<br>
	<s:property value="#request.username"/><br>
	<s:property value="#request.username11" default="xxxxx"/><br>
	<s:property value="%{'<hr>hr的使用'}" escape="false"/><br>
	-------------------------------------------------------------------------------------------------------<br>
	set标签用于将某个值放入指定范围:<br>
	<s:set value="#request.username" var="xxx"/>
	<s:property value="#xxx"/><br>
	<s:set value="#session.username" var="xxx" scope="request"/>
	<s:property value="#request.xxx"/><br>
	<s:set value="#application.username" var="xxx" scope="page"/>
	<s:property value="#attr.xxx"/><br>
	-------------------------------------------------------------------------------------------------------<br>
	push:将对象放入栈顶,不能放入其他范围,当标签结束,会从栈顶删除。<br>
	<s:push value="#request.username">
		<s:property/><br><s:debug></s:debug>
	</s:push>
	
	-------------------------------------------------------------------------------------------------------<br>
	Action:通过指定命名空间和action名称,该标签允许在jsp页面直接调用Action <br>
	<s:action name="OgnlAction_test" namespace="/ognl" executeResult="fasle" />
	-------------------------------------------------------------------------------------------------------<br>
	Iterator:标签用于对集合进行迭代，这里的集合包含List、Set和数组。<br>
	<s:iterator value="#request.persons" var="person">
		<s:property value="#person"/><br>
	</s:iterator>
	<br><br>
	<s:iterator value="#request.persons" var="person">
		<s:property value="#person.id"/>~~<s:property value="#person.name" />~~<s:property value="#person.age" /><br>
	</s:iterator>
	<br><br>
	<s:iterator value="#request.persons" var="person" status="st">
		返回当前迭代了几个元素:<s:property value="#st.count"/><br>
		返回当前迭代元素的索引:<s:property value="#st.index"/><br>
		返回当前被迭代元素的索引是否是偶数:<s:property value="#st.even"/><br>
		返回当前被迭代元素的索引是否是奇数:<s:property value="#st.odd"/><br>
		返回当前被迭代元素是否是第一个元素:<s:property value="#st.first"/><br>
		返回当前被迭代元素是否是最后一个元素:<s:property value="#st.last"/><br>
	</s:iterator>
	<br><br>
	<table border="1">
		<s:iterator value="#request.persons" var="person" status="st">
			<tr class="<s:property value="#st.even?'evenClass':'oddClass'" />">
				<td><s:property value="#person.id" /></td>
				<td><s:property value="#person.name" /></td>
				<td><s:property value="#person.age" /></td>
			</tr><br>
		</s:iterator>
	</table><br><br>
	-------------------------------------------------------------------------------------------------------<br>
	if/elseif/else  基本的流程控制.‘If’标签可单独使用也可以和‘Else If’标签和(或)一个多个‘Else’一起使用 <br>
	<table border="1">
		<s:iterator value="#request.persons" var="person" status="st">
			<tr class="<s:property value="#st.even?'evenClass':'oddClass'" />">
				<td><s:property value="#person.id" /></td>
				<td><s:property value="#person.name" /></td>
				<td><s:property value="#person.age" /></td>
				<td><s:if test="#person.age<24">少年</s:if>
				<s:elseif test="#person.age<26">中年</s:elseif>
				<s:else>老年</s:else></td>
			</tr><br>
		</s:iterator>
	</table>
	-------------------------------------------------------------------------------------------------------<br>
	url:该标签用于创建url,可以通过"param"标签提供request参数. <br>
	<s:url action="OgnlAction_test" namespace="/ognl" var="myurl"></s:url>
	<a href="<s:property value='#myurl'/>">测试test</a><br>
	-------------------------------------------------------------------------------------------------------<br>
	使用ognl操作list和数组. <br>
	<s:iterator value="{1,2,3,4}" var="list">
		<s:property value="#list"/><br>
	</s:iterator>
	<br><br>
	<s:iterator value="{'s1','s2','s3','s4'}" var="list">
		<s:property value="#list"/><br>
	</s:iterator>
	ognl也可直接创建集合对象. <br>
	<s:iterator value="#request.persons" var="person">
		<s:property value="#person.name"/><br>
	</s:iterator>
	使用ognl操作map <br>
	<s:iterator value="#{'01':'java','02':'php','03':'.net','04':'c++'}" var="abcd">
		<s:property value="#abcd.key"/>~~<s:property value="#abcd.value"/><br>
	</s:iterator>
	-------------------------------------------------------------------------------------------------------<br>
	集合的投影(只输出部分属性) <br>
	<s:iterator value="#request.persons.{name}" var="person">
		<s:property value="#person"/><br>
	</s:iterator>
	集合的过滤<br>
	<s:iterator value="#request.persons.{?#this.age>24}" var="person">
		<s:property value="#person.age"/><br>
	</s:iterator>
	集合的投影和过滤<br>
	<s:iterator value="#request.persons.{?#this.age>24}.{name}" var="person">
		<s:property value="#person"/><br>
	</s:iterator>
  </body>
</html>
