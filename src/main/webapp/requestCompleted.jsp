<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<title>Approved Blood Requests</title>

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
    background:green;
    color:white;
}
.success-msg{
    color:green;
    font-size:18px;
    font-weight:bold;
}
</style>
</head>

<body>
<br>

<%
String msg=request.getParameter("msg");
if("approved".equals(msg)){
%>
<center><p class="success-msg">Request Approved Successfully</p></center>
<%
}
%>

<script>
setTimeout(()=>{
  const m=document.querySelector('.success-msg');
  if(m) m.style.display='none';
},3000);
</script>

<center><h2 style="color:green;">Approved Blood Requests</h2></center>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Mobile</th>
    <th>Email</th>
    <th>Blood Group</th>
    <th>Date</th>
</tr>

<%
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT * FROM bloodrequest WHERE status='Approved'"
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
</tr>
<%
}
%>

</table>

<%@ include file="footer.jsp" %>
</body>
</html>
