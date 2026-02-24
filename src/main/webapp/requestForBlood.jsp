<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<title>Pending Blood Requests</title>

<style>
table{
    width:90%;
    margin:auto;
    border-collapse:collapse;
}
th,td{
    border:1px solid #ccc;
    padding:10px;
    text-align:center;
}
th{
    background:#c62828;
    color:white;
}
a{
    text-decoration:none;
    font-weight:bold;
}
.approve{ color:green; }
.reject{ color:red; }
</style>
</head>

<body>
<br>
<%
String msg = request.getParameter("msg");
if("autoreject".equals(msg)){
%>
<center>
  <p class="error-msg" style="color:red;font-size:18px;font-weight:bold;">
    Request auto-rejected due to insufficient blood stock
  </p>
</center>
<%
}
%>

<script>
setTimeout(() => {
    const msg = document.querySelector('.error-msg');
    if(msg){
        msg.style.display = 'none';
    }
}, 3000);
</script>





<center><h2 style="color:red;">Pending Blood Requests</h2></center>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Mobile</th>
    <th>Email</th>
    <th>Blood Group</th>
    <th>Date</th>
    <th>Approve</th>
    <th>Reject</th>
</tr>

<%
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT * FROM bloodrequest WHERE status='Pending'"
);

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("mobilenumber")%></td>
    <td><%=rs.getString("email")%></td>
    <td><%=rs.getString("bloodgroup")%></td>
    <td><%=rs.getTimestamp("request_date")%></td>

    <td>
        <a class="approve"
           href="requestForBloodDone.jsp?id=<%=rs.getInt("id")%>">
           Approve
        </a>
    </td>

    <td>
        <a class="reject"
           href="requestForBloodDelete.jsp?id=<%=rs.getInt("id")%>"
           onclick="return confirm('Reject this request?');">
           Reject
        </a>
    </td>
</tr>
<%
}
%>

</table>

<%@ include file="footer.jsp" %>
</body>
</html>
