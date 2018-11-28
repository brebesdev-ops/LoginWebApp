<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String dbdriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String dbconnection = "jdbc:sqlserver://sqlserverdb.cvlvbu3tfq9g.ap-south-1.rds.amazonaws.com:1433/sqlserverdb";
    String dbuser = "sbikkasani";
    String dbpassword = "sbikkasani";
    Class.forName(dbdriver);
    Connection con = DriverManager.getConnection(dbconnection, dbuser, dbpassword);
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into Userdata(first_name, last_name, email, username, password) values ('" + firstName + "','"
    + lastName + "','" + email + "','" + userName + "','" + password + "')");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");

    } else {
        response.sendRedirect("index.jsp");
    }
%>
