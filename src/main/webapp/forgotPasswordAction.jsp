
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>


<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
String email = request.getParameter("email");

try{
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM admin WHERE email=?"
    );
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        // Email exists → simulate reset
        response.sendRedirect("forgotPassword.jsp?msg=sent");
    } else {
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
}
catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("forgotPassword.jsp?msg=invalid");
}
%>
