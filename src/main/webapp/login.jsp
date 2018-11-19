<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String dbdriver = "dbdriver";
    String dbconnection = "dbconnection";
    String dbuser = "dbuser";
    String dbpassword = "dbpassword";
    Class.forName(dbdriver);
    Connection con = DriverManager.getConnection(dbconnection, dbuser, dbpassword);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where userName='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
