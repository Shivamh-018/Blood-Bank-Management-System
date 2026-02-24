<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");

try{
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "UPDATE bloodrequest SET status='Rejected' WHERE id=?"
    );
    ps.setInt(1, Integer.parseInt(id));
    ps.executeUpdate();

    response.sendRedirect("requestForBlood.jsp");

}catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("requestForBlood.jsp");
}
%>
