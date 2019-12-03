
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p2 >欢迎登录小鸟系统</p2>
<body>
<form action="${pageContext.request.contextPath}/bird/login" method="post">
    <div>
        姓名:
        <input type="text" name="birdName" />
    </div>
    <div>
        密码:
        <input type="password" name="birdName" />
    </div>

</form>
</body>
</html>
