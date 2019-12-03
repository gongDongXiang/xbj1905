<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小鸟列表</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resource/jquery-1.8.2.min.js"></script>

<!--1.引入分页css,js  -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resource/layui/css/layui.css"
      media="all"/>
<script src="${pageContext.request.contextPath}/resource/layui/layui.js"
        charset="utf-8"></script>
<form action="${pageContext.request.contextPath}/bird/list" method="post">
    姓名:
    <input type="text" name="birdName" value="${bird.birdName}" />
    爱好:
   <input type="text" name="hobbies" value="${bird.hobbies}">
    邮箱:
    <input type="text" name="email" value="${bird.email}"/>

    <input id="currentPage" type="hidden" name="currentPage" value="1"/>
    <input id="pageSize" type="hidden" name="pageSize" value="5"/>

    <input type="submit" value="查询">
</form>
<br>
<table border="1px" cellspacing="0" cellpadding="20px">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>爱好</th>
        <th>地址</th>
        <th>邮箱</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${page.list}" var="bird">
    <tr>
        <td>${bird.birdId}</td>
        <td>${bird.birdName}</td>
        <c:choose>
            <c:when test='${bird.gender == "1"}'>
                <td>男</td>
            </c:when>
            <c:otherwise>
                <td>女</td>
            </c:otherwise>
        </c:choose>
        <td>${bird.hobbies}</td>
        <c:choose>
            <c:when test='${bird.address == "hf"}'>
                <td>合肥</td>
            </c:when>

            <c:when test='${bird.address == "tl"}'>
                <td>铜陵</td>
            </c:when>

            <c:when test='${bird.address == "wh"}'>
                <td>芜湖</td>
            </c:when>
            <c:when test='${bird.address == "luan"}'>
                <td>六安</td>
            </c:when>
        </c:choose>

        <td>${bird.email}</td>
      <td><a href="${pageContext.request.contextPath}/bird/toModify?id=${bird.birdId}">修改</a>|<a href="${pageContext.request.contextPath}/bird/delete?id=${bird.birdId}">删除</a></td>
    </tr>
    </c:forEach>
</table>
    <div id="add">
        <a href="${pageContext.request.contextPath}/jsp/bird_add.jsp"> 添加数据</a>
    </div>
    <div id="demo7" style="text-align: center;"></div>
</body>
<script>
    layui.use([ 'laypage', 'layer' ], function() {
        var laypage = layui.laypage, layer = layui.layer;

        //完整功能
        laypage.render({
            elem : 'demo7', //分页组件显示的标签
            count : '${page.totalNo}', //记录总条数
            limit : '${page.pageSize}', //一页显示的行数
            curr : '${page.currentPage}', //当前页数
            limits : [ 1, 5, 10, 15 ], //选择展示条数下拉框
            layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
            jump : function(obj, first) {//点击页码的回调函数
                //首次不执行
                if (!first) {
                    //alert(obj.curr);//当前页
                    //alert(obj.limit);//一页显示的条数
                    $("#currentPage").val(obj.curr);
                    $("#pageSize").val(obj.limit);
                    $("form:first").submit();//提交表单
                }
            }
        });

    });
</script>
</html>
