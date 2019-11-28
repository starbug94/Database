<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>

	<%
 request.setCharacterEncoding("utf-8");  //Set encoding
 String id  =        request.getParameter("id");            
 String name =   request.getParameter("name");
 String password =     request.getParameter("paswword");
 String email  =   request.getParameter("email");
 String age = 		request.getParameter("age");
//POST로 Input.html로부터 입력받은 내용을 변수화

 try{
  Class.forName("com.mysql.jdbc.Driver");

  Connection con = DriverManager.getConnection("jdbc:mysql://192.168.56.102:3306/termtest", "root","2210109h");
  Statement stat = con.createStatement();

  String query = "INSERT INTO member(id, name, password, email)  VALUES('"+id+"','"+name+"','"+password+"','"+email+"','"+age+"')";
//INSERT into member(id,name,pwd,email) VALUES ('id','name','pwd','email') 쿼리문
  stat.executeUpdate(query);
  stat.close();
  con.close();
 }
 catch(Exception e){
  out.println( e );
 }
 response.sendRedirect("output.jsp"); 
	%>