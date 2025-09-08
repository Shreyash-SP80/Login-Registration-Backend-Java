<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unique Developer - Portfolio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Lato:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Lato', sans-serif;
            line-height: 1.6;
            color: #333;
            overflow-x: hidden;
        }
        
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
        }
        
        /* Navigation */
        .navbar {
            background-color: #2c3e50;
            padding: 1.5rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .navbar-brand {
            color: #fff;
            font-size: 1.75rem;
            text-decoration: none;
            font-weight: 700;
        }
        
        .navbar-nav {
            display: flex;
            list-style: none;
        }
        
        .nav-item {
            margin-left: 1.5rem;
        }
        
        .nav-link {
            color: #fff;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: background-color 0.3s;
            text-transform: uppercase;
            font-weight: 600;
        }
        
        .nav-link:hover {
            background-color: #1a252f;
        }
        
        .user-welcome {
            background-color: #e74c3c;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            color: white;
            font-weight: 600;
        }
        
        /* Masthead */
        .masthead {
            background-color: #1abc9c;
            color: white;
            padding: 10rem 0 6rem;
            text-align: center;
            margin-top: 76px;
        }
        
        .masthead-avatar {
            width: 240px;
            margin-bottom: 2rem;
        }
        
        .masthead-heading {
            font-size: 3rem;
            margin-bottom: 1.5rem;
        }
        
        .divider-custom {
            margin: 1.25rem 0 1.5rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .divider-custom-line {
            width: 100%;
            max-width: 7rem;
            height: 0.25rem;
            background-color: white;
            border-radius: 1rem;
        }
        
        .divider-custom-line:first-child {
            margin-right: 1rem;
        }
        
        .divider-custom-line:last-child {
            margin-left: 1rem;
        }
        
        .divider-custom-icon {
            color: white;
            font-size: 2rem;
        }
        
        .masthead-subheading {
            font-size: 1.5rem;
            font-weight: 400;
        }
        
        /* Portfolio Section */
        .portfolio-section {
            padding: 6rem 0;
        }
        
        .section-heading {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #2c3e50;
            text-transform: uppercase;
        }
        
        .divider-dark .divider-custom-line {
            background-color: #2c3e50;
        }
        
        .divider-dark .divider-custom-icon {
            color: #2c3e50;
        }
        
        .portfolio-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            width: 90%;
            max-width: 1200px;
            margin: 3rem auto 0;
        }
        
        .portfolio-item {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            position: relative;
            height: 250px;
        }
        
        .portfolio-item:hover {
            transform: translateY(-5px);
        }
        
        .portfolio-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .portfolio-item:hover img {
            transform: scale(1.1);
        }
        
        .portfolio-item-caption {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(26, 188, 156, 0.9);
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.3s;
        }
        
        .portfolio-item:hover .portfolio-item-caption {
            opacity: 1;
        }
        
        .portfolio-item-caption-content {
            color: white;
            font-size: 1.5rem;
        }
        
        /* About Section */
        .about-section {
            background-color: #1abc9c;
            color: white;
            padding: 6rem 0;
        }
        
        .about-content {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .about-text {
            flex: 1;
            min-width: 300px;
            padding: 1rem;
        }
        
        .about-text p {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
        }
        
        .download-btn {
            display: inline-block;
            padding: 1rem 2rem;
            background-color: transparent;
            border: 2px solid white;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s;
            margin-top: 1rem;
        }
        
        .download-btn:hover {
            background-color: white;
            color: #1abc9c;
        }
        
        /* Contact Section */
        .contact-section {
            padding: 6rem 0;
        }
        
        .contact-form {
            width: 90%;
            max-width: 800px;
            margin: 3rem auto 0;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        
        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }
        
        .submit-btn {
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .submit-btn:hover {
            background-color: #16a085;
        }
        
        /* Footer */
        .footer {
            background-color: #2c3e50;
            color: white;
            padding: 4rem 0 2rem;
            text-align: center;
        }
        
        .footer-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .footer-column {
            flex: 1;
            min-width: 250px;
            margin-bottom: 2rem;
            padding: 0 1rem;
        }
        
        .footer-heading {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .footer-social {
            display: flex;
            justify-content: center;
            list-style: none;
            margin-top: 1rem;
        }
        
        .footer-social li {
            margin: 0 0.5rem;
        }
        
        .footer-social a {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: white;
            color: #2c3e50;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .footer-social a:hover {
            background-color: #1abc9c;
            color: white;
        }
        
        .copyright {
            background-color: #1a252f;
            color: white;
            padding: 1.5rem 0;
            text-align: center;
            margin-top: 2rem;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar-container {
                flex-direction: column;
            }
            
            .navbar-nav {
                margin-top: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .nav-item {
                margin: 0.5rem;
            }
            
            .masthead {
                padding: 8rem 0 4rem;
                margin-top: 136px;
            }
            
            .masthead-heading {
                font-size: 2.2rem;
            }
            
            .section-heading {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
     <!-- Navigation -->
    <nav class="navbar">
        <div class="navbar-container">
            <a href="#page-top" class="navbar-brand">Shreyash Patil</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
                <li class="nav-item"><a class="nav-link user-welcome" href="Logout"><%= session.getAttribute("name") %></a></li>
            </ul>
        </div>
    </nav>

    <!-- Masthead -->
    <header class="masthead" id="page-top">
        <div class="container">
            <img class="masthead-avatar" src="https://ui-avatars.com/api/?name=Shreyash+Patil&size=240&background=0D8ABC&color=fff" alt="Shreyash Patil Avatar">
            <h1 class="masthead-heading">Welcome To Simple WebPage	</h1>
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                </div>
                <div class="divider-custom-line"></div>
            </div>
            <p class="masthead-subheading">Java Development - Web Development</p>
        </div>
    </header>

    <!-- Portfolio Section -->
    <section class="portfolio-section" id="portfolio">
        <h2 class="section-heading">Simple WebSite</h2>
        <div class="divider-custom divider-dark">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        
        <div class="portfolio-grid">
            <!-- (All your portfolio items remain unchanged) -->
        </div>
    </section>

    <!-- About Section -->
    <section class="about-section" id="about">
        <h2 class="section-heading">About</h2>
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        
        <div class="about-content">
            <div class="about-text">
                <p>Hello! I'm <b>Shreyash Patil</b>, a passionate full-stack developer with expertise in Java, JSP, Servlets, and Oracle SQL. I love creating efficient, scalable web applications that solve real-world problems.</p>
                <p>With hands-on experience in software development, I've worked on projects ranging from enterprise applications to personal portfolio websites.</p>
            </div>
            <div class="about-text">
                <p>I'm constantly learning new technologies and improving my skills. My goal is to deliver high-quality software that meets client requirements and provides an excellent user experience.</p>
                <p>When I'm not coding, you can find me exploring new technologies, contributing to open-source projects, or learning advanced concepts in data science and AI.</p>
                <a href="Shreyash_Patil_Resume.pdf" class="download-btn" download>
                    <i class="fas fa-download me-2"></i> Download Resume
                </a>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact-section" id="contact">
        <h2 class="section-heading">Contact Me</h2>
        <div class="divider-custom divider-dark">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        
        <form class="contact-form">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" class="form-control" value="Shreyash Patil" readonly>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" class="form-control" value="shreyashpatil.dev@example.com" readonly>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" class="form-control" value="+91 98765 43210" readonly>
            </div>
            
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" class="form-control" placeholder="Enter your message here..."></textarea>
            </div>
            
            <button type="submit" class="submit-btn">Send Message</button>
        </form>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <h3 class="footer-heading">Location</h3>
                <p>Solapur, Maharashtra<br>India - 411001</p>
            </div>
            
            <div class="footer-column">
                <h3 class="footer-heading">Around the Web</h3>
                <ul class="footer-social">
                    <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="https://twitter.com/ShreyashPatil80" target="_blank"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="https://www.linkedin.com/in/shreyash-patil-sp7213" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                    <li><a href="https://github.com/Shreyash-SP80" target="_blank"><i class="fab fa-github"></i></a></li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h3 class="footer-heading">About Me</h3>
                <p>I am dedicated to creating innovative web solutions using cutting-edge technologies. My focus is on clean code, scalability, and user-friendly design.</p>
            </div>
        </div>
    </footer>
    
    <div class="copyright">
        <div class="container">
            <small>Copyright &copy; Shreyash Patil 2025</small>
        </div>
    </div>

    <script>
        // Simple form validation
        document.addEventListener('DOMContentLoaded', function() {
            const contactForm = document.querySelector('.contact-form');
            
            if (contactForm) {
                contactForm.addEventListener('submit', function(e) {
                    e.preventDefault();
                    
                    const name = document.getElementById('name').value;
                    const email = document.getElementById('email').value;
                    const message = document.getElementById('message').value;
                    
                    if (!name || !email || !message) {
                        alert('Please fill in all required fields');
                        return;
                    }
                    
                    alert('Thank you for your message! I will get back to you soon.');
                    contactForm.reset();
                });
            }
            
            // Smooth scrolling for navigation links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    const targetId = this.getAttribute('href');
                    if (targetId === '#') return;
                    
                    const targetElement = document.querySelector(targetId);
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 80,
                            behavior: 'smooth'
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>