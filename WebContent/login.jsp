<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer login</title>
    <link rel="icon" type="images" href="hello.png">
    <link rel="Stylesheet" href="regis.css">

</head>
<body>
<div>
<section class="hero" id="home">
    <h1>Welcome</h1>
  </section>


  <img src="back.jfif" width="500px" height="300px">
  <h1>Company Discription</h1>
  <br>
  <p>A tech company's description might include information about their <br>innovative software solutions,  <br>their commitment to customer satisfaction, their 
  history of developing cutting-edge<br> technology, and the expertise of their management team. 
 </p>
  <div class="registration-container">
  
    <h2>Login to your account</h2>
<form action="" method="get" autocomplete="off">
      
      <input type="email" placeholder="Email"  name="email" required />
      <input type="password" placeholder="Password"  name="password" required />
      
      <input type="submit" Value="LOGIN" name="sub" style="Background-color:#00aaff"><br>
    </form>
    
</div>


<%
	
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    if (password != null) {
            String url = "jdbc:mysql://localhost:3306/employees";
            String username = "root";
            String passwords = "Jashwanth#123";
            
            String csql = "SELECT * FROM customer where email = (?) and password=(?);";

            Connection con = null;
           // Statement st = null;
            ResultSet rs = null;
           
            PreparedStatement chepre  = null;
            

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, username, passwords);
              // st = con.createStatement();
                
                chepre = con.prepareStatement(csql);
				chepre.setString(1, email);
				chepre.setString(2, password);
			    rs = chepre.executeQuery();
			    if (rs.next()) {
			       
			        if (password.equals(rs.getString("Password"))) {
			            response.sendRedirect("home.html");
			        } else {
			            %>
			            <div class="message error"> Your <strong>password is incorrect</strong>. Please try again.</div>
			           <%
                	}
                }else{
                	%>
                    <div class="message error">  <strong>Account not exists or password is incorrect</strong>  </div>
                    <% 
                   
                    //response.sendRedirect("index.jsp") ;
                	
                }
            } catch (Exception e) {
        %>
        <p style="color: blue;">Error: <%= e.getMessage() %></p>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
                try { if (chepre != null) chepre.close(); } catch (Exception e) {}
            }
        } 
    
   
%>
 </div>

</body>
</html>
