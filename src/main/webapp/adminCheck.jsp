<%
/* Prevent browser cache */
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

/* Admin session check */
if(session.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>
