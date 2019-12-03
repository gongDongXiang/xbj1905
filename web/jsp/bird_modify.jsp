
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resource/jquery-1.8.2.min.js"></script>
<%--导入表单验证的css--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/validform/css/style.css" />
<%--导入表单验证的js--%>
<script src="${pageContext.request.contextPath }/resource/validform/js/Validform_v5.3.2_min.js" type="text/javascript" charset="utf-8"></script>
<form action="${pageContext.request.contextPath}/bird/modify" method="post">
    <input type="hidden" readonly="readonly" name="birdId" value="${bird.birdId}"/>
    <div>
        姓名:
        <input type="text" name="birdName" value="${bird.birdName}" datatype="s2-4">
    </div>

    <div>
        密码:
        <input type="password" name="password" value="${bird.password}" datatype="s2-4">

    </div>

    <div>
        确认:
        <input type="password" value="${bird.password}" recheck="password" datatype="s2-4">

    </div>
    <div>
        输入性别：
        <input type="radio" name="gender" value="1"/>男
        <input type="radio" name="gender" value="0" datatype="*"/>女
    </div>
    <script>
        $(":radio[value=${bird.gender}]").attr("checked",true);
    </script>
    <div>
        爱好:
        <input type="checkbox" name="hobbies" value="lol" >lol
        <input type="checkbox" name="hobbies" value="shopping" >shopping
        <input type="checkbox" name="hobbies" value="dance" >dance
        <input type="checkbox" name="hobbies" value="sleep" >sleep
        <input type="checkbox" name="hobbies" value="java" >java
        <input type="checkbox" name="hobbies" datatype="need2" value="sing" >sing
        <%--爱好复选框回显--%>
        <script>
            // "lol,shopping"
            var hobbies = "${bird.hobbies}".split(",");
            for (var i = 0; i < hobbies.length; i++) {
                $(":checkbox[value="+hobbies[i]+"]").attr("checked", true);
            }
        </script>
    </div>

    <div>
        地址:
        <select name="address" >
            <option value="hf">合肥</option>
            <option value="tl">铜陵</option>
            <option value="wh">芜湖</option>
            <option value="luan">六安</option>
        </select>
        <script>
            $("option[value=${bird.address}]").attr("selected",true);
        </script>
    </div>

    <div>
        邮箱:
        <input type="text" name="email" value="${bird.email}" datatype="e" />
    </div>
    <input type="submit" value="修改">
</form>
</body>

<!-- 表单验证初始化 -->
<script type="text/javascript">
    $("form:first").Validform({
        tiptype: 3,
        datatype:{
            "zh2-4" : /^[\u4E00-\u9FA5\uf900-\ufa2d]{2,4}$/,
            "need2" :function(gets,obj,curform,regxp){
                var need =2,
                    numselected=curform.find("input[name='"+obj.attr("name")+"']:checked").length;
                return numselected>=need ? true : "请至少选择"+need+"项";
            }
        }
    });
</script>
</html>
