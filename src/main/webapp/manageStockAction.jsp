<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String bloodgroup = request.getParameter("bloodgroup");
String action = request.getParameter("action");

Connection con = ConnectionProvider.getCon();

try{
    if("add".equals(action)){
        int addUnits = Integer.parseInt(request.getParameter("addUnits"));

        PreparedStatement ps = con.prepareStatement(
            "UPDATE stock SET units = units + ? WHERE bloodgroup=?"
        );
        ps.setInt(1, addUnits);
        ps.setString(2, bloodgroup);
        ps.executeUpdate();

        response.sendRedirect("manageStock.jsp?msg=added");
    }

    else if("distribute".equals(action)){
        int distUnits = Integer.parseInt(request.getParameter("distUnits"));

        PreparedStatement ps1 = con.prepareStatement(
            "SELECT units FROM stock WHERE bloodgroup=?"
        );
        ps1.setString(1, bloodgroup);
        ResultSet rs = ps1.executeQuery();

        if(rs.next()){
            int available = rs.getInt("units");

            if(available >= distUnits){
                PreparedStatement ps2 = con.prepareStatement(
                    "UPDATE stock SET units = units - ? WHERE bloodgroup=?"
                );
                ps2.setInt(1, distUnits);
                ps2.setString(2, bloodgroup);
                ps2.executeUpdate();

                response.sendRedirect("manageStock.jsp?msg=distributed");
            }else{
                response.sendRedirect("manageStock.jsp?msg=insufficient");
            }
        }
    }
}catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("manageStock.jsp?msg=error");
}
%>
