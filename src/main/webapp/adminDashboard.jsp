<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<meta charset="UTF-8">

<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<title>Admin Dashboard</title>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body{
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(120deg, #f4f6f9, #e3f2fd);
}

/* Title */
.dashboard-title{
    text-align:center;
    font-size:34px;
    font-weight:700;
    color:#c62828;
    margin:25px 0;
}

/* Dashboard grid */
.dashboard{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap:25px;
}

/* Cards */
.card{
    background: linear-gradient(135deg, #ffffff, #f9f9f9);
    padding:25px;
    border-radius:16px;
    box-shadow:0 8px 25px rgba(0,0,0,0.15);
    text-align:center;
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover{
    transform: translateY(-6px);
    box-shadow:0 15px 35px rgba(0,0,0,0.25);
}

/* Icons */
.card .icon{
    font-size:38px;
    margin-bottom:10px;
}

/* Card title */
.card h2{
    margin:5px 0;
    font-size:18px;
    color:#555;
}

/* Card value */
.card p{
    font-size:36px;
    font-weight:700;
    color:#c62828;
    margin:0;
}

/* Chart box */
.chart-box{
    width:90%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:18px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
}
.icon{
    font-size:42px;
    color:#c62828;
    margin-bottom:10px;
}


</style>
</head>

<body>

<%
int totalDonors = 0;
int totalRequests = 0;
int pendingRequests = 0;
int approvedRequests = 0;

Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();

ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM donor");
if(rs1.next()) totalDonors = rs1.getInt(1);

ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM bloodrequest");
if(rs2.next()) totalRequests = rs2.getInt(1);

ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM bloodrequest WHERE status='Pending'");
if(rs3.next()) pendingRequests = rs3.getInt(1);

ResultSet rs4 = st.executeQuery("SELECT COUNT(*) FROM bloodrequest WHERE status='Approved'");
if(rs4.next()) approvedRequests = rs4.getInt(1);
%>

<h1 class="dashboard-title">Admin Dashboard</h1>

<!-- DASHBOARD CARDS -->
<div class="dashboard">

   <div class="card">
    <div class="icon"><i class="fa-solid fa-user-doctor"></i></div>
    <h2>Total Donors</h2>
    <p><%= totalDonors %></p>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-file-medical"></i></div>
    <h2>Total Requests</h2>
    <p><%= totalRequests %></p>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-clock"></i></div>
    <h2>Pending Requests</h2>
    <p><%= pendingRequests %></p>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-circle-check"></i></div>
    <h2>Approved Requests</h2>
    <p><%= approvedRequests %></p>
</div>

</div>

<!-- BLOOD STOCK CHART -->
<div class="chart-box">
    <h2 style="text-align:center;color:#c62828;margin-bottom:20px;">
        Blood Stock Availability
    </h2>
    <canvas id="stockChart"></canvas>
</div>

<%
Statement st2 = con.createStatement();
ResultSet rsStock = st2.executeQuery("SELECT bloodgroup, units FROM stock");

String labels = "";
String data = "";

while(rsStock.next()){
    labels += "'" + rsStock.getString("bloodgroup") + "',";
    data += rsStock.getInt("units") + ",";
}
%>

<script>
const ctx = document.getElementById('stockChart');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [<%= labels %>],
        datasets: [{
            label: 'Available Units',
            data: [<%= data %>],
            backgroundColor: [
                '#c62828','#2e7d32','#1565c0','#f9a825',
                '#6a1b9a','#ef6c00','#00838f','#ad1457'
            ]
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
<%@ include file="footer.jsp" %>

</body>
</html>
