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
    <title>detail.jsp</title>
<%--    <base href="<%=basePath%>">--%>
</head>
<body>
<center>
    <table border=1 background="images/bb.jpg">
        <caption>
            <font size=4 face=华文新魏>商品详细信息</font>
        </caption>
        <tr>
            <td>商品ID</td>
            <td>${agoods.id}</td>
        </tr>
        <tr>
            <td>商品姓名</td>
            <td>${agoods.gname}</td>
        </tr>
        <tr>
            <td>商品原价</td>
            <td>${agoods.goprice}</td>
        </tr>
        <tr>
            <td>折扣价</td>
            <td>${agoods.grprice}</td>
        </tr>
        <tr>
            <td>库存</td>
            <td>${agoods.gstore}</td>
        </tr>
        <tr>
            <td>图片</td>
            <td><img alt="" width="250" height="250"
                     src="uploadFile/${agoods.gpicture}" /></td>
        </tr>
        <tr>
            <td>商品类型</td>
            <td>${agoods.typename}</td>
        </tr>
    </table>
</center>
</body>
</html>