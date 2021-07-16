<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>noticeDetail.jsp</title>
<base href="<%=basePath%>">
</head>
<body>
	<center>
		<table background="admin/images/bb.jpg" width="350" height="350">
			<caption>
				<font size=4 face=华文新魏>公告详情</font>
			</caption>
			<tr>
				<td><p align="center">${requestScope.anotice.ntitle}</td>
			</tr>

			<tr>
				<td><p align="left">&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.anotice.ncontent}</td>
			</tr>

			<tr>
				<td><p align="right">${requestScope.anotice.ntime}</td>
			</tr>
		</table>
	</center>
</body>
</html>