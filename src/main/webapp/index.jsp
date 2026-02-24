<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Blood Bank Management System</title>

<!-- Font Awesome -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    background:#f4f7fb;
}

/* ===== HEADER ===== */
.header{
    position:sticky;
    top:0;
    z-index:1000;
    background:linear-gradient(90deg,#b71c1c,#0d47a1);
    padding:14px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 12px rgba(0,0,0,0.3);
}

.logo{
    display:flex;
    align-items:center;
    color:white;
    font-size:22px;
    font-weight:600;
}

.logo i{
    margin-right:10px;
    font-size:26px;
}

.nav a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    font-weight:600;
    padding:8px 18px;
    border-radius:25px;
}

.nav a:hover{
    background:rgba(255,255,255,0.25);
}

/* ===== HERO ===== */
.hero{
    min-height:70vh;
    background:
      linear-gradient(rgba(0,0,0,0.55),rgba(0,0,0,0.55)),
      url("slide1.jpg") center/cover no-repeat;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    color:white;
}

.hero h1{
    font-size:48px;
    margin-bottom:10px;
}

.hero p{
    font-size:18px;
    margin-bottom:30px;
}

/* ===== BUTTON ===== */
.hero a{
    background:#e53935;
    color:white;
    padding:16px 30px;
    font-size:18px;
    border-radius:40px;
    text-decoration:none;
    font-weight:600;
    box-shadow:0 6px 18px rgba(0,0,0,0.3);
}

.hero a:hover{
    background:#b71c1c;
}

/* ===== INFO SECTION ===== */
.info{
    display:flex;
    justify-content:center;
    gap:30px;
    margin:60px auto;
    width:90%;
    max-width:1000px;
}

.card{
    background:white;
    padding:30px;
    width:300px;
    border-radius:16px;
    text-align:center;
    box-shadow:0 12px 25px rgba(0,0,0,0.12);
}

.card i{
    font-size:38px;
    color:#c62828;
    margin-bottom:15px;
}

.card h3{
    color:#0d47a1;
    margin-bottom:10px;
}

.card p{
    font-size:14px;
    color:#555;
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


/* ===== FOOTER ===== */
.footer{
    background:#263238;
    color:white;
    text-align:center;
    padding:16px;
    font-size:14px;
}
</style>
</head>

<body>

<!-- HEADER -->
<%@include file="header1.jsp" %>
<!-- HERO -->
<div class="hero">
    <div>
        <h1>Donate Blood, Save Lives</h1>
        <p>Trusted medical blood bank service for emergency needs</p>
        <a href="bloodRequest.jsp">
            <i class="fa-solid fa-hand-holding-medical"></i>
            Request Blood
        </a>
    </div>
</div>
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


<!-- INFO -->
<div class="info">
    <div class="card">
        <i class="fa-solid fa-hospital"></i>
        <h3>Hospital Managed</h3>
        <p>Verified blood stock maintained by medical professionals.</p>
    </div>

    <div class="card">
        <i class="fa-solid fa-heart-pulse"></i>
        <h3>Emergency Ready</h3>
        <p>Fast response system for urgent blood requirements.</p>
    </div>

    <div class="card">
        <i class="fa-solid fa-shield-heart"></i>
        <h3>Safe & Secure</h3>
        <p>All donor and patient data is handled securely.</p>
    </div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>
</body>
</html>
