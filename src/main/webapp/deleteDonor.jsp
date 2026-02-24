<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM donor WHERE id=?"
    );
    ps.setInt(1, Integer.parseInt(id));

    int result = ps.executeUpdate();

    if(result > 0){
        // success
        response.sendRedirect("editDeleteList.jsp?msg=deleted");
    } else {
        // failed
        response.sendRedirect("editDeleteList.jsp?msg=error");
    }

} catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("editDeleteList.jsp?msg=error");
}
%>
