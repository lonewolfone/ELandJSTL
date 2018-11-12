## EL表达式

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\39.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\40.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\41.png)

### EL表达式

#### 获取数据

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\42.png)

index.jsp

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>EL表达式及JSTL的入门</title>
  </head>
  <body>
        <a href="/goodsServlet">EL表达式</a><br>
        <a href="/EL.jsp?name=二狗">EL表达式逻辑运算</a><br>
        <a href="">JSTL</a>
  </body>
</html>
```

goodsServlet类

```java
@WebServlet("/goodsServlet")
public class goodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         goodsService goodsService =  new goodsServiceImpl();

        //获取商品列表
        List<Goods> goodsList = goodsService.findAllGoods();
        Goods goods = goodsService.findOneGoods(1);//获取一个商品信息
        //将商品列表存放到request中
        request.setAttribute("goodsList",goodsList);
        request.setAttribute("goods",goods);//将商品存放到request中
        request.getRequestDispatcher("/EL.jsp").forward(request,response);
    }
}

```

EL.jsp

```jsp
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

```

##### EL表达式访问JavaBean属性

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\43.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\44.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\45.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\46.png)

#### 执行运算

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\47.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\48.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\49.png)

##### EL算术运算

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\53.png)

##### EL关系运算

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\54.png)

##### EL逻辑运算符

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\55.png)

#### 获取Web开发常用对象

##### EL表达式隐含对象

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\56.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\57.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\58.png)

### JSTL