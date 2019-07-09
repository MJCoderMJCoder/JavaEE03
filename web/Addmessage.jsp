<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    %>
<% 
java.sql.Connection conn=null; 
java.lang.String strConn; 
java.sql.Statement sqlStmt=null; //语句对象 
java.sql.ResultSet sqlRst=null; //结果集对象 
try{
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/message","root","6003"); 
    sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
%>
<%
    String name=null;
    String title=null;
    String email=null;
    String content=null;
    
    name=request.getParameter("name");
    title = request.getParameter("title");
    email = request.getParameter("email");
    content = request.getParameter("content");
    String sql_1 = "insert into message(name,title,email,content) values('"     +name
                +"','"
                +title
                +"','"
                +email
                +"','"
                + content + "')";
        sqlStmt.executeUpdate(sql_1);
%>
<center><h2>添加留言簿</h2>
    <br><%=name%>的留言已添加到数据库！
    <form action="message.jsp" method="post"><input type="submit" id="back" value="返回"></form>
</center>

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
