<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>留言簿</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    <center><h1>留言簿</h1></center>
         <form action="Addmessage.jsp" method="post">
            <table width="100%" align="center">
                <tr>
                    <td width="45%" align="right" valign="middle">
                        姓名；
                    </td>
                    <td width="55%" align="left" valign="middle">
                        <input type="text" name="name" size="25">
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="middle">
                        E-mail：
                    </td>
                    <td align="left" valign="middle">
                        <input type="text" name="email" size="25">
                    </td>
                </tr>
                 <tr>
                    <td align="right" valign="middle">
                        主题：
                    </td>
                    <td align="left" valign="middle">
                        <input type="text" name="title" size="25">
                    </td>
                </tr>
                 <tr>
                    <td align="right" valign="middle">
                        留言：
                    </td>
                    <td align="left" valign="middle">
                        <textarea name="content" rows="7" cols="25"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" valign="middle"><input type="submit" value="提交">
                     &nbsp; &nbsp; &nbsp;<a href="Viewmessage.jsp">查看留言</a>
                      &nbsp; &nbsp; &nbsp;<input type="reset" value="重置"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
