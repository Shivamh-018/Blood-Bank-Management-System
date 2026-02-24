
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Donate Blood | Blood Bank</title>

<link rel="stylesheet" href="style.css" type="text/css">

<!-- Font Awesome -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    background:#f4f6f9;
}

/* ===== HEADER ===== */
.header{
    position:sticky;
    top:0;
    z-index:1000;
    background:linear-gradient(90deg,#b71c1c,#e53935);
    padding:12px 30px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    box-shadow:0 4px 12px rgba(0,0,0,0.3);
}

.header img{
    height:45px;
}

.header-right a{
    text-decoration:none;
    padding:10px 18px;
    color:#fff;
    margin-left:10px;
    border-radius:20px;
    font-size:14px;
    font-weight:600;
}

.header-right a:hover,
.header-right a.active{
    background:rgba(0,0,0,0.25);
}

/* ===== HERO ===== */
.hero{
    background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),
               url("slide1.jpg") center/cover no-repeat;
    height:60vh;
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
    text-align:center;
}

.hero h1{
    font-size:46px;
    margin-bottom:10px;
}

.hero p{
    font-size:18px;
}

/* ===== CONTENT ===== */
.content{
    max-width:900px;
    margin:50px auto;
    background:white;
    padding:40px;
    border-radius:16px;
    box-shadow:0 12px 30px rgba(0,0,0,0.15);
}

.content h2{
    color:#c62828;
    margin-bottom:15px;
}

.content p{
    font-size:16px;
    color:#444;
    line-height:1.7;
}

/* ===== INFO CARDS ===== */
.cards{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
    margin-top:30px;
}

.card{
    background:#f9f9f9;
    padding:25px;
    border-radius:14px;
    text-align:center;
}

.card i{
    font-size:40px;
    color:#c62828;
    margin-bottom:15px;
}

.card h3{
    margin-bottom:10px;
}

/* ===== CONTACT ===== */
.contact{
    margin-top:40px;
    padding:25px;
    background:#e53935;
    color:white;
    border-radius:14px;
    text-align:center;
}

.contact h2{
    color:white;
}

.contact p{
    font-size:18px;
}

/* ===== FOOTER ===== */
.footer{
    background:#263238;
    color:#fff;
    padding:16px;
    text-align:center;
    font-size:14px;
}

/* ===== RESPONSIVE ===== */
@media(max-width:800px){
    .cards{
        grid-template-columns:1fr;
    }
}
/* ICON STYLES */
.phone-icon{
    color:#ffeb3b;   /* Yellow for call */
    font-size:22px;
    margin-right:8px;
}

.address-icon{
    color:#bbdefb;   /* Light blue for location */
    font-size:22px;
    margin-right:8px;
}

/* ===== HEARTBEAT ECG ===== */
.ecg-wrapper{
    display:flex;
    justify-content:center;
    margin:40px 0;
}

.ecg{
    width:600px;
    height:120px;
}

.ecg path{
    fill:none;
    stroke:#e53935;
    stroke-width:4;
    stroke-linecap:round;
    stroke-linejoin:round;
    stroke-dasharray:1000;
    stroke-dashoffset:1000;
    animation: ecgMove 2.5s linear infinite;
}

@keyframes ecgMove{
    0%{
        stroke-dashoffset:1000;
        opacity:0.3;
    }
    20%{
        opacity:1;
    }
    100%{
        stroke-dashoffset:0;
        opacity:1;
    }
}
/* ===== HEARTBEAT ECG ===== */
.ecg-wrapper{
    display:flex;
    justify-content:center;
    margin:40px 0;
}

.ecg{
    width:600px;
    height:120px;
}

.ecg path{
    fill:none;
    stroke:#e53935;
    stroke-width:4;
    stroke-linecap:round;
    stroke-linejoin:round;
    stroke-dasharray:1000;
    stroke-dashoffset:1000;
    animation: ecgMove 2.5s linear infinite;
}

@keyframes ecgMove{
    0%{
        stroke-dashoffset:1000;
        opacity:0.3;
    }
    20%{
        opacity:1;
    }
    100%{
        stroke-dashoffset:0;
        opacity:1;
        }
}



</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <a href="index.jsp">
        <img src="Logo1.png" alt="Logo">
    </a>
    <div class="header-right">
        <a href="index.jsp">Home</a>
        <a class="active" href="donateBlood.jsp">Donate Blood</a>
        <a href="bloodRequest.jsp">Request Blood</a>
        <a href="adminLogin.jsp">Admin Login</a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    <div>
        <h1>Donate Blood, Save Lives</h1>
        <p>Your one donation can save up to three lives</p>
    </div>
</div>

<!-- CONTENT -->
<div class="content">

<div class="ecg-wrapper">
    <svg class="ecg" viewBox="0 0 600 120">
        <path d="
            M0 60 
            L60 60 
            L80 20 
            L100 100 
            L120 60 
            L160 60 
            L180 30 
            L200 90 
            L220 60 
            L300 60 
            L320 40 
            L340 80 
            L360 60 
            L420 60 
            L440 20 
            L460 100 
            L480 60 
            L600 60
        "/>
    </svg>
</div>


    <h2>Why Donate Blood?</h2>
    <p>
        Blood donation is a vital service that helps hospitals save lives during
        emergencies, surgeries, accidents, and treatments. There is no substitute
        for human blood, and every donation counts.
    </p>

    <div class="cards">
        <div class="card">
            <i class="fa-solid fa-heart-pulse"></i>
            <h3>Save Lives</h3>
            <p>One blood donation can save up to three lives.</p>
        </div>

        <div class="card">
            <i class="fa-solid fa-hospital"></i>
            <h3>Support Hospitals</h3>
            <p>Blood is always required in hospitals for emergencies.</p>
        </div>

        <div class="card">
            <i class="fa-solid fa-hand-holding-heart"></i>
            <h3>Be a Hero</h3>
            <p>Your small act can make a big difference.</p>
        </div>
    </div>

    <div class="contact">
        <h2>Want to Donate Blood?</h2>
        <p>
            Please contact the Blood Bank Admin or visit our blood bank center.
          <br>
        <i class="fa-solid fa-phone phone-icon"></i>
        Contact: <b>+91-7385668580</b>
         <br>
        <i class="fa-solid fa-location-dot address-icon"></i>
        Address: <b>Your City Blood Bank Center</b>
    </p>
    </div>

</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>
</html>
