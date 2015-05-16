<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="description" content="page">
  </head>
  <body>
    suiSimple.jsp页面:使用theme="simple"是  标签中lable属性无效
    <s:form name="form1" namespace="/ui" action="uiTagAction_save" method="post">
       用户名:<s:textfield name="username" /><br>
       电话:<s:textfield name="tel" /><br>
       密码:<s:password name="psw" showPassword="true"/><br>
      
       爱好:<s:checkboxlist list="#request.lovesList" name="loves" ><br>
       </s:checkboxlist>
      
      <br>
      学历:<s:select name="eduid" list="#request.edusList" listKey="id" listValue="eduname">
        </s:select>
       <br>
       
      <s:submit type="submit" value="保存"></s:submit>
    </s:form>
    
  </body>
</html>
