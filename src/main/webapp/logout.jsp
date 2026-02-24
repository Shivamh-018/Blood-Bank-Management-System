<%
session.invalidate();   // destroy admin session
response.sendRedirect("adminLogin.jsp");
%>
