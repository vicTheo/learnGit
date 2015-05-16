<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="description" content="page">
  </head>
  <body>
    <s:debug></s:debug>
    <s:form name="form1" namespace="/model" action="userAction_update" method="post" theme="simple">
       用户名:<s:textfield name="username"/><br>
       电话:<s:textfield name="tel" /><br>
       描述:<s:textfield name="des" /><br>
       <s:token></s:token>
      <s:submit type="submit" value="保存"></s:submit>
    </s:form>
    
  </body>
</html>
