<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
       :root {
		  --primary: #000000;
		  --secondary: #FFFFFF;
		  --accent: #FF5E5B;
		  --shadow: 6px 6px 0px var(--primary);
		}
		* {margin:0;padding:0;box-sizing:border-box;font-family:'Courier New', monospace;}
		body {background-color:var(--secondary);display:flex;justify-content:center;align-items:center;min-height:100vh;padding:10px;}
		.register-container {
		    width:100%;
		    max-width:420px;   /* reduced from 500px */
		    border:1px solid var(--primary);
		    padding:25px 20px; /* reduced padding */
		    background:var(--secondary);
		    box-shadow:var(--shadow);
		    position:relative;
		    border-radius:10px;
		}
		.register-container::before {
		    content:'';position:absolute;top:5px;left:5px;right:-5px;bottom:-5px;
		    border:1px solid var(--primary);z-index:-1;border-radius:10px;
		}
		h1 {
		    color:var(--primary);
		    margin-bottom:20px; /* smaller spacing */
		    font-size:22px;     /* reduced from 28px */
		    font-weight:700;
		    text-align:center;
		}
		.input-group {margin-bottom:15px;} /* reduced spacing */
		label {
		    display:block;
		    margin-bottom:5px; /* reduced */
		    font-weight:bold;
		    color:var(--primary);
		    font-size:14px;    /* slightly smaller */
		}
		input {
		    width:100%;
		    padding:10px 12px; /* smaller input height */
		    border:2px solid var(--primary);
		    background:var(--secondary);
		    font-size:14px;
		    outline:none;
		    transition:all 0.3s;
		}
		input:focus {box-shadow:3px 3px 0px var(--primary);}
		button {
		    width:100%;
		    padding:10px;       /* reduced height */
		    background:var(--accent);
		    color:var(--secondary);
		    border:2px solid var(--primary);
		    font-size:15px;     /* smaller text */
		    font-weight:bold;
		    cursor:pointer;
		    margin-top:5px;
		    transition:all 0.3s;
		}
		button:hover {box-shadow:3px 3px 0px var(--primary);transform:translate(-2px,-2px);}
		.footer {text-align:center;margin-top:12px;color:var(--primary);font-size:14px;}
		.footer a {color:var(--primary);font-weight:bold;text-decoration:underline;}
    </style>
</head>
<body>
    <div class="register-container">
        <h1>REGISTER</h1>
        <form action="Regester" method="post" onsubmit="return validateRegister()">
            <div class="input-group">
                <label for="fullname">NAME</label>
                <input type="text" id="fullname" name="name" placeholder="Enter name" required>
            </div>
            <div class="input-group">
                <label for="email">EMAIL</label>
                <input type="email" id="regEmail" name="email" placeholder="your@email.com" required>
            </div>
            <div class="input-group">
                <label for="mobile">MOBILE</label>
                <input type="text" id="mobile" name="mobile" placeholder="10-digit mobile" required>
            </div>
            <div class="input-group">
                <label for="password">PASSWORD</label>
                <input type="password" id="regPassword" name="password" placeholder="••••••••" required>
            </div>
            <div class="input-group">
                <label for="confirmPassword">CONFIRM PASSWORD</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="••••••••" required>
            </div>
            <button type="submit">SIGN UP</button>
        </form>
        <div class="footer">
            Already have an account? <a href="login.jsp">Sign in</a>
        </div>
    </div>

    <script>
        function validateRegister() {
            const fullname = document.getElementById("fullname").value.trim();
            const email = document.getElementById("regEmail").value.trim();
            const mobile = document.getElementById("mobile").value.trim();
            const password = document.getElementById("regPassword").value.trim();
            const confirmPassword = document.getElementById("confirmPassword").value.trim();

            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            const mobilePattern = /^[0-9]{10}$/;

            if (fullname.length < 3) {
                alert("Full Name must be at least 3 characters.");
                return false;
            }
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }
            if (!mobilePattern.test(mobile)) {
                alert("Mobile number must be exactly 10 digits.");
                return false;
            }
            if (password.length < 6) {
                alert("Password must be at least 6 characters.");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
