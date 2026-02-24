<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
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

<%
String msg = request.getParameter("msg");
if("success".equals(msg)){
%>
    <center>
        <p class="success-msg">Donor added Successfully</p>
    </center>
<%
}
else if("error".equals(msg)){
%>
    <center>
        <p class="error-msg">Failed to add donor,Something went wrong. Try again!</p>
    </center>
<%
}
%>
   <script>
setTimeout(() => {
  const msg = document.querySelector('.success-msg, .error-msg');
  if(msg) msg.style.display = 'none';
}, 5000);
</script>




<% 
int nextId = 0;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA='bloodbank' AND TABLE_NAME='donor'");
    if(rs.next()){
        nextId = rs.getInt(1);
    }
} catch(Exception e){}
%>






<h1 style="color:red;">Add New Donor</h1>
<hr>

<!-- FORM -->
<form action="addNewDonorAction.jsp" method="post">

    <input type="text" name="name" placeholder="Donor Name" required><br><br>
    <input type="text" name="father" placeholder="Father Name"><br><br>
    <input type="text" name="mother" placeholder="Mother Name"><br><br>
    <input type="text" name="mobilenumber" placeholder="Mobile Number" required><br><br>

    <select name="gender" required>
        <option value="">Select Gender</option>
        <option>Male</option>
        <option>Female</option>
        <option>Other</option>
    </select><br><br>

    <input type="email" name="email" placeholder="Email Address" required><br><br>

    <select name="bloodgroup" required>
        <option value="">Select Blood Group</option>
        <option>A+</option><option>A-</option>
        <option>B+</option><option>B-</option>
        <option>AB+</option><option>AB-</option>
        <option>O+</option><option>O-</option>
    </select><br><br>

    <input type="text" name="address" placeholder="Address" required><br><br>

    <input type="submit" value="Save Donor" 
           style="width:60%;margin-left:20%;height:50px;border-radius:25px;background:red;color:white;font-size:16px;border:none;">

</form>

<br><br><br>







  </div>

<%@ include file="footer.jsp" %>

</body>
</html>