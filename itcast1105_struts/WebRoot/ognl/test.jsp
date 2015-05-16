<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    </head>
  <body>
      测试值栈:<br>
        <a href="${pageContext.request.contextPath}/ognl/ValueStackAction_test.action">test</a><br>
        <br>
        <br>
        <br>
      测试ognl表达式的用法<br> 
        <a href="${pageContext.request.contextPath}/ognl/OgnlAction_test.action?cid=9">test</a><br>
      
      测试标签<br>
        <a href="${pageContext.request.contextPath}/ognl/OgnlTagAction_test.action?cid=9">test</a><br>
  </body>
</html>
