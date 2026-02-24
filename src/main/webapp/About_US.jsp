<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About Us | Blood Bank Management System</title>

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

/* ===== PAGE HEADER ===== */
.about-hero{
    background:
      linear-gradient(rgba(0,0,0,0.55),rgba(0,0,0,0.55)),
      url("slide1.jpg") center/cover no-repeat;
    color:white;
    text-align:center;
    padding:80px 20px;
}

.about-hero h1{
    font-size:42px;
    margin-bottom:10px;
}

.about-hero p{
    font-size:18px;
    max-width:800px;
    margin:auto;
}

/* ===== CONTENT ===== */
.about-container{
    width:90%;
    max-width:1100px;
    margin:60px auto;
}

/* Sections */
.about-section{
    display:flex;
    gap:40px;
    margin-bottom:60px;
    align-items:center;
}

.about-section.reverse{
    flex-direction:row-reverse;
}

.about-text{
    flex:1;
}

.about-text h2{
    color:#b71c1c;
    margin-bottom:15px;
}

.about-text p{
    color:#555;
    line-height:1.7;
    font-size:15px;
}

/* Icons row */
.about-features{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;
    margin-top:40px;
}

.feature-card{
    background:white;
    padding:30px;
    border-radius:16px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.12);
}

.feature-card i{
    font-size:40px;
    color:#c62828;
    margin-bottom:15px;
}

.feature-card h3{
    color:#0d47a1;
    margin-bottom:10px;
}

.feature-card p{
    font-size:14px;
    color:#555;
}

/* ===== RESPONSIVE ===== */
@media(max-width:900px){
    .about-section,
    .about-section.reverse{
        flex-direction:column;
        text-align:center;
    }
}
</style>
</head>

<body>

<%@ include file="header1.jsp" %>

<!-- HERO -->
<div class="about-hero">
    <h1>About Our Blood Bank</h1>
    <p>
        A trusted medical platform connecting blood donors, patients,
        and hospitals with speed, safety, and transparency.
    </p>
</div>

<!-- CONTENT -->
<div class="about-container">

    <div class="about-section">
        <div class="about-text">
            <h2>Who We Are</h2>
            <p>
                The <strong>Blood Bank Management System</strong> is designed to
                digitally manage blood donations, stock availability, and
                emergency blood requests.
                Our goal is to save lives by ensuring the right blood reaches
                the right patient at the right time.
            </p>
        </div>
    </div>

    <div class="about-section reverse">
        <div class="about-text">
            <h2>Our Mission</h2>
            <p>
                To create a reliable and secure blood management platform
                that helps hospitals and blood banks operate efficiently,
                reduce manual errors, and respond quickly during emergencies.
            </p>
        </div>
    </div>

    <!-- FEATURES -->
    <div class="about-features">

        <div class="feature-card">
            <i class="fa-solid fa-hospital"></i>
            <h3>Hospital Managed</h3>
            <p>All blood stock and requests are managed by authorized admins.</p>
        </div>

        <div class="feature-card">
            <i class="fa-solid fa-heart-pulse"></i>
            <h3>Emergency Ready</h3>
            <p>Quick response system for urgent blood requirements.</p>
        </div>

        <div class="feature-card">
            <i class="fa-solid fa-shield-heart"></i>
            <h3>Safe & Secure</h3>
            <p>Donor and patient data is protected with secure access.</p>
        </div>

        <div class="feature-card">
            <i class="fa-solid fa-droplet"></i>
            <h3>Life Saving</h3>
            <p>Every donation helps save multiple lives.</p>
        </div>

    </div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
