<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
java.sql.Connection conn=null; 
java.lang.String strConn; 
java.sql.Statement sqlStmt=null; //语句对象 
java.sql.ResultSet sqlRst=null; //结果集对象 
try{
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/message","root","6003"); 
    sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
//执行Sql语句 
    String sqlQuery="select * from message"; 
    sqlRst=sqlStmt.executeQuery (sqlQuery); 
%>
<center>查看留言簿</center>
<table border="1" width="100%" bordercolorlight="#CC99FF" cellpadding="2" bordercolordark="#FFFFFF" cellspacing="0"> 
<tr> 
  <td align="center">ID</td> 
  <td align="center">姓名</td> 
  <td align="center">主题</td> 
  <td align="center">Email</td>
  <td align="center">留言</td>
</tr> 
<% while (sqlRst.next()) { //取得下一条记录 %> 
<tr><!--显示记录--> 
  <td align="center"><%=sqlRst.getString("idmessage")%></td> 
  <td align="center"><%=new String(sqlRst.getString("name"))%></td>
  <td align="center"><%=new String(sqlRst.getString("title"))%></td>
  <td align="center"><%=new String(sqlRst.getString("email"))%></td>
  <td align="center"><%=new String(sqlRst.getString("content"))%></td>
 </tr> 
<% } %> 
</table> 
<p align="center"><a href="message.jsp">我要留言</a></p>
<%
 } catch (java.sql.SQLException e){
out.println(e.toString());
}finally{
    //关闭结果集对象 
  if(sqlRst!=null)try{sqlRst.close();}catch(java.sql.SQLException e1){
      out.println(e1.toString());
  } finally{
      try{
         //关闭语句对象 
          if(sqlStmt!=null)sqlStmt.close ();  
      }catch(java.sql.SQLException e2){
          out.println(e2.toString());
      }finally{
          try{
//关闭数据库连接 
              if(conn!=null)conn.close(); 
          }catch(java.sql.SQLException e3){
              out.println(e3.toString());
          }
      }
  }
  
}
%> 
