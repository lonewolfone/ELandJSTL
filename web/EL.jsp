<%@ page import="org.lanqiao.pojo.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.service.goodsService" %>
<%@ page import="org.lanqiao.service.impl.goodsServiceImpl" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %><%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/9
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL表达式</title>
</head>
<body>
    <h2>EL表达式获取数据</h2>

    <%
        goodsService goodsService =  new goodsServiceImpl();
    %>

    <%--存放属性--%>
    <%
        request.setAttribute("username","二狗");
        session.setAttribute("username1","session中从放数据");
    %>
    ${username} <br>
    ${requestScope.username}<br>
    ${sessionScope.username1}<br><br>
    <%----相当于-- <%=pageContext.findAttribute("username")%>--%>

    <%--存放对象--%>
    <%
        Goods goods = goodsService.findOneGoods(1);
    %>
    ${goods.getId()}<br>
    ${goods.getGoodsName()}<br><br>

    <%--存放List集合，下标从0开始--%>
    <%
        List<Goods> goodsList = (List<Goods>) request.getAttribute("goodsList");
    %>
    ${goodsList[1].getId()}<br>
    ${goodsList[1].getGoodsName()}<br><br>

    <%--获取map集合的数据--%>
    <%
        Map<String,String> map = new LinkedHashMap<String, String>();
        map.put("a","aaaa");
        map.put("b","bbbb");
        request.setAttribute("map",map);
    %>
    ${map.a}<br>
    ${map["a"]}<br><br>

    <%--。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。--%>
    JSP脚本之name:<%=request.getAttribute("name")%><br>
    EL表达式之name:${param.name}<br>
    判断是否为空1:${empty param.name}<br>    <%--如果为null 和 "" 都返回true--%>
    判断是否为空2：${param.name == null}<br> <%--只能是为null的时候，返回true--%>

</body>
</html>
