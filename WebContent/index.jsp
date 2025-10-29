<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>NumberRumbledGame</title>
  <link rel="icon" type="images" href="hello.png">
    <link rel="Stylesheet" href="Indexs.css">
 
  <script>
  function handle() {
    //event.preventDefault(); // Prevents the link from navigating
    alert("Login to open this Page");
  }
</script>
</head>
<body>
<div>
  <nav>
    <ul>
      <li><a href="#home" >Home</a></li>
      <li><a href="#about" onclick="handle()">About</a></li>
      <li><a href="#services" onclick="handle()">Services</a></li>
      <li><a href="#contact" onclick="handle()">Contact</a></li>     <li></li><li></li><li></li>
      <li><form action="login.jsp"><button type ="submit" class="button" style="background-color:#00123f">LOGIN</button>
      </form></li><li><form action="Reguster.jsp">
      <button type ="submit" class="button" >REGISTER</button>
       </form></li>
    </ul>
  </nav>
</div>

  <section class="hero" id="home">
    <h1>Welcome</h1>
  </section>

  <div class="container">
    <section id="about" class="card" onclick="handle(event)">
      <h2>About Us</h2>
      <p>We provide top-notch solutions to bring your ideas to life. Our team of experts is dedicated to delivering high-quality products.</p>
    </section>
    <section id="services" class="card" onclick="handle(event)">
      <h2>Our Services</h2>
      <p>From web development to digital marketing, we offer a full suite of services to help your business grow.</p>
    </section>
    <section id="contact" class="card" onclick="handle(event)">
      <h2>Contact Us</h2>
      <p>Get in touch via email at <a href="mailto:info@example.com">info@example.com</a> or call us at (123) 456-7890.</p>
    </section>
  </div>

  <footer>
    &copy; 2025 Your Company. All Rights Reserved.
  </footer>
</body>
</html>