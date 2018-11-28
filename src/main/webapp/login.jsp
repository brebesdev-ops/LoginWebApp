<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String dbdriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String dbconnection = "jdbc:sqlserver://sqlserverdb.cvlvbu3tfq9g.ap-south-1.rds.amazonaws.com:1433/sqlserverdb";
    String dbuser = "sbikkasani";
    String dbpassword = "sbikkasani";
    Class.forName(dbdriver);
    Connection con = DriverManager.getConnection(dbconnection, dbuser, dbpassword);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Users where userName='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
