<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="style.css">   
    <link rel="icon" type="image/png" href="hello.png">
</head>
<body>

<div class="registration-container">
    <h2>Create Account</h2>
    
    <form action="" method="post">
        <input type="text" placeholder="Full Name" name="name" required />
        <input type="email" placeholder="Email" name="email" required />
        
        <!-- Fixed password pattern & length -->
        <input type="password" placeholder="Password" 
               pattern="(?=.*[!@#$%^&*]).{6,}" 
               title="Must contain at least one special character and be 6+ characters long"
               name="password" required />
               
        <input type="password" placeholder="Confirm Password"
               pattern="(?=.*[!@#$%^&*]).{6,}"
               name="confirmpass" required />
               
        <input type="submit" value="Register" name="sub" 
               style="background-color:#00aaff; border-radius:5px;">
    </form>

    <form action="login.jsp">
        <button type="submit" style="background-color:#00123f">LOGIN</button>
    </form>
</div>

<%
    // --- Fetch form data ---
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmpass = request.getParameter("confirmpass");

    if (name != null && email != null && password != null && confirmpass != null) {
        if (password.equals(confirmpass)) {

            String url = "jdbc:mysql://localhost:3306/employees";
            String dbUser = "root";
            String dbPass = "Jashwanth#123";

            Connection con = null;
            PreparedStatement pre = null;
            PreparedStatement checkPre = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, dbUser, dbPass);

                // Check if email already exists
                String checkSql = "SELECT * FROM customer WHERE Email = ?";
                checkPre = con.prepareStatement(checkSql);
                checkPre.setString(1, email);
                rs = checkPre.executeQuery();

                if (rs.next()) {
%>
                    <div class="message error">Your <strong>ACCOUNT</strong> already exists!</div>
<%
                } else {
                    // Insert new record
                    String insertSql = "INSERT INTO customer (Name, Email, Password, Confirmpass) VALUES (?, ?, ?, ?)";
                    pre = con.prepareStatement(insertSql);
                    pre.setString(1, name);
                    pre.setString(2, email);
                    pre.setString(3, password);
                    pre.setString(4, confirmpass);

                    int result = pre.executeUpdate();

                    if (result > 0) {
%>
                        <div class="message success">
                            Registration <strong>successful!</strong> You will be redirected to the login page in <strong>3 seconds...</strong>
                        </div>
                        <script>
                            // Redirect after 3 seconds
                            setTimeout(function() {
                                window.location.href = "login.jsp";
                            }, 3000);
                        </script>
<%
                    } else {
%>
                        <div class="message error">Registration <strong>failed</strong>. Try again!</div>
<%
                    }
                }

            } catch (Exception e) {
%>
                <p style="color: blue;">Error: <%= e.getMessage() %></p>
<%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (checkPre != null) checkPre.close(); } catch (Exception e) {}
                try { if (pre != null) pre.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }

        } else {
%>
            <div class="message error"><strong>Passwords</strong> do not match!</div>
<%
        }
    }
%>

</body>
</html>
