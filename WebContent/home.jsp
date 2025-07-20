
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Dynamic Web Page with Menu  Animations</title>
   <link rel="Stylesheet" href="Indexs.css">
  <script>
  function handle(event) {
    event.preventDefault(); // Prevents the link from navigating
    alert("Login to open this Page");
  }
</script>
</head>
<body>
  <nav>
    <ul>
      <li><a href="#home" >Home</a></li>
      <li><a href="#about" >About</a></li>
      <li><a href="#services" >Services</a></li>
      <li><a href="#contact" >Contact</a></li>
      <li><a href="#contact" >Profile</a></li>
    </ul>
  </nav>

  <section style="" class="hero" id="home">
    <h1>Welcome</h1>
  </section>

  <div class="container">
    <section id="about" class="card" >
      <h2>About Us</h2>
      <p>We provide top-notch solutions to bring your ideas to life. Our team of experts is dedicated to delivering high-quality products.</p>
    </section>
    <section id="services" class="card" >
      <h2>Our Services</h2>
      <p>From web development to digital marketing, we offer a full suite of services to help your business grow.</p>
    </section>
    <section id="contact" class="card">
      <h2>Contact Us</h2>
      <p>Get in touch via email at <a href="mailto:info@example.com">info@example.com</a> or call us at (123) 456-7890.</p>
    </section>
  </div>

  <footer>
    &copy; 2025 Your Company. All Rights Reserved.
  </footer>
</body>
</html>
    
    