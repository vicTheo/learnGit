<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page import="cn.itcast.ognl.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="description" content="page">
  </head>
  <body>
     <s:form action="abcdaction" namespace="/abcd" method="post" id="form1" name="form1">
     	<s:textfield label="用户名" value="zhangxx" id="username" name="username"></s:textfield>
     	<s:password label="密码" value="888888" id="psw" name="psw" showPassword="true"></s:password>
     	<s:hidden label="隐藏" id="hidden" name="hidden"></s:hidden>
     	<s:label for="gender" value="male" label="性别"></s:label>
     	<s:textarea value="xxxxx" cols="10" rows="10" label="描述"></s:textarea>
     	<!-- 
     		<input type="checkbox" name="java" value="01" id="form1_java"/>java
     	 -->
     	<s:checkbox name="java" label="java" fieldValue="01"></s:checkbox>
     	
     	<!-- checkboxlist标签构造map集合 -->
     	<!-- 
     		<input type="checkbox" name="list" value="01" id="list-1"/>java</label>
			<input type="checkbox" name="list" value="02" id="list-2"/>php</label>
			<input type="checkbox" name="list" value="03" id="list-3"/>.net</label>
			<input type="checkbox" name="list" value="04" id="list-4"/>oracle</label>
     		
     		listkey:对应生成HTML代码后的，value属性
     		listvalue:对应生成HTML代码后的，后半部分文本内容
     		
     	 -->
     	<s:checkboxlist list="#{'01':'java','02':'php','03':'.net','04':'oracle'}" 
     		listKey="key" listValue="value" name="map" value="{'01','02'}" />
     		
     	<!-- checkboxlist标签构造list集合 -->
     	<s:checkboxlist list="{'java','.net','php'}" name="list" value="{'java','php'}"></s:checkboxlist>
     	
     	<!-- checkboxlist标签构造javabean -->
     	<s:checkboxlist list="%{#request.persons}" name="person"
     		listKey="id" listValue="name" value="{0,2,4,6,8}"></s:checkboxlist>
     	
     	<!-- radio标签构造list集合 -->
     	<s:radio list="{'java','.net','php'}" name="list" value="'java'"></s:radio>
     	
     	<!-- radio标签构造list集合 -->
     	<s:radio list="#{'01':'java','02':'php','03':'.net','04':'oracle'}"
     		listKey="key" listValue="value" name="map" value="'01'"></s:radio>
     		
     	<!-- radio标签构造javabean -->
     	<s:radio list="#request.persons" listKey="id" listValue="name" name="person" value="0"></s:radio>
     	
     	<!-- select标签构造list集合 -->
     	<s:select list="{'java','.net','php'}" name="list" value="'php'"></s:select>
     	
     	<!-- select标签构造map集合 -->
     	<s:select list="#{'01':'java','02':'php','03':'.net','04':'oracle'}"
     		listKey="key" listValue="value" name="map" value="'03'"></s:select>
     	
     	<!-- select标签构造javabean -->
     	<s:select list="#request.persons" listKey="id" listValue="name" name="person" value="8"></s:select>
     	
     	
     	<s:submit type="input" value="确认"></s:submit>
     	<s:submit type="button" value="提交"></s:submit>
     	<s:submit type="image" value="图片"></s:submit>
     	<s:reset type="input" value="重置1"></s:reset>
     	<s:reset type="button" value="重置2"></s:reset>
     </s:form>
  </body>
</html>
