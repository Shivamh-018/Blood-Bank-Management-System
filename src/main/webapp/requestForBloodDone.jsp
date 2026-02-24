<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
Connection con = null;

try{
    con = ConnectionProvider.getCon();
    con.setAutoCommit(false);

    // Get request details
    PreparedStatement ps1 = con.prepareStatement(
        "SELECT bloodgroup, units FROM bloodrequest WHERE id=? AND status='Pending'"
    );
    ps1.setInt(1, Integer.parseInt(id));
    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
        String bloodgroup = rs1.getString("bloodgroup");
        int reqUnits = rs1.getInt("units");

        // Check stock
        PreparedStatement ps2 = con.prepareStatement(
            "SELECT units FROM stock WHERE bloodgroup=?"
        );
        ps2.setString(1, bloodgroup);
        ResultSet rs2 = ps2.executeQuery();

        if(rs2.next()){
            int available = rs2.getInt("units");

            if(available >= reqUnits){
                // Reduce stock
                PreparedStatement ps3 = con.prepareStatement(
                    "UPDATE stock SET units = units - ? WHERE bloodgroup=?"
                );
                ps3.setInt(1, reqUnits);
                ps3.setString(2, bloodgroup);
                ps3.executeUpdate();

                // Approve request
                PreparedStatement ps4 = con.prepareStatement(
                    "UPDATE bloodrequest SET status='Approved' WHERE id=?"
                );
                ps4.setInt(1, Integer.parseInt(id));
                ps4.executeUpdate();

                con.commit();
                response.sendRedirect("requestCompleted.jsp?msg=approved");
            }
            else {
                // 🚨 AUTO-REJECT
                PreparedStatement ps5 = con.prepareStatement(
                    "UPDATE bloodrequest SET status='Rejected' WHERE id=?"
                );
                ps5.setInt(1, Integer.parseInt(id));
                ps5.executeUpdate();

                con.commit();
                response.sendRedirect("requestForBlood.jsp?msg=autoreject");
            }
        }
    }

}catch(Exception e){
    if(con!=null) con.rollback();
    e.printStackTrace();
    response.sendRedirect("requestForBlood.jsp?msg=error");
}
finally{
    if(con!=null) con.setAutoCommit(true);
}
%>
