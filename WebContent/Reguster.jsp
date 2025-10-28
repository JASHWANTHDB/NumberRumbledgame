<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
     <link rel="Stylesheet" href="style.css">   
     <link rel="icon" type="images" href="hello.png">
        
  
</head>
<body>


  <div class="registration-container">
  
    <h2>Create Account</h2>
<form action="" method="get">
      <input type="text" placeholder="Full Name" name="name" required />
      <input type="email" placeholder="Email"  name="email" required />
      <input type="password" placeholder="Password"  pattern="(?=.*[^a-zA-Z0-9\s]).+" max="6"name="password" required />
      <input type="password" placeholder="Confirm Password"  pattern="(?=.*[^a-zA-Z0-9\s]).+" max="6" name="confirmpass" required />
      <input type="submit" Value="Register"  name="sub"  style="Background-color:#00aaff;border-radius:5px;"><br>
    </form><form action="login.jsp"><button type ="submit" style="background-color:#00123f">LOGIN</button>
    </form>
    
</div>

<%
	String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmpass = request.getParameter("confirmpass");
    if (password != null && confirmpass != null) {
        if (password.equals(confirmpass)) {
            String url = "jdbc:mysql://localhost:3306/employees";
            String username = "root";
            String passwords = "Jashwanth#123";
            String sql = "INSERT INTO `customer`(`Name`,`Email`,`Password`,`Confirmpass`)VALUES(?,?,?,?);";
            String csql = "SELECT * FROM customer where email = (?);";

            Connection con = null;
           // Statement st = null;
            ResultSet rs = null;
            PreparedStatement pre  = null;
            PreparedStatement chepre  = null;
            

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, username, passwords);
              // st = con.createStatement();
                pre=con.prepareStatement(sql);
                chepre=con.prepareStatement(csql);
                chepre.setString(1,email);
                rs = chepre.executeQuery();
                if(rs.next()){
                	%>
                    <div class="message error" > Your <strong>ACCOUNT is Already </strong>exists </div>

                    <% 
                	
                }else{
                
                pre.setString(1,name);
                pre.setString(2,email);
                pre.setString(3,password);
                pre.setString(4,confirmpass);
                int re = pre.executeUpdate();
                if(re > 0){
                %>
                  <div class="message success">Your <strong>REGISTRED</strong> Successfully</div>
                <% 
                
                
       
                }else{
                 %>
                     <div class="message error"> Your <strong>REGISTRED</strong>failed Try again </div>

                     <% 
                }
                }
            } catch (Exception e) {
        %>
        <p style="color: blue;">Error: <%= e.getMessage() %></p>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        } else {
        	%>
            <div class="message error"> Your <strong>Password</strong> not match </div>

            <% 
        }
    }
    
   
%>


</body>
</html>
