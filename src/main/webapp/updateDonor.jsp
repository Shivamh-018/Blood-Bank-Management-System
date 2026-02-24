<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<title>Update Donor</title>

<link rel="stylesheet" href="style.css" type="text/css">

<style>
body{
    background:#f4f6f9;
    font-family: Arial, Helvetica, sans-serif;
}

/* Card container */
.form-card{
    width:60%;
    margin:40px auto;
    background:#ffffff;
    padding:30px 40px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.15);
}

.form-card h1{
    text-align:center;
    color:#c62828;
}

/* Form group */
.form-group{
    margin-bottom:15px;
}

.form-group label{
    font-weight:bold;
    display:block;
    margin-bottom:6px;
}

/* Inputs */
.form-group input,
.form-group select{
    width:100%;
    height:48px;
    padding:12px;
    font-size:15px;
    border:none;
    border-radius:8px;
    background:#f1f1f1;
}

/* Readonly */
.form-group input[readonly]{
    background:#e0e0e0;
}

/* Button */
.button1{
    width:100%;
    height:50px;
    background:#c62828;
    color:white;
    font-size:16px;
    border:none;
    border-radius:10px;
    cursor:pointer;
    margin-top:15px;
}

.button1:hover{
    background:#b71c1c;
}
</style>
</head>

<body>

<%
String id = request.getParameter("id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM donor WHERE id=?"
    );
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
%>

<div class="form-card">
<h1>Update Form </h1>

<form action="updateDonorAction.jsp" method="post">
<label>Donor_id</label>
<input type="text" name="id" value="<%= rs.getInt(1) %>" readonly>

<div class="form-group">
<label>Name</label>
<input type="text" name="name" value="<%= rs.getString(2) %>" required>
</div>

<div class="form-group">
<label>Father Name</label>
<input type="text" name="father" value="<%= rs.getString(3) %>">
</div>

<div class="form-group">
<label>Mother Name</label>
<input type="text" name="mother" value="<%= rs.getString(4) %>">
</div>

<div class="form-group">
<label>Mobile Number</label>
<input type="text" name="mobilenumber" value="<%= rs.getString(5) %>" required>
</div>

<div class="form-group">
<label>Gender</label>
<select name="gender">
    <option <%= rs.getString(6).equals("Male")?"selected":"" %>>Male</option>
    <option <%= rs.getString(6).equals("Female")?"selected":"" %>>Female</option>
    <option <%= rs.getString(6).equals("Other")?"selected":"" %>>Other</option>
</select>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" value="<%= rs.getString(7) %>">
</div>

<div class="form-group">
<label>Blood Group</label>
<select name="bloodgroup">
    <option <%= rs.getString(8).equals("A+")?"selected":"" %>>A+</option>
    <option <%= rs.getString(8).equals("A-")?"selected":"" %>>A-</option>
    <option <%= rs.getString(8).equals("B+")?"selected":"" %>>B+</option>
    <option <%= rs.getString(8).equals("B-")?"selected":"" %>>B-</option>
    <option <%= rs.getString(8).equals("AB+")?"selected":"" %>>AB+</option>
    <option <%= rs.getString(8).equals("AB-")?"selected":"" %>>AB-</option>
    <option <%= rs.getString(8).equals("O+")?"selected":"" %>>O+</option>
    <option <%= rs.getString(8).equals("O-")?"selected":"" %>>O-</option>
</select>
</div>

<div class="form-group">
<label>Address</label>
<input type="text" name="address" value="<%= rs.getString(9) %>">
</div>

<div class="form-group">
<label>Registered Date</label>
<input type="text" value="<%= rs.getTimestamp("request_date") %>" readonly>
</div>

<input type="submit" class="button1" value="Update Donor">

</form>
</div>

<%
    }
} catch(Exception e) {
    out.println(e);
}
%>

<%@ include file="footer.jsp" %>

</body>
</html>
