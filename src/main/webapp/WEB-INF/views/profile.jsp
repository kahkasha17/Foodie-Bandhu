<%@page import="com.spring.Modal.Admin"%>
<%@page import="com.spring.Modal.EmpRegis"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/profilee.css"/>'>
    <script>
        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

        const myModal = document.getElementById('myModal')
        const myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', () => {
            myInput.focus()
        })
        
        function readMe() {

            document.getElementById("fname").toggleAttribute("readonly");
            document.getElementById("fname").focus();
            document.getElementById("lname").toggleAttribute("readonly");
            document.getElementById("exampleInputEmail1").toggleAttribute("readonly");
            document.getElementById("mob").toggleAttribute("readonly");
            document.getElementById("add").toggleAttribute("readonly");
            /* document.getElementById("file").toggleAttribute("readonly");
            document.getElementById("sal").toggleAttribute("readonly");
            document.getElementById("role").toggleAttribute("disabled"); */

            document.getElementById("btns").classList.toggle("d-none");
        }
   
	
        
        
        
    </script>


</head>
<style type="text/css">
 @media (max-width:576px) {
            html {
                font-size: 62.5%;
            }
            
        }

        @media (max-width:442px) {
            html {
                font-size: 62.5%;
            }
            .footer
            {
            	margin-top: 10%;
          
            
            }
            
        }
  

</style>
<body>



<%
String i=(String)session.getAttribute("i");
String ecode=(String)session.getAttribute("ecode");
String acode=(String)session.getAttribute("acode");
if(i!=null)
{
	if(i.equals("0"))
	{%>
		<script type="text/javascript">
		alert("Profile Updated Successfully");
		</script>
	<%}else if(i.equals("1")){ %>	
		<script type="text/javascript">
		alert("Password Updated Successfully");
		</script>
		
	<%}}%>



    <div class="container-fluid" style="box-shadow: 0.09rem 0.09rem 0.3rem 0.010rem rgb(156, 156, 156);">
        <div class="row">
            <div class="col-12 bg-dark">
                <div class="imageback d-flex justify-content-between align-items-center">
                    <div class="img">
                        <img src='<c:url value="/resource/images/food-logo.png"/>' alt="logo" style="height: 7rem; width: auto;">
                    </div>
                    
                   
    <a class="bottomNav" onclick="history.go(-1); return false;"> <i class='bx bx-left-arrow-alt' style="font-size: 3rem; color: white; "></i>
                   </a>

                    
                    
                   
                   
                   
                </div>
            </div>
            <div class="col-12 d-flex flex-column justify-content-center align-items-center" style="margin-top: -4rem;">
                <img src='<c:url value="/resource/images/man.png"/>' alt="user profile pic"
                    style="width: 9rem; height: auto; border: 3px solid rgb(179, 178, 178);border-radius: 6rem;">
                <img src='<c:url value="/resource/images/cam.png"/>' alt="cam pic"
                    style="width: 2.7rem; height:auto; margin-top: -2.8rem; margin-left: 5rem;" data-bs-toggle="modal"
                    data-bs-target="#picModal">
                <h2 style="text-transform: capitalize;">${user.fname} ${user.lname }</h2>
                <p class="sp">${user.ucode}ID100${user.id }</p>
                <p class="sp"><i class='bx bx-envelope'></i>${user.mail}</p>
                <p class="sp"><i class='bx bx-phone'></i>${user.phn}</p>
                <p class="lead sp"><a href="#" id="edit" data-bs-html="true" onclick="readMe()" data-bs-toggle="popover"
                        data-bs-content="<span class='text-primary'>Now You can update your details </span>"
                        data-bs-placement="left" style="text-decoration: none;">Edit <i class='bx bx-edit'></i></a>
                </p>

            </div>

            <div class="modal fade" tabindex="-1" id="picModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add/Update Profile Image</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="">
                                <div class="mb-2">
                                    <input type="file" class="form-control form-control-sm" name="myimg">
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-success btn-block">Add Image</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="col-12 c">
                <h2 class="text-center">Profile Details</h2>
                <form action="UserProfile" method="post">
                    <div class="container">
                     <div class="row mx-4">
                      <div class="mb-3 col-sm-6">
                      <input type="text" value="${user.id}" name="id" hidden>
                      <input type="text" value="${user.ucode}" name="uc" hidden>
                       <label for="fname" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="fname" name="fname" value="${user.fname }" readonly
                         style="border: 2pz solid blue;!important; text-transform: capitalize;">
                         </div>
                        <div class="col-sm-6 mb-3">
                        <label for="lname" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lname" name="lname" value="${user.lname }" readonly style="text-transform: capitalize;">
                         </div>
                        <div class="col-sm-6 mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" name="mail" readonly
                                    value="${user.mail }" aria-describedby="emailHelp">
                            </div>
                            <div class="col-sm-6 mb-3">
                                <label for="mob" class="form-label">Mobile No.</label>
                                <input type="text" class="form-control" id="mob" name="phn" value="${user.phn }" readonly
                                    aria-describedby="emailHelp">
                            </div>
                            
                            
                          <% 
                          if(ecode!=null && ecode.startsWith("E") ||acode!=null && acode.startsWith("A"))
                          { 	  
                          		%>  
                            <div class="col-sm-6 mb-3">
                                <label for="role" class="form-label">Designation</label>
                                <select class="form-control" aria-label="Default select example" id="role" disabled value="">
                                    <option selected>${user.designation }</option>
                                    <option value="1">Receptionist</option>
                                    <option value="2">Bill Manager</option>
                                    <option value="3">Restaurent Manager</option>
                                    <option value="3">Security Assistant</option>
                                </select>
                            </div>
                            
                            
                            <div class="col-sm-6 mb-3">
                                <label for="sal" class="form-label">Salary</label>
                                <input type="text" class="form-control" id="sal" value="${user.salary }.00 INR" readonly
                                    aria-describedby="emailHelp" disabled="disabled">
                            </div>
                           
                            
                          <%}%>  
                            
                            <div class="col-12 mb-3">
                                <label for="floatingTextarea2" class="form-label">Enter your address here</label>
                                <textarea class="form-control" readonly="true" id="add" name="addr" style="height: 5rem">${user.addr}
                                </textarea>
                            </div>

                            <div class="col d-none mb-3" id="btns">
                                <button class="btn float-end btn-success mx-4" style="font-size: 1.2rem;"
                                    type="submit">Update</button>
                                <button class="btn btn-outline-dark float-end" style="font-size: 1.2rem;"
                                    type="reset">Reset</button>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <hr>
            <div class="security col-12 mb-2">
                <h2 class="text-center">Security Section</h2>
                <div class="row mx-4">
                    <form action="UserProfilePwupd" method="post">
                        <div class="col-sm-4 mb-3 m-auto">
                        <input type="text" name="id" value="${user.id}" hidden>
                        <input type="text" value="${user.ucode}" name="uc" hidden>
                            <label for="pass" class="form-label">Change Password(If needed*)</label>
                            <input type="password" class="form-control mb-3" id="pass" value="${user.pw }"
                                name="pw" aria-describedby="pass">
                            <button class="btn btn-primary float-end" type="submit">Change Password</button>
                        </div>
                    </form>
                </div>
                <form action="UserProfileDel" method="post">
                <input type="text" name="id" value="${user.id}" hidden>
                <input type="text" value="${user.ucode}" name="uc" hidden>
                <span>Click here to delete your account:</span>
                <button class="btn btn-danger " type="submit">Delete Your account</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="footer bg-dark text-white text-center col-12 p-1">
                <h5>Designed by &copy;Deeksha Developers</h5>
            </div>
        </div>
    </div>
   </body>

</html>