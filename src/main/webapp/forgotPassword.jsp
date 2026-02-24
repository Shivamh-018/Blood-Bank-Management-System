<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forgot Password | Blood Bank</title>

<!-- Font Awesome -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    min-height:100vh;
    background:
      linear-gradient(135deg,
        rgba(183,28,28,0.92),
        rgba(13,71,161,0.92)
      );
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

.header a{
    color:white;
    text-decoration:none;
    font-weight:600;
    padding:8px 18px;
    border-radius:25px;
}

.header a:hover{
    background:rgba(255,255,255,0.25);
}

/* ===== CENTER CARD ===== */
.container{
    display:flex;
    justify-content:center;
    align-items:center;
    height:80vh;
}

.card{
    background:rgba(255,255,255,0.97);
    width:420px;
    padding:42px;
    border-radius:22px;
    text-align:center;
    box-shadow:0 25px 55px rgba(0,0,0,0.4);
    animation:fadeUp 0.8s ease;
    border-top:6px solid #c62828;
}

@keyframes fadeUp{
    from{transform:translateY(40px); opacity:0;}
    to{transform:translateY(0); opacity:1;}
}

.card h2{
    color:#b71c1c;
    margin-bottom:10px;
}

.card p{
    color:#555;
    font-size:14px;
    margin-bottom:25px;
}

/* ===== MESSAGE ===== */
.success{
    background:#e8f5e9;
    color:#2e7d32;
    padding:10px;
    border-radius:10px;
    margin-bottom:15px;
    font-weight:600;
}

.error{
    background:#fdecea;
    color:#c62828;
    padding:10px;
    border-radius:10px;
    margin-bottom:15px;
    font-weight:600;
}

/* ===== INPUT ===== */
.input-group{
    width:100%;
    position:relative;
    overflow:hidden;
}

.input-group i{
    position:absolute;
    left:18px;
    top:50%;
    transform:translateY(-50%);
    color:#c62828;
    font-size:16px;
}

.input-group input{
    width:calc(100% - 10px);
    box-sizing:border-box;
    padding:14px 18px 14px 46px;
    border:none;
    border-radius:30px;
    background:#f1f1f1;
    font-size:15px;
}


.input-group input:focus{
    background:#fff;
    box-shadow:0 0 0 2px rgba(13,71,161,0.3);
}

/* ===== BUTTON ===== */
button{
    width:100%;
    background:linear-gradient(90deg,#c62828,#e53935);
    color:white;
    padding:14px;
    border:none;
    border-radius:30px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

/* ===== BACK LINK ===== */
.back{
    margin-top:18px;
}

.back a{
    color:#b71c1c;
    text-decoration:none;
    font-weight:600;
}

/* ===== ECG LINE ===== */
.ecg{
    margin-top:25px;
}
.ecg svg{
    width:100%;
    height:60px;
}
.ecg path{
    fill:none;
    stroke:#e53935;
    stroke-width:3;
    stroke-dasharray:800;
    stroke-dashoffset:800;
    animation:ecgMove 2.5s linear infinite;
}
@keyframes ecgMove{
    to{stroke-dashoffset:0;}
}

/* ===== FOOTER ===== */
.footer{
    background:#263238;
    color:white;
    text-align:center;
    padding:14px;
    font-size:14px;
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">
        <i class="fa-solid fa-droplet"></i>
        Blood Bank System
    </div>
    <a href="adminLogin.jsp">Admin Login</a>
</div>

<!-- CONTENT -->
<div class="container">
<div class="card">

    <h2><i class="fa-solid fa-key"></i> Forgot Password</h2>
    <p>Enter registered admin email to reset password</p>

    <%
    String msg=request.getParameter("msg");
    if("sent".equals(msg)){
    %>
        <div class="success">
            <i class="fa-solid fa-circle-check"></i>
            Reset link sent to your email
        </div>
    <%
    }else if("invalid".equals(msg)){
    %>
        <div class="error">
            <i class="fa-solid fa-circle-xmark"></i>
            Email not registered
        </div>
    <%
    }
    %>

    <form action="forgotPasswordAction.jsp" method="post">
        <div class="input-group">
    <i class="fa-solid fa-envelope"></i>
    <input type="email"
           name="email"
           placeholder="Admin Email Address"
           required>
</div>

        <button type="submit">
            <i class="fa-solid fa-paper-plane"></i>
            Send Reset Link
        </button>
    </form>

    <div class="back">
        <a href="adminLogin.jsp">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Login
        </a>
    </div>

    <!-- ECG -->
    <div class="ecg">
        <svg viewBox="0 0 500 60">
            <path d="
                M0 30 L50 30
                L70 10 L90 50
                L110 30 L160 30
                L180 15 L200 45
                L220 30 L300 30
                L320 10 L340 50
                L360 30 L500 30
            "/>
        </svg>
    </div>

</div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>
</html>
