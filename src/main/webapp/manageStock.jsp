<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Blood Stock</title>

<style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background:#f4f6f9;
}
#customers {
  border-collapse: collapse;
  width: 80%;
  margin:auto;
  background:white;
}
#customers th, #customers td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align:center;
}
#customers th {
  background-color: #4CAF50;
  color: white;
}
input[type=number]{
    width:80px;
    padding:6px;
}
button{
    padding:6px 12px;
    border:none;
    border-radius:5px;
    cursor:pointer;
    color:white;
}
.add-btn{ background:green; }
.sub-btn{ background:red; }

.success-msg{
    color:green;
    font-size:18px;
    font-weight:bold;
}
.error-msg{
    color:red;
    font-size:18px;
    font-weight:bold;
}
</style>
</head>

<body>
<br>

<%
String msg = request.getParameter("msg");
if("added".equals(msg)){
%>
<center><p class="success-msg">Stock Added Successfully</p></center>
<%
}else if("distributed".equals(msg)){
%>
<center><p class="success-msg">Blood Units Distributed Successfully</p></center>
<%
}else if("insufficient".equals(msg)){
%>
<center><p class="error-msg">Insufficient Blood Stock!</p></center>
<%
}else if("error".equals(msg)){
%>
<center><p class="error-msg">Something went wrong!</p></center>
<%
}
%>

<script>
setTimeout(()=>{
  const m=document.querySelector('.success-msg,.error-msg');
  if(m) m.style.display='none';
},3000);
</script>

<center>
<h2 style="color:red;">Manage Blood Stock</h2>
</center>

<table id="customers">
<tr>
    <th>Blood Group</th>
    <th>Available Units</th>
    <th>Add Units</th>
    <th>Distribute Units</th>
    <th>Action</th>
</tr>

<%
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM stock");

while(rs.next()){
%>
<tr>
<form action="manageStockAction.jsp" method="post">

    <td>
        <%= rs.getString("bloodgroup") %>
        <input type="hidden" name="bloodgroup" value="<%= rs.getString("bloodgroup") %>">
    </td>

    <td><%= rs.getInt("units") %></td>

    <!-- ADD -->
    <td>
        <input type="number" name="addUnits" min="1">
    </td>

    <!-- DISTRIBUTE -->
    <td>
        <input type="number" name="distUnits" min="1">
    </td>

    <td>
        <button class="add-btn" type="submit" name="action" value="add">Add</button>
        <button class="sub-btn" type="submit" name="action" value="distribute"
        onclick="return confirm('Are you sure to distribute blood?');">
        Distribute</button>
    </td>

</form>
</tr>
<%
}
%>

</table>

<%@ include file="footer.jsp" %>
</body>
</html>
