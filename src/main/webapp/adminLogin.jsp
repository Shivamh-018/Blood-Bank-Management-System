<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login | Blood Bank</title>

<link rel="stylesheet" href="style.css" type="text/css">

<!-- Font Awesome -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    min-height:100vh;

    /* Medical gradient */
    background:
      linear-gradient(135deg,
        rgba(183,28,28,0.9),
        rgba(13,71,161,0.9)
      ),
      repeating-linear-gradient(
        45deg,
        rgba(255,255,255,0.05),
        rgba(255,255,255,0.05) 10px,
        transparent 10px,
        transparent 20px
      );
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

/* ===== MESSAGE ===== */
.msg{
    width:100%;
    text-align:center;
    margin-top:18px;
    font-size:17px;
    font-weight:600;
    color:#ffebee;
}

/* ===== LOGIN AREA ===== */
.login-container{
    display:flex;
    justify-content:center;
    align-items:center;
    height:80vh;
}

/* ===== LOGIN CARD ===== */
.login-card{
    background:rgba(255,255,255,0.97);
    width:400px;
    padding:42px 38px;
    border-radius:20px;
    box-shadow:0 25px 50px rgba(0,0,0,0.35);
    text-align:center;
    animation: slideUp 0.8s ease;
    border-top:6px solid #c62828; /* medical accent */
}

@keyframes slideUp{
    from{ transform:translateY(40px); opacity:0; }
    to{ transform:translateY(0); opacity:1; }
}

.login-card h2{
    color:#b71c1c;
    margin-bottom:8px;
}

.login-card p{
    color:#555;
    font-size:14px;
    margin-bottom:28px;
}

/* ===== INPUT GROUP ===== */
.input-group{
    position:relative;
    margin-bottom:20px;
}

.input-group i{
    position:absolute;
    top:50%;
    left:16px;
    transform:translateY(-50%);
    color:#b71c1c;
    font-size:16px;
}

.input-group input{
    width:100%;
    padding:14px 16px 14px 46px;
    border:none;
    border-radius:30px;
    background:#f1f1f1;
    font-size:15px;
    outline:none;
}

.input-group input:focus{
    background:#fff;
    box-shadow:0 0 0 2px rgba(13,71,161,0.3);
}

/* ===== BUTTON ===== */
.login-card button{
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

.login-card button:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(0,0,0,0.3);
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
 <%@include file="header1.jsp" %>

<!-- ERROR MESSAGE -->
<%
String msg=request.getParameter("msg");
if("invalid".equals(msg)){
%>
<div class="msg">
    <i class="fa-solid fa-triangle-exclamation"></i>
    Invalid Username or Password
</div>
<%
}
%>

<script>
setTimeout(()=>{
    const msg=document.querySelector('.msg');
    if(msg) msg.style.display='none';
},4000);
</script>


    <!-- NAV -->
  

<!-- LOGIN FORM -->
<div class="login-container">
    <div class="login-card">

        <h2><i class="fa-solid fa-user-shield"></i> Admin Login</h2>
        <p>Secure access for blood bank administrators</p>

        <form action="adminLoginAction.jsp" method="post">

            <div class="input-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="username" placeholder="Admin Username" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>
            
            <div style="margin-top:15px;">
    <a href="forgotPassword.jsp"
       style="color:#b71c1c; font-weight:600; text-decoration:none;">
       Forgot Password?
    </a>
</div>
            

            <button type="submit">
                <i class="fa-solid fa-right-to-bracket"></i> Login
            </button>

        </form>
    </div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>
</body>
</html>
