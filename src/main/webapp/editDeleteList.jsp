<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
  margin:auto;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  background-color: #4CAF50;
  color: white;
}
a{
    text-decoration:none;
    color:blue;
}

.success-msg{
    color:green;
    font-size:20px;
    font-weight:bold;
    margin:15px;
}

.error-msg{
    color:red;
    font-size:20px;
    font-weight:bold;
    margin:15px;
}


</style>
</head>

<body>
<br>

 
<%
String msg = request.getParameter("msg");

if("updated".equals(msg)){
%>
    <center><p class="success-msg">Donor Updated Successfully</p></center>
<%
}
else if("deleted".equals(msg)){
%>
    <center><p class="success-msg">Donor Deleted Successfully</p></center>
<%
}
else if("error".equals(msg)){
%>
    <center><p class="error-msg">Something went wrong. Try again!</p></center>
<%
}
%>

<!-- Auto hide message after 3 seconds -->
<script>
setTimeout(() => {
  const msg = document.querySelector('.success-msg, .error-msg');
  if(msg) msg.style.display = 'none';
}, 3000);
</script>
 





<center>
<h2 style="color:red;">Donor List</h2>

<table id="customers">
<tr>
   <th>ID</th>
   <th>Name</th>
   <th>Father Name</th>
   <th>Mother Name</th>
   <th>Mobile Number</th>
   <th>Gender</th>
   <th>Email</th>
   <th>Blood Group</th>
   <th>Address</th>
   <th>Date</th>
   <th>Edit</th>
   <th>Delete</th>
</tr>

<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM donor");

    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td><%= rs.getString(8) %></td>
    <td><%= rs.getString(9) %></td>
    <td><%= rs.getDate(10) %></td>
    <td><a href="updateDonor.jsp?id=<%= rs.getInt(1) %>">Edit</a></td>
    
    <td><a href="deleteDonor.jsp?id=<%= rs.getInt(1) %>"
           onclick="return confirm('Are you sure you want to delete this donor?');">
           Delete</a></td>
</tr>
<%
    }
} catch (Exception e) {
    out.println(e);
}
%>

</table>
</center>

<%@ include file="footer.jsp" %>
</body>
</html>
