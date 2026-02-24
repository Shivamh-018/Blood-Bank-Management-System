<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try{
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM admin WHERE username=? AND password=?"
    );

    ps.setString(1, username);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        // ✅ LOGIN SUCCESS
        session.setAttribute("admin", username);
        response.sendRedirect("home.jsp");
    } else {
        // ❌ LOGIN FAILED
        response.sendRedirect("adminLogin.jsp?msg=invalid");
    }
}
catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>
