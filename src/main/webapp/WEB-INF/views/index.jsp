<%@page import="com.spring.Modal.AddMenuItem"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Food hub</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/index.css"/>'>
    <link rel="stylesheet"  href='<c:url value="/resource/css/mediaindex.css"/>'>
<link href="https://fonts.googleapis.com/css2?family=Merienda&display=swap"rel="stylesheet">
  </head>
  <body>
  <%  
 		String t=(String)request.getParameter("t");
  		String t2=(String)request.getAttribute("t");
  		
  
  if(t!=null)
  {
      if(t.equals("0"))
      {  
      
  %>
  		<script>
            alert("Your query is accepted successfully our executive resolve your query within 48 hours.For more details check your email");
        </script>
        
         <%}   else if(t.equals("1")) {  %>  
      <script>
            alert("User Register Successfully.Check your registered mail for details ");
       </script>
       <%}   else if(t.equals("2")) {  %>  
      <script>
            alert("Profile deleted Successfully.");
       </script>
       
       
       <%}}
  if(t2!=null)
       		{
	  if(t2.equals("2"))
			{  %>  
      <script>
            alert("Sorry Invalid ID Password ");
       </script>
        <%}
	  else if(t2.equals("3")) 
	  {  %>  
      <script>
            alert("Successfully Logout");
       </script> 
  
         
       
  <% }}%>  

<!--Navbar Starts  -->
    <div class="container-fluid home text-center " id="home" style="background-image:url('<c:url value="/resource/images/food4.jpeg"/>');"> 
        <nav class="navbar navbar-expand-lg bg-tranparent navbar-dark  ">
          <div class="one container-fluid w-75 " >
              <a class="navbar-brand logo" href="#" >
                  <img src='<c:url value="/resource/images/logo.png"/>' width="50%" height="50%" class="d-inline-block align-text-top">
                 </a>   


                 <div class="nav container-fluid "> 
                
                  <a id="a" data-bs-toggle="modal" data-bs-target="#loginModal" >
                    <span><i class='bx bxs-user-circle' ></i></span> </a>
               
              </div>
              
              
              
              
            <button class="navbar-toggler icon" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button></div>
            <div class="collapse navbar-collapse mx-5 p-2" id="navbarSupportedContent">
              <ul class="navbar-nav me-5 mb-2 mb-lg-0">
                  <li class="nav-item ">
                      <a class="nav-link active " aria-current="page" href="#home">Home</a>
                    </li>
                <li class="nav-item">
                  <a class="nav-link " style="color:white ;" aria-current="page" href="#about">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" style="color:white ;" href="#menu">Menu</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link " style="color:white ;" href="#reservation" >Reservation
                  </a>
                  
                </li>
                <li class="nav-item">
                  <a class="nav-link "  style="color:white ; "href="#contact">Contact</a>
                </li>
              </ul>
              
              
          
          </nav> 
      <!--Navbar Ends  -->
      
      
       <!-- Login Modal Starts Here -->
       <div class="modal fade" id="loginModal"  tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header  border-bottom-0">
              
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="form-title text-center">
                <h4><b>Login</b></h4>
              </div>
              <div class="d-flex flex-column text-center">
              
                <form action="UserLogin" method="post">
                
                  <div class="form-group ">
                    <input type="text" class="form-control" id="email1"placeholder=" Enter Your Foodie Bandhu User ID" name="email" style="text-transform: uppercase;">
                  </div>
                  
                  <div class="form-group ">
                    <input type="password" class="form-control" id="password1" placeholder="Your password..." name="password">
                  </div>
                  <button type="submit" class="btn  btn-block logbtn btn-round">Login</button>
                </form>
                
                
            </div>
          
            </div>
            <div class="modal-footer">
            <div class="forget-section " style="font-size: small;">Not remember your password ? <a data-bs-toggle="modal" data-bs-target="#ForgetPwModal" style="color: navy;text-decoration: none;font-size:small;cursor:pointer;  "> Forget Pw </a>.</div>
              <div class="signup-section  " style="font-size: small;  ">Not a member yet? <a href="/Foodie_Bandhu/regis" class="" style="color: navy;text-decoration: none;font-size: small;"> Sign Up</a>.</div>
              
            </div>
          </div>
        </div>
      </div>
      <!-- Login Modal Starts Ends here -->
      
<!-- Forget Password  Modal Starts Here -->
<div class="modal fade" id="ForgetPwModal"  tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header  border-bottom-0">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4><b>Forget Password</b></h4>
          <span style="font-size: small;">Enter your Foodie Bandhu ID</span>
        </div>
        <div class="d-flex flex-column text-center">
          <form action="forgetpwAction" method="post" >
            <div class="form-group ">
           
              <input type="text" class="form-control" id="email1" name="uid" placeholder="Your Foodie Bandhu ID..." required style="text-transform:uppercase;  ">
            </div>
            
            <button type="submit" class="btn  btn-block logbtn btn-round"  >Send Mail</button>
          </form>
          
          
      </div>
    
      </div>
      
    </div>
  </div>
</div>
<!-- Forget Password Modal Starts Ends here -->









<!--OTP model Starts here  -->
<button id="otp" hidden data-bs-toggle="modal" data-bs-target="#otpModal" >otp</button>
<button id="otpPw" hidden data-bs-toggle="modal" data-bs-target="#updatePw" >fpw</button>



<div class="modal fade" id="otpModal"  tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header  border-bottom-0">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4><b>OTP</b></h4>
          <span style="font-size: small;">Enter OTP which is send to your id. </span>
        </div>
        <div class="d-flex flex-column text-center">
          <form action="otpMatch" method="post">
            <div class="form-group ">
              <input type="text" class="form-control" id="otp" name="otp" placeholder="Enter otp here..." required>
            </div>
            
            <button type="submit" class="btn  btn-block logbtn btn-round">Confirm OTP</button>
          </form>
          
          
      </div>
    
      </div>
      
    </div>
  </div>
</div>
<!--OTP model ends here  -->
<!--Update PW  starts here-->

<div class="modal fade" id="updatePw"  tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header  border-bottom-0">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-start">
        <div class="form-title text-center">
          <h4><b>Password Reset</b></h4>
          <span style="font-size: small;">Reset Your Password Here. </span>
        </div>
        <div class="d-flex flex-column text-left">
          <form class="px-auto text-start " action="updPW" method="post" >
           

                                  
                  
                  <div class="row mb-3"  >
                    <div class="col-lg-12 ">
                        <label for="pw" class="text-start">Enter Your New Password</label>
                      <input type="password" class="form-control" id="pw" name="pw" placeholder="***********" required onkeyup="Passvalid()">
                    	<div class="invalid-feedback">
        					Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters 	 
      					</div>
      					<div class="valid-feedback">
        					Looks Good	 
      					</div>
                    </div>
                    <div class="col-lg-12 ">
                        <label for="cpw">Confirm Password</label>
                      <input type="password" class="form-control" id="cpw" name="cpw" placeholder="**********" required onkeyup="Cpassvalid()"  >
                    	<div class="invalid-feedback">
        					Not Matched 	 
      					</div>
      					<div class="valid-feedback">
        					Matched	 
      					</div>
                    
                    </div>
                  </div>
                 <button type="submit" class="btn btn-warning ">Submit</button>
              </form>
      
          
      </div>
    
      </div>
      
    </div>
  </div>
</div>



<!-- Update pw ends here -->



















       <!--Home starts  -->
       <div class="containter text-center home2"  style="color: white;">
       <h1 style="font-family: 'Lobster', cursive;
        ">Discover</h1><h1>Foodie Bandhu </h1>
      <span ><img  src='<c:url value="/resource/images/4.png"/>' alt="" style="width:20% ;"  ></span>
      <h5>OPENING HOURS</h5>
      <H6>MONDAY-FRIDAY- 8:00 AM 23:00 PM</H6>
      <H6>WEEKENDS- 8:00 AM 2:00 PM</H6>
      </div>
      </div>
<!-- Home Ends -->
<!-- About starts -->
<div class="container-fluid sec" id="about" style="background-image: url('<c:url value="/resource/images/sec.jpg"/>');">    
  <div class="row align-items-center ">
    <div class="col-4 mt-5 masale" >
      <img src='<c:url value="/resource/images/masale.png"/>' alt=""></div>
    <div class="love mt-5 col-4 " style="background-image:url('<c:url value="/resource/images/frame.jpg"/>');">
      <h3>OUR STORY</h3>
      <h1 class="text-center">LOVE FOR FOOD</h1>
      <span><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deserunt maiores, officiis repudiandae voluptatem excepturi rem alias ratione illo enim eius aspernatur neque officia repellendus hic ab earum iste. Odio, maiores.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis laborum quae et officiis hic natus rerum eos optio voluptas facilis, perferendis vel ut, odit beatae. Consequatur sint fugit eaque ipsam?</p></span>
    
    </div>
    <div class="col-4 mt-5 masale">
      <img src='<c:url value="/resource/images/masale.png"/>' alt="">
    </div>
  </div>
</div>
<!--About ends  -->

<!-- Menu Starts -->
<div class="container mt-5" id="menu" style="width: 100%;">   
  <div class="row menu">
   <div class="col-6 nimg ">
      <div class="row">
        <div class="col-6 "><img  src='<c:url value="/resource/images/sus.jpg"/>' alt="" ></div>
      <div class="col-6 "><img    src='<c:url value="/resource/images/brd.jpg"/>' alt="" ></div></div>
      <div class="row">
        <div class="col-6 "><img  src='<c:url value="/resource/images/spn.jpg"/>' alt="" ></div>
      <div class="col-6 "><img  src='<c:url value="/resource/images/kwb.jpg"/>' alt="" ></div></div>
    </div>






    <div class="col-md-6  col-sm-12 menu2">
      <h3>From the menu</h3>
      
      <h2 class="text-center"><b>SPECIAL OFFERS</b></h2>
      <ul class="list-group list-group-flush mx-5" >
      <%
		List<AddMenuItem> l = (List) request.getAttribute("menuList");
			if (l != null) {
			int id;
			int counter=0;
			for (AddMenuItem i : l) 
			
			{
				counter++;
				if(counter==7)
				{
					break;
				}
	 %>
      
      
      
      
      
      
        <li class="list-group-item d-flex justify-content-between align-items-start list-group-item-action Burger">
          <div class="ms-2 me-auto">
            <div class="fw-bold" data-bs-toggle="modal" data-bs-target="#loginModal"style="cursor: pointer; "><%out.print(i.getDishName()); %></div>
            <%out.print("For "+i.getQty()+" People"); %>
          </div>
          <span class=""><%out.print(i.getPrice()+" INR"); %></span>
        </li>
     <% }}%>   
      
      </ul>
   </div>
  </div>     
</div>
<!-- Menu Ends here -->


<!-- Carousel Starts here -->
<div class="container mt-5 mb-5" id="reservation" style="width: 100%;">
  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    
    
    <div class="carousel-inner">
      
      <div class="carousel-item active">
        <div class="container">
          <div class="row">
            <div class="col-6 cimg">
              <img src='<c:url value="/resource/images/burger2.jpg"/>' class="d-block w-100 " alt="..." style="height: 500px;"></div>
            <div class="col-6 ctext">
              <h1 class="text-center mt-5">Catering</h1>
              <h1 class="text-center ">SPECIAL EVENTS</h1>
              <h2 class="text-center" style="color: rgb(213, 213, 52);">____<span class="dot"></span>____</h2>
              <ul class="catering-ul text-center">
                <span class="dot"></span>
                <li>Birthdays</li>
                <span class="dot"></span>
                <li>Conference</li>
                <span class="dot"></span>
                <li>Wedding </li>
              </ul>
              <span><p class="text-center">
                Whether you are celebrating your birthday have a family reunion or
                 something else ,we'll make it enjoying and memorable. Our experts
                 have years of experience in party planning and will make sure it is a
                 delicious success, enjoying and memorable for you  and your guests!
                                  Time to put your party hat on!
              </p></span>
              <a  data-bs-toggle="modal" data-bs-target="#loginModal"><h5 class="text-center"style="cursor: pointer;color:navy ">MORE DETAILS</h5></a>
              
            </div>
          </div>
        </div>          
        </div>





      <div class="carousel-item">
        <div class="container">
          <div class="row">
            <div class="col-6 cimg">
              <img src='<c:url value="/resource/images/salad2.jpg"/>' class="d-block w-100 " alt="..." style="height: 500px;"></div>
            <div class="col-6 ctext"><h1 class="text-center mt-5">Catering</h1>
              <h1 class="text-center ">SPECIAL EVENTS</h1>
              <h2 class="text-center" style="color: rgb(213, 213, 52);">____<span class="dot"></span>____</h2>
              <ul class="catering-ul text-center">
                <span class="dot"></span>
                <li>Birthdays</li>
                <span class="dot"></span>
                <li>Conference</li>
                <span class="dot"></span>
                <li>Wedding </li>
              </ul>
              <span><p class="text-center">
                Whether you are celebrating your birthday have a family reunion or
                 something else ,we'll make it enjoying and memorable. Our experts
                 have years of experience in party planning and will make sure it is a
                 delicious success, enjoying and memorable for you  and your guests!
                                  Time to put your party hat on!
              </p></span>
              <a data-bs-toggle="modal" data-bs-target="#loginModal"><h5 class="text-center" style="cursor: pointer;color:navy">MORE DETAILS </h5></a>
              </div>
          </div>
        </div>          
      </div>




      <div class="carousel-item">
        <div class="container">
          <div class="row">
            <div class="col-6 cimg">
              <img src='<c:url value="/resource/images/sand.jpg"/>' class="d-block w-100 " alt="..." style="height: 500px;"></div>
            <div class="col-6 ctext"><h1 class="text-center mt-5">Catering</h1>
              <h1 class="text-center ">SPECIAL EVENTS</h1>
              <h2 class="text-center" style="color: rgb(213, 213, 52);">____<span class="dot"></span>____</h2>
              <ul class="catering-ul text-center">
                <span class="dot"></span>
                <li>Birthdays</li>
                <span class="dot"></span>
                <li>Conference</li>
                <span class="dot"></span>
                <li>Wedding </li>
              </ul>
              <span><p class="text-center">
                Whether you are celebrating your birthday have a family reunion or
                 something else ,we'll make it enjoying and memorable. Our experts
                 have years of experience in party planning and will make sure it is a
                 delicious success, enjoying and memorable for you  and your guests!
                                  Time to put your party hat on!
              </p></span>
              <a data-bs-toggle="modal" data-bs-target="#loginModal" ><h5 class="text-center" style="cursor: pointer;color:navy">MORE DETAILS </h5></a>
              </div>
          </div>
        </div>          
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
      <span class="visually-hidden" >Previous</span>
    </button>
    <button class="carousel-control-next " type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" >
      <span class="carousel-control-next-icon " aria-hidden="true"></span>
      <span class="visually-hidden" >Next</span>
    </button>
  </div>






</div>
<!-- Carousel ends here -->

<!-- Catering Starts here -->
<div class="container-fluid d-flex justify-content-center" style="height:40.0rem;background-image:url('<c:url value="/resource/images/bir.png"/>');background-repeat: no-repeat;background-size: cover;">
    
  <div class="row  " style="align-self: center; ">
    <div class="col-md-6 " style="width: 100%;">
      <h2 class="text-center" style="font-weight: bolder; color: black;">
      Visit us at Foodie Bandhu
      </h2>
      <h1 class="text-center" style="font-weight: bolder; color: black;">
        Enjoyable & comfortable
      </h1>
      <h2 style="color: yellow;" class="mx-5 catspoon">_____________<img src='<c:url value="/resource/images/fork.png"/>' alt="">_____________</h2>
    </div>
  </div>
  
  </div>
<!--Catering ends here-->
<!-- contact us start here -->
     <section class="contact " id="contact">

      <h1 class="heading ">contact us</h1>
      
      <div class="row">
          <form action="Contact_Us" method="post">
              <input type="text" name="name" placeholder="full name" class="box" required pattern="[A-Za-z]{3,}+" title="Name does not contain any number and special character and It should be less then 30 characters and greater than 3 characters.">
              <input type="email" name="email" placeholder="your email" class="box" required   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please provide a valid E-mail address.">
              <input type="text" name="Options" placeholder="Reservation,Order,Catering,etc" class="box" required >
              <input type="number" name="mobile" placeholder="your number" class="box" required title="Phone no  should be start from 7,8,9 and it must be total 10 digits.">
              <textarea name="qta" id="" cols="30" rows="10" class="box address" placeholder="your query" required  pattern="[A-Za-z0-9'\.\-\s\,]{10,200}" title="Query characters is not more than 200 words"></textarea>
              <input type="submit" class="btn btn-warning" value="send now">
          </form>
      
     
      </div>
      
      </section>
      
<!-- contact section ends -->
<!-- footer starts here -->
  <div class="footer">

      <div class="box-container">
  
          <div class="box">
              <h3>branch locations</h3>
              <a target="_blank" href="https://www.google.com/maps/place/Sector+49,+Noida,+Uttar+Pradesh/@28.5625027,77.3638769,15z/data=!3m1!4b1!4m5!3m4!1s0x390ce5f25ac323b5:0xd496afa2bb8dd672!8m2!3d28.5636272!4d77.3725608">Noida</a> 
				<a target="_blank" href="https://www.google.com/maps/place/Patna,+Bihar/@25.6081756,85.0730019,12z/data=!3m1!4b1!4m5!3m4!1s0x39f29937c52d4f05:0x831a0e05f607b270!8m2!3d25.5940947!4d85.1375645">Patna</a> 
				<a target="_blank" href="https://www.google.com/maps/place/201,+Subdhra+Joshi+Marg,+Shakti+Khand+III,+Indirapuram,+Ghaziabad,+Uttar+Pradesh+201014/@28.6496301,77.3608561,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfaba71329489:0xdf41a8f5a1319840!8m2!3d28.649625!4d77.363044">Indirapuram</a> 
				<a target="_blank" href="https://www.google.com/maps/place/Nyay+Khand+III,+Indirapuram,+Ghaziabad,+Uttar+Pradesh+201014/@28.640902,77.3544585,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfab5d837286f:0xce8b99de587f24e1!8m2!3d28.6407781!4d77.3569897">Nyay Khand</a>
          </div>
  
          <div class="box">
              <h3>quick links</h3>
              <a href="#home">home</a>
              <a href="#about">About</a>
              <a href="#menu">Menu</a>
              <a href="#reservation">Reservation</a>
          </div>
  
          <div class="box">
              <h3>contact info</h3>
              <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
              <p style="text-transform: lowercase;"> <i class="fas fa-envelope"></i> foodiebandhu1720@gmail.com </p>
              <p> <i class="fas fa-phone"></i> +91-7217697611 </p>
          </div>
  
      </div>
  
      <h1 class="credit">created by <a href="#">deeksha</a><span>&#169;</span> all rights reserved. </h1>
  </div>
 <!--footer ends here  -->










		<%
		String s=request.getParameter("s");
		if(s!=null)
		{
			if(s.equals("1"))
			{
		
		%>
		<script type="text/javascript">
		
		const myBtn = document.getElementById('otp')
		myBtn.click()
		 
		</script>

		<%}else if(s.equals("0")) {
		%>
		<script type="text/javascript">
		alert("Sorry Invalid OTP")
		 </script>
		<%}else if(s.equals("2")) {
		%>
		<script type="text/javascript">
		alert("Sorry Invalid Foodie Bandhu id")
		 </script>
	<%}else if(s.equals("3")) {
		%>
		<script type="text/javascript">
		const myBtn = document.getElementById('otpPw')
		myBtn.click()
		</script>
		<%}else if(s.equals("6")) {
		%>
		<script type="text/javascript">
		alert("Successfully reset your password")
		</script>		
			
			
	<%}} %>>

<script type="text/javascript">
var regpass=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
function Passvalid()
{
	
	var name = document.getElementById('pw').value;
	if(regpass.test(name)){
		document.getElementById("pw").classList.add("is-valid");
		document.getElementById("pw").classList.remove("is-invalid");
		
	}else{
		document.getElementById("pw").classList.add("is-invalid");
        document.getElementById("pw").classList.remove("is-valid");
	}
}
function Cpassvalid()
{
	
	var pass = document.getElementById('pw').value;
	var cpass = document.getElementById('cpw').value;
	if(pass==cpass){
		document.getElementById("cpw").classList.add("is-valid");
		document.getElementById("cpw").classList.remove("is-invalid");
		
	}else{
		document.getElementById("cpw").classList.add("is-invalid");
        document.getElementById("cpw").classList.remove("is-valid");
	}
}



</script>





  </body> 
</html>