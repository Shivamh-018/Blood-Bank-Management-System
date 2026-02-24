<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Request Blood | Blood Bank</title>

<!-- Font Awesome -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    background:
      linear-gradient(135deg, rgba(183,28,28,0.9), rgba(13,71,161,0.9)),
      repeating-linear-gradient(
        45deg,
        rgba(255,255,255,0.04),
        rgba(255,255,255,0.04) 10px,
        transparent 10px,
        transparent 20px
      );
    min-height:100vh;
}

/* ===== HEADER ===== */
.header{
    position:sticky;
    top:0;
    z-index:1000;
    background:rgba(255,255,255,0.15);
    padding:14px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    backdrop-filter: blur(8px);
}

.logo{
    display:flex;
    align-items:center;
    color:white;
    font-size:22px;
    font-weight:700;
}

.logo i{
    margin-right:10px;
    font-size:26px;
    color:#ffebee;
}

.header-right a{
    color:white;
    text-decoration:none;
    margin-left:18px;
    font-weight:600;
    padding:8px 18px;
    border-radius:25px;
}

.header-right a:hover,
.header-right a.active{
    background:rgba(255,255,255,0.25);
}

/* ===== TITLE ===== */
.page-title{
    text-align:center;
    margin:40px 0 10px;
    color:white;
}

.page-title h1{
    font-size:36px;
}

.page-title p{
    opacity:0.9;
}

/* ===== MESSAGE ===== */
.msg{
    width:70%;
    margin:20px auto;
    padding:14px;
    border-radius:12px;
    font-weight:600;
    text-align:center;
}
.success{ background:#e8f5e9; color:#2e7d32; }
.error{ background:#fdecea; color:#c62828; }

/* ===== FORM SECTION ===== */
.form-section{
    display:flex;
    justify-content:center;
    padding:20px 15px 60px;
}

.form-card{
    background:#ffffff;
    padding:40px;
    width:100%;
    max-width:700px;
    border-radius:18px;
    box-shadow:0 12px 30px rgba(0,0,0,0.15);
    overflow:hidden;   /* 💡 extra safety */
}


/* ===== FORM ===== */
.form-card form{
    display:flex;
    flex-direction:column;
    gap:20px;
}

.input-group{
    position:relative;
    width:100%;
}

.input-group i{
    position:absolute;
    top:50%;
    left:16px;
    transform:translateY(-50%);
    color:#b71c1c;
    font-size:16px;
}

.input-group select{
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    cursor:pointer;
}


.input-group input,
.input-group select{
    width:100%;
    max-width:100%;
    padding:14px 16px 14px 48px;
    border:none;
    border-radius:30px;
    background:#f1f1f1;
    font-size:15px;
    outline:none;
}

}

.input-group input:focus,
.input-group select:focus{
    background:#fff;
    box-shadow:0 0 0 2px rgba(13,71,161,0.3);
}

/* ===== BUTTON ===== */
.button1{
    background:linear-gradient(90deg,#c62828,#e53935);
    color:white;
    padding:15px;
    border:none;
    border-radius:30px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
}

.button1:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

/* ===== ECG LINE ===== */
.ecg{
    margin-top:25px;
    height:60px;
}
.ecg,
.ecg-wrapper{
    width:100%;
    max-width:100%;
    overflow:hidden;
}


.ecg path{
    fill:none;
    stroke:#e53935;
    stroke-width:3;
    stroke-dasharray:1000;
    stroke-dashoffset:1000;
    animation:ecgMove 2.5s linear infinite;
}

@keyframes ecgMove{
    to{ stroke-dashoffset:0; }
}
*{
    box-sizing: border-box;
}


@media(max-width:600px){
    .form-card{
        padding:25px;
    }
}

/* ===== FOOTER ===== */
.footer{
    background:#263238;
    color:white;
    padding:16px;
    text-align:center;
    font-size:14px;
}
</style>
</head>

<body>

<!-- HEADER -->
<%@include file="header1.jsp" %>
<!-- TITLE -->
<div class="page-title">
    <h1><i class="fa-solid fa-hand-holding-medical"></i> Blood Request</h1>
    <p>Emergency medical request form – handled by professionals</p>
</div>

<!-- MESSAGE -->
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<div class="msg success">
    <i class="fa-solid fa-circle-check"></i>
    Blood request submitted successfully
</div>
<% } else if("invalid".equals(msg)){ %>
<div class="msg error">
    <i class="fa-solid fa-triangle-exclamation"></i>
    Something went wrong. Please try again
</div>
<% } %>

<!-- FORM -->
<div class="form-section">
    <div class="form-card">

        <form action="indexFormAction.jsp" method="post">

            <div class="input-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="name"
                       placeholder="Patient / Requester Name" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-phone"></i>
                <input type="text" name="mobilenumber"
                       placeholder="Mobile Number" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-envelope"></i>
                <input type="email" name="email"
                       placeholder="Email Address" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-droplet"></i>
                <select name="bloodgroup" required>
                    <option value="">Select Blood Group</option>
                    <option>A+</option><option>A-</option>
                    <option>B+</option><option>B-</option>
                    <option>AB+</option><option>AB-</option>
                    <option>O+</option><option>O-</option>
                </select>
            </div>

            <button class="button1">
                <i class="fa-solid fa-heart-pulse"></i>
                Submit Blood Request
            </button>

        </form>

        <!-- ECG -->
        
    </div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>
</html>
