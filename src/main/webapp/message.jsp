<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type"); // success or error
    String message = request.getParameter("message"); // dynamic message
    String redirect = request.getParameter("redirect"); // where to go after closing
    if (redirect == null || redirect.isEmpty()) {
        redirect = "login.jsp"; // default page
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Message</title>
    <style>
        :root {
            --primary: #000000;
            --secondary: #FFFFFF;
            --success: #28a745;
            --error: #dc3545;
            --shadow: 8px 8px 0px var(--primary);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Courier New', monospace;
        }

        body {
            background: rgba(0,0,0,0.4); /* semi-transparent bg */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .popup-container {
            max-width: 400px;
            width: 100%;
            padding: 30px 25px;
            border: 2px solid var(--primary);
            background-color: var(--secondary);
            box-shadow: var(--shadow);
            text-align: center;
            border-radius: 12px;
            position: relative;
            animation: popUp 0.3s ease-out;
        }

        @keyframes popUp {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .icon {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .icon.success { color: var(--success); }
        .icon.error { color: var(--error); }

        h2 {
            font-size: 20px;
            margin-bottom: 20px;
            color: var(--primary);
        }

        button {
            padding: 12px 20px;
            border: 2px solid var(--primary);
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            transition: all 0.3s;
            color: var(--secondary);
            border-radius: 8px;
        }

        .btn-success { background-color: var(--success); }
        .btn-error { background-color: var(--error); }

        button:hover {
            box-shadow: 4px 4px 0px var(--primary);
            transform: translate(-2px, -2px);
        }
    </style>

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/material-design-iconic-font@2.2.0/dist/css/material-design-iconic-font.min.css">
</head>
<body>
    <div class="popup-container">
        <% if ("success".equalsIgnoreCase(type)) { %>
            <i class="zmdi zmdi-check-circle icon success"></i>
        <% } else { %>
            <i class="zmdi zmdi-close-circle icon error"></i>
        <% } %>

        <h2><%= message %></h2>
        <button class="<%= "success".equalsIgnoreCase(type) ? "btn-success" : "btn-error" %>" 
                onclick="redirectNow()">OK</button>
    </div>

    <script>
        function redirectNow() {
            window.location.href = "<%= redirect %>";
        }
    </script>
</body>
</html>
