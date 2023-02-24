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
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/regis.css"/>'>
	<script type="text/javascript" src='<c:url value="/resource/js/Regis.js"/>'></script>
</head>
  <body >

    <div class="row  mx-auto mt-lg-5 mb-lg-5  main1">

        <div class="col-6 imgcol" style="background-image:url(<c:url value="/resource/images/pizza2.jpg"/>) ;background-repeat: no-repeat; background-size: cover;">
            
    </div>
        <div class="col-lg-6 col-md-12 bg-light text-dark main">
            <h4 class="mt-5">Hungry Grap It here!</h4>
            <span><p class="fst-italic" style="font-size: small;">Sign up now to receive exclusive offers and promotions.
                In order to receive the best deals that are customized to your tastes.
            </p></span>
            <p style="font-size: small;" >Already have an account? <a data-bs-toggle="modal" data-bs-target="#loginModal"  class="text-warning" style="text-decoration:none ;cursor:pointer ">Log in.</a></p>


            <form class="px-auto " action="CustRegis" method="post">
            <input type="text" value="CFB"  hidden name="ucode">

                <div class="row mb-3"  >
                  <div class="col-lg-6 col-md-12">
                    <label for="fname">First Name</label>
                    <input type="text" class="form-control" id="fname" onkeyup="firstnamevalid()" name="fname" placeholder="Kahkasha" required >
                        <div class="valid-feedback ">
     						 Looks good!
   						 </div>
   						 <div class="invalid-feedback ">
        					Name does not contain any number and special character and It should be less then 30 characters and greater than 3 characters.	 
      					</div>
                    
                  </div>
                  
                  
                  
                  
                  
                  <div class="col-lg-6 col-md-12">
                    <label for="lname">Last Name</label>
                    <input type="text" class="form-control" id="lname" onkeyup="lastnamevalid()" name="lname" placeholder="Khan" >
                    <div class="valid-feedback ">
     						 Looks good!
   						 </div>
                    <div class="invalid-feedback">
        					Name does not contain any number and special character and It should be less then 30 characters and greater than 3 characters.	 
      					</div>
      					
                  </div>
                </div>


                <div class="row mb-3"  >
                    <div class="col-lg-6 col-md-12">
                        <label for="phn">Phone</label>
                      <input type="text" class="form-control" id="phn" name="phn" placeholder="+91 7217697611" required onkeyup="Phnvalid()" >
                		<div class="invalid-feedback">
        					Phone no  should be start from 7,8,9 and it must be total 10 digits.	 
      					</div>
      					<div class="valid-feedback">
        					Looks Good	 
      					</div>
                
                
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <label for="mail">E-Mail</label>
                      <input type="text" class="form-control" id="mail" name="mail" placeholder="Kahkashakhan1417@gmail.com" required onkeyup="emailvalid()" >
                    <div class="invalid-feedback">
        					Please provide a valid E-mail address.	 
      					</div>
      					<div class="valid-feedback">
        					Looks Good	 
      					</div>
                    
                    </div>
                  </div>
                  <div class="row mb-3"  >
                    <div class="col-lg-6 col-md-12">
                        <label for="pw">Password</label>
                      <input type="password" class="form-control" id="pw" name="pw" placeholder="***********" required onkeyup="Passvalid()">
                    	<div class="invalid-feedback">
        					Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters 	 
      					</div>
      					<div class="valid-feedback">
        					Looks Good	 
      					</div>
                    </div>
                    <div class="col-lg-6 col-md-12">
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

<!-- For employee -->
                  <!-- <div class="row mb-3 ">
                    <div class="col-lg-6 col-md-12 ">
                        <label for="deg">Designation</label>
                        <select class="form-control one" id="deg" name="deg" >
                            <option>Manager</option>
                            <option>Staff</option>
                            <option>Billing Manager</option>                          
                          </select>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <label for="rsm">Resume</label>
                      <input type="file" class="form-control" id="rsm" name="rsm"  placeholder="**********">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <label for="add">Address</label>
                  <textarea  id="add" cols="55" rows="6" name="add" />
                </div></div> -->
                  
                  
                  <!--for employee  -->

                 
                       <div class="form-check mb-3">
                        <input class="form-check-input position-static" type="radio" name="blankRadio" id="blankRadio1" value="option1" aria-label="..." required ><span>I agree to the <a href="" class="text-warning" style="text-decoration: none;">Terms,Conditions, and Privacy Policy. </a></span>
                              <div class="invalid-feedback">
      						  You must agree before submitting.
      						</div>
                        </div>
                        <button type="submit" class="btn btn-warning mb-5">Submit</button>
              </form>
        </div>
        
        
        <div class="modal fade" id="ForgetPwModal"  tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header  border-bottom-0">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4><b>Forget Password</b></h4>
          <span style="font-size: small;">Enter your registered email id</span>
        </div>
        <div class="d-flex flex-column text-center">
          <form >
            <div class="form-group ">
              <input type="email" class="form-control" id="email1"placeholder="Your email address...">
            </div>
            
            <button type="button" class="btn  btn-block logbtn btn-round">Send Mail</button>
          </form>
          
          
      </div>
    
      </div>
      
    </div>
  </div>
</div>
        
        <!-- Forget Password Modal Starts Ends here -->

        
        
    </div>
         <!-- Login Modal Starts Here -->
         <div class="modal fade " id="loginModal"  tabindex="-1">
          <div class="modal-dialog modal-dialog-centered " >
            <div class="modal-content">
              <div class="modal-header  border-bottom-0">
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="form-title text-center">
                  <h4><b>Login</b></h4>
                </div>
                <div class="d-flex flex-column text-center">
                  <form >
                    <div class="form-group ">
                      <input type="email" class="form-control" id="email1"placeholder="Your email address...">
                    </div>
                    <div class="form-group ">
                      <input type="password" class="form-control" id="password1" placeholder="Your password...">
                    </div>
                    <button type="button" class="btn  btn-block logbtn btn-round">Login</button>
                  </form>
                  
                  
              </div>
            
              </div>
              <div class="modal-footer">
                <div class="forget-section " style="font-size: small;">Not remember your password ? <a data-bs-toggle="modal" data-bs-target="#ForgetPwModal" style="color: navy;text-decoration: none;font-size:small;cursor: pointer;"> Forget Pw </a>.
                
                
                
                </div>
               </div>
          </div>


        </div>
        <!-- Login Modal Starts Ends here -->
    </div>
    
    
    
    
    
    
<script>
var regName = /^[a-zA-Z\s ]{2,30}$/;
var regPhn = /^[789][0-9]{9}$/;
var regemail = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
var regpass=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/
function firstnamevalid()
{
	
	var name = document.getElementById('fname').value;
	if(regName.test(name)){
		document.getElementById("fname").classList.add("is-valid");
		document.getElementById("fname").classList.remove("is-invalid");
		
	}else{
		document.getElementById("fname").classList.add("is-invalid");
        document.getElementById("fname").classList.remove("is-valid");
	}
}
function lastnamevalid()
{
	
	var name = document.getElementById('lname').value;
	if(regName.test(name)){
		document.getElementById("lname").classList.add("is-valid");
		document.getElementById("lname").classList.remove("is-invalid");
		
	}else{
		document.getElementById("lname").classList.add("is-invalid");
        document.getElementById("lname").classList.remove("is-valid");
	}
}
function Phnvalid()
{
	
	var name = document.getElementById('phn').value;
	if(regPhn.test(name)){
		document.getElementById("phn").classList.add("is-valid");
		document.getElementById("phn").classList.remove("is-invalid");
		
	}else{
		document.getElementById("phn").classList.add("is-invalid");
        document.getElementById("phn").classList.remove("is-valid");
	}
}

function emailvalid()
{
	
	var name = document.getElementById('mail').value;
	if(regemail.test(name)){
		document.getElementById("mail").classList.add("is-valid");
		document.getElementById("mail").classList.remove("is-invalid");
		
	}else{
		document.getElementById("mail").classList.add("is-invalid");
        document.getElementById("mail").classList.remove("is-valid");
	}
}
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
