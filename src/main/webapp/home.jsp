<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminCheck.jsp"%>
<%@include file="header.html"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Blood Bank</title>

<style>
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    background:#eef3f7;
}

/* ===== WELCOME / HERO ===== */
.welcome-slide{
    height:55vh;
    display:flex;
    align-items:center;
    justify-content:center;
    background:
      linear-gradient(rgba(0,0,0,0.55),rgba(0,0,0,0.55)),
      url("hospital-bg.jpg") center/cover no-repeat;
    color:white;
    text-align:center;
}

.welcome-content{
    animation: slideFade 1.4s ease-out;
}

.welcome-content h1{
    font-size:46px;
    margin-bottom:10px;
}

.welcome-content p{
    font-size:18px;
    opacity:0.9;
}

@keyframes slideFade{
    from{ transform:translateY(40px); opacity:0; }
    to{ transform:translateY(0); opacity:1; }
}

/* ===== ECG HEARTBEAT ===== */
.ecg-wrapper{
    display:flex;
    justify-content:center;
    margin:30px 0 10px;
}

.ecg{
    width:600px;
    height:100px;
}

.ecg path{
    fill:none;
    stroke:#e53935;
    stroke-width:4;
    stroke-dasharray:1000;
    stroke-dashoffset:1000;
    animation:ecgMove 2.5s linear infinite;
}

@keyframes ecgMove{
    to{ stroke-dashoffset:0; }
}

/* ===== TODAY SECTION ===== */
.today-section{
    width:92%;
    margin:40px auto;
}

.today-section h1{
    text-align:center;
    color:#b71c1c;
    margin-bottom:30px;
    font-size:34px;
}

/* ===== CARDS ===== */
.today-cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(230px,1fr));
    gap:25px;
}

.today-card{
    background:rgba(255,255,255,0.9);
    padding:30px;
    border-radius:18px;
    box-shadow:0 10px 30px rgba(0,0,0,0.12);
    text-align:center;
    transition:0.3s;
    position:relative;
}

.today-card:hover{
    transform:translateY(-8px);
}

.today-card::after{
    content:'';
    position:absolute;
    top:0; left:0;
    width:100%;
    height:4px;
    background:#e53935;
    border-radius:18px 18px 0 0;
}

.today-icon{
    font-size:42px;
    margin-bottom:10px;
}

.today-count{
    font-size:38px;
    font-weight:700;
    color:#263238;
}

.today-label{
    font-size:15px;
    color:#555;
}

/* ===== FOOTER ===== */
.footer{
    background:#263238;
    color:white;
    padding:15px;
    text-align:center;
    margin-top:50px;
}
</style>
</head>

<body>

<%
int donorsToday=0, requestsToday=0, approvedToday=0, unitsDistributedToday=0;

Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();

ResultSet r1 = st.executeQuery(
    "SELECT COUNT(*) FROM donor WHERE DATE(request_date)=CURDATE()"
);
if(r1.next()) donorsToday = r1.getInt(1);

ResultSet r2 = st.executeQuery(
    "SELECT COUNT(*) FROM bloodrequest WHERE DATE(request_date)=CURDATE()"
);
if(r2.next()) requestsToday = r2.getInt(1);

ResultSet r3 = st.executeQuery(
    "SELECT COUNT(*) FROM bloodrequest WHERE status='Approved' AND DATE(request_date)=CURDATE()"
);
if(r3.next()) approvedToday = r3.getInt(1);

ResultSet r4 = st.executeQuery(
    "SELECT SUM(units) FROM bloodrequest WHERE status='Approved' AND DATE(request_date)=CURDATE()"
);
if(r4.next()) unitsDistributedToday = r4.getInt(1);
%>

<!-- ===== WELCOME SLIDE ===== -->
<div class="welcome-slide">
    <div class="welcome-content">
        <h1>Welcome, Admin 👋</h1>
        <p>Blood Bank Management System</p>
    </div>
</div>

<div class="ecg-wrapper">
    <svg class="ecg" viewBox="0 0 600 100">
        <path d="
            M0 50 L60 50 
            L80 20 L100 80 L120 50
            L160 50 L180 30 L200 70 L220 50
            L300 50
            L320 20 L340 80 L360 50
            L420 50 L440 30 L460 70 L480 50
            L600 50
        "/>
    </svg>
</div>

<!-- ===== TODAY ACTIVITY SUMMARY ===== -->
<div class="today-section">
    <h1>Today's Activity Summary</h1>

    <div class="today-cards">

        <div class="today-card">
            <div class="today-icon">🧑‍⚕️</div>
            <div class="today-count" data-target="<%= donorsToday %>">0</div>
            <div class="today-label">Donors Added Today</div>
        </div>

        <div class="today-card">
            <div class="today-icon">📝</div>
            <div class="today-count" data-target="<%= requestsToday %>">0</div>
            <div class="today-label">Requests Raised Today</div>
        </div>

        <div class="today-card">
            <div class="today-icon">✅</div>
            <div class="today-count" data-target="<%= approvedToday %>">0</div>
            <div class="today-label">Requests Approved Today</div>
        </div>

        <div class="today-card">
            <div class="today-icon">🩸</div>
            <div class="today-count" data-target="<%= unitsDistributedToday %>">0</div>
            <div class="today-label">Blood Units Distributed</div>
        </div>

    </div>
</div>

<!-- ===== COUNTER ANIMATION ===== -->
<script>
const counters = document.querySelectorAll('.today-count');

counters.forEach(counter => {
    counter.innerText = '0';
    const updateCounter = () => {
        const target = +counter.getAttribute('data-target');
        const current = +counter.innerText;
        const increment = Math.ceil(target / 60);

        if(current < target){
            counter.innerText = current + increment;
            setTimeout(updateCounter, 25);
        } else {
            counter.innerText = target;
        }
    };
    updateCounter();
});
</script>

<!-- ===== FOOTER ===== -->
<%@ include file="footer.jsp" %>

</body>
</html>
