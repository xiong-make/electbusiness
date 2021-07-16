<%--
  Created by IntelliJ IDEA.
  User: 86183
  Date: 2021/3/31
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<%--基链接--%>
<%--    <base href="<%=basePath%>>">--%>
    <title>后台登录</title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }
        body{
            font-family: Arial,Helvetica,sans-serif;
            font-size:12px;
            margin: 10px 10px auto;
            background-image: url(images/bb.jpg);
        }
        .textSize{
            width:120px;
            height: 25px;
        }
    </style>
    <script type="text/javascript">
        function gogo(){
            //表单提交
            document.forms[0].submit();
        }
        function cancel(){
            //将提交路径设为空
            document.forms[0].action="";
        }
    </script>
</head>
<body>
<%--<%=basePath%>--%>
<form action="admin_login" method="post">
    <table>
        <tr>
           <td colspan="2"><img src="images/login.gif"></td>
        </tr>
        <tr>
            <td>姓名：</td>
            <td><input type="text" class="textSize" name="aname"/></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" class="textSize" name="apwd"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="image" src="images/ok.gif" onclick="gogo()">
                <input type="image" src="images/cancel.gif" onclick="cancel()">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
