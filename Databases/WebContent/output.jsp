<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<%

  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding ����

  Class.forName("com.mysql.jdbc.Driver");    // load the drive
  String DB_URL = 
		  "jdbc:mysql://192.168.56.102:3306/termtest";
                 // ���� : test by changing mydb to name that you make

  String DB_USER = "root";
  String DB_PASSWORD= "2210109h";

  Connection conn= null;
  Statement stmt = null;
  ResultSet rs   = null;

  try {
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      stmt = conn.createStatement();

      String query = "SELECT id, name, pwd, email, age FROM NewName";
      rs = stmt.executeQuery(query);
 %>

<form action="delete_do.jsp" method="post">
<table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>password</td>
<td>Name</td>
<td>age</td>
<td>email</td>
<th>���</th>
</tr>
<%
    while(rs.next()) { //rs �� ���� ���̺� ��ü���� �ʵ尪�� �Ѱܺ� �� �ִ�.
%><tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString("pwd")%></td>
<td><%=rs.getString("email")%></td>
<td><a href="delete_do.jsp?del=<%=rs.getString(1)%>">����</a>
</td>
</tr>
<%
    } // end while
%></table>
</form>
<%
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>

