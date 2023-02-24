<%@page import="com.spring.Modal.User"%>
<%@page import="com.spring.Modal.HelpAndSupport"%>
<%@page import="com.spring.Modal.Contactus"%>
<%@page import="com.spring.Modal.EmpRegis"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.web.servlet.view.RedirectView"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.Modal.AddMenuItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Module</title>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
    </script>

<link rel="stylesheet" type="text/css"
	href='<c:url value="/resource/css/admin.css"/>'>
<script src='<c:url value="/resource/js/admin.js"/>'></script>



</head>

<body onload="clickme()">

<% String qt=(String)request.getParameter("qt");
if(qt!=null)
{
	if(qt.equals("0"))
	{%>
	<script type="text/javascript">
	alert("Item added Successfully")
	</script>
	<% }else if(qt.equals("1"))
	{%>
	<script type="text/javascript">
	alert("Employee Deleted Successfully")
	</script>
<% }else if(qt.equals("2"))
	{%>
	<script type="text/javascript">
	alert("Employee Added Successfully")
	</script>
<% }else if(qt.equals("3"))
	{%>
	<script type="text/javascript">
	alert("Employee Record Updated Successfully")
	</script>

		
<% }}%>	
	


	<!----------------[ header starts here]------------->
	<div
		class="nav text-light d-flex align-items-center justify-content-between p-1"
		style="background: linear-gradient(90deg, #00265f, #3283a8, #00265f);">
		<div class="fbname px-2 m-1">
			<h5>Foodie Bandhu</h5>
		</div>
		<div class="d-flex m-2">
			<img src='<c:url value="/resource/images/man.png"/>'
				alt="admin profile photo" class="admin-img">
			<div>
				<p class="admin-p px-2">
					Hii ${user.fname} ${user.lname} <i class='bx bx-down-arrow' id="myi"
						onclick="openProfile()"></i>
				</p>

				<ul class="list-group text-center d-none" id="myul">
					<li class="list-group-item"><a href="profile"
						style="text-decoration: none; color: black;"><i
							class='bx bxs-user-account'></i> Profile</a></li>
					<li class="list-group-item" style="cursor: pointer; "><a href="logoutControler" style="text-decoration: none;color: black;"><i
						class='bx bx-exit'></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!------------------------[ header ends ]---------------------->

	<!-----------------------[ main div starts here]---------------->
	<div class="container-fluid">
		<div class="row">

			<!-----------------[ Side bar starts Here]-------------->
			<div class="col-3 "
				style="background: linear-gradient(to right, #00265f, #05567c);">
				<div class="text-center">
					<img src='<c:url value="/resource/images/food-logo.png"/>'
						alt="food logo image" class="food-logo">
				</div>
				<!--------------[ side bar options ]------------>
				<div class="sidebar">
					<ul style="list-style-type: none;" class="p-2">
						<li class="p-1 my-sm-2 my-3"><a href="#mainDiv"
							onclick="mainDiv()" id="myhomeli"><i class='bx bxs-home'></i>
								Home</a></li>
						<li class="p-1  my-sm-2 my-3"><a href="#customer"
							onclick="showCust()"> <i class='bx bx-user-voice'></i>
								Customer Details
						</a></li>
						<li class="p-1 my-sm-2 my-3"><a href="#emp"
							onclick="showEmp()"><i class='bx bx-user'></i> Employee
								Details</a></li>
						<li class="p-1 my-sm-2 my-3"><a href="#order"
							onclick="showOrder()"><i class='bx bx-cart-alt'></i> Orders
								details</a></li>

						<li class="p-1 my-sm-2 my-3"><a href="#menu"
							onclick="showMenu()"><i class='bx bxs-food-menu'></i> Menu
								Items</a></li>

						<li class="p-1 my-sm-2 my-3"><a href="#income"
							onclick="showIncome()"><i class='bx bxs-report'></i> Income
								Reports</a></li>
						<li class="p-1 my-sm-2 my-3"><a href="#feedback"
							onclick="showFeedback()"><i
								class="bx bx-message-rounded-detail"></i> Feedback details</a></li>
						<li class="p-1 my-sm-2 my-3"><a href="#help"
							onclick="showHelp()"><i class='bx bx-help-circle'></i> Help
								and support</a></li>
						<li class="p-1 my-sm-2 my-3"><a href="#contact"
							onclick="showContact()"><i class='bx bxs-contact'></i>
								Contact Us</a></li>
					</ul>

				</div>
				<!---------------[ Side bar options ends here ]----->
			</div>
			<!---------------[ Side bar ends here ]----->


			<!--------------------[ Options box starts here ]-------------->
			<div class="col-9">

				<!--------[ Admin Haeding ]-------->
				<div class="row">
					<div class="col-12 text-center text-light"
						style="background: linear-gradient(90deg, #4a5e72, #82888b, #576a7e);">
						<h3 class="myh3">Administration for Restaurent Manager</h3>
						<p style="font-family: cursive;" class="mymgrp">"From here you
							can access and control everything"</p>
					</div>
				</div>

				<!-------------------[ Employee content box ]----------------->
		<div class="row" id="emp">
					<div class="col-12">
						<h4 class="text-center p-1 downline">Employee Management
							Section</h4>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs nav-dark">
								
   <li> <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#emp-table" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Employee Details</button></li>
   <li> <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#addEmp" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Add New Employee</button></li>
    </ul>
<div>	
<div class="tab-content" id="emp-tabContent">





<!-- Tab for Employee Table Starts Here -->
<div class="tab-pane fade show active" id="emp-table" role="tabpanel" aria-labelledby="nav-home-tab">

<table id="emp-tablee"class="table table-bordered table-striped table-hover table table-sm table-responsive">
<thead class="thead-light">
<tr class="text-center" style="font-size: 0.9rem;">
<th>Emp ID</th>
<th>Name</th>
<th>E-mail</th>
<th>Mobile</th>
<th>Role</th>
<th>Resume</th>
<th>Salary</th>
<th>Actions</th>
</tr>
	</thead>
	<tbody>
		<%
		  List<EmpRegis> k = (List) session.getAttribute("empList");
			if (k != null) {
			
			for (EmpRegis i : k) {
		%>
		<tr class="text-center" style="font-size: 0.8rem;">
		<td >EFBID00 <%=i.getId()%></td>
		
		<td><%=i.getFname()%> <%=i.getLname()%></td>
	   <td><%=i.getMail()%></td>
	   <td><%out.print(i.getPhn());%></td>
	   <td><%out.print(i.getDesignation());%></td>
	   <td><a target="_blank" href="showResume/<%out.print(i.getId()); %>">Resume</a></td>
	   <td><%out.print(i.getSalary());%></td>
	   <td style="font-size: 1.0rem;">
<a href="#" data-bs-toggle="modal" data-bs-target="#EmpUpdateModal"
onclick="updEmpProfile(<%=i.getId() %>,'<%=i.getFname()%>','<%=i.getLname()%>','<%=i.getMail()%>','<%=i.getPhn()%>','<%=i.getDesignation()%>','<%=i.getSalary()%>','<%=i.getAddr()%>')">
<i class='bx bx-edit'></i></a> |<a href="DelEmp?id=<%out.print(i.getId());%>">
<i class='bx bx-trash'></i></a></td></tr>
	<%}}%>
	</tbody>
	</table>




</div>
<!-- Tab for Employee Table Ends Here -->
<!-- Tab for Add Employee Table Starts Here -->  
<div class="tab-pane fade" id="addEmp" role="tabpanel" aria-labelledby="nav-profile-tab">
  
<div class="container">  
  <form class="px-auto mt-5 ms-5" action="AdmEmpRegis" method="post" enctype="multipart/form-data">
            <input type="text" value="EFB" hidden name="ucode">

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
                        					
                  </div>
                </div>


                <div class="row mb-3"  >
                    <div class="col-lg-6 col-md-12">
                        <label for="phn">Phone</label>
                      <input type="text" class="form-control" id="phn" name="phn" placeholder="+91 7217697611" required onkeyup="Phnvalid()" >
                	
                
                
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <label for="mail">E-Mail</label>
                      <input type="text" class="form-control" id="mail" name="mail" placeholder="Kahkashakhan1417@gmail.com" required onkeyup="emailvalid()" >
                    
                    
                    </div>
                  </div>
                  <div class="row mb-3 ">
                    <div class="col-lg-6 col-md-12 ">
                        <label for="deg">Designation</label>
                        <select class="form-control one" id="deg" name="designation" >
                            
                            
                            <option>Restuarant staff</option>
                            <option>Waiter</option>
                            <option>Cleaning staff</option>
                            <option>Others</option>
                                                      
                          </select>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <label for="rsm">Resume</label>
                      <input type="file" class="form-control" id="rsm" name="resume"  placeholder="**********">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <label for="add">Address</label>
                  <textarea  cols="55" rows="6" name="addr" id="add" onkeyup="Addvalid()" ></textarea>
                  
                  
                  
                </div>
                 </div>                               
                 <button type="submit" class="btn btn-warning mb-5 mt-5">Submit</button>
              </form>
  </div>
  
  
  
  </div>
<!-- Tab for Add Employee Table Ends Here -->    
</div>				
								
								
								
								
							</div>
						</div>
					</div>
				</div>
				</div>	
				<!-------------------[ Employee content box ends here ]----------------->

				<!-------------------[ Order Content box starts ]----------------->
				<div class="row" id="order">
					<div class="col-12">
						<h3 class="text-center p-1 downline">
							Order Management Section
							</h2>
							<div class="row">
								<div class="col">
									<ul class="nav nav-tabs nav-dark">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="#order-table">Order Details</a></li>
									</ul>

									<table id="order-table"
										class="table table-bordered table-striped table-hover table table-sm table-responsive">
										<thead class="thead-light" style="font-size: 0.9rem;">
											<tr class="text-center">
												<th>Order-ID</th>
												<th>Item Details</th>
												<th>Total price</th>
												<th>Ordered by</th>
												<th>Invoice</th>
												<th>Order status</th>
												<th>Payment status</th>
												<th>Cancel order</th>
											</tr>
										</thead>
										<tbody>

											<tr class="text-center" style="font-size: 0.8rem;">
												<td>Ord001</td>
												<td data-bs-toggle="modal" data-bs-target="#orderDeatils"
													style="cursor: pointer;">View item details</td>

												<td>120INR</td>
												<td>Ruhi Verma</td>
												<td>blob</td>
												<td><select class="form-select"
													aria-label="Default select example"
													style="border: none; font-size: 0.8rem;">
														<option selected value="0">Not Delivered</option>
														<option value="1">Delivered</option>
												</select></td>
												<td><select class="form-select"
													aria-label="Default select example"
													style="border: none; font-size: 0.8rem;">
														<option selected value="0">Not Paid</option>
														<option value="1">Paid</option>
												</select></td>
												<td><a href="#" data-bs-toggle="tooltip"
													data-bs-title="Cancel" style="font-size: 1rem;"><i
														class='bx bx-trash'></i></a></td>
											</tr>
											<tr class="text-center" style="font-size: 0.8rem;">
												<td>Ord001</td>
												<td data-bs-toggle="modal" data-bs-target="#orderDeatils"
													style="cursor: pointer;">View item details</td>

												<td>120INR</td>
												<td>Ruhi Verma</td>
												<td>blob</td>
												<td><select class="form-select"
													aria-label="Default select example"
													style="border: none; font-size: 0.8rem;">
														<option selected value="0">Not Delivered</option>
														<option value="1">Delivered</option>
												</select></td>
												<td><select class="form-select"
													aria-label="Default select example"
													style="border: none; font-size: 0.8rem;">
														<option selected value="0">Not Paid</option>
														<option value="1">Paid</option>
												</select></td>
												<td><a href="#" data-bs-toggle="tooltip"
													data-bs-title="Cancel" style="font-size: 1rem;"><i
														class='bx bx-trash'></i></a></td>
											</tr>

										</tbody>
									</table>

									<!-------------------[ order item modal ]----------------->
									<div class="modal" tabindex="-1" id="orderDeatils"
										style="font-size: 0.8rem;">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">Ordered Item Details</h4>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<table class="table">
														<thead>
															<tr>
																<th scope="col">Item name</th>
																<th scope="col">item type</th>
																<th scope="col">Price</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>Shahi paneer</td>
																<td>Main Dish</td>
																<td>190INR</td>
															</tr>
															<tr>
																<td>Chilli potato</td>
																<td>Starter</td>
																<td>90INR</td>
															</tr>
															<tr>
																<td>Shahi paneer</td>
																<td>Main Dish</td>
																<td>190INR</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="modal-footer">
													<h5>Total Price 470INR</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
				<!-------------------[ Order content box end ]----------------->

				<!-------------------[ Customer content box starts ]----------------->
				<div class="row" id="customer">
					<div class="col-12">
						<h3 class="text-center p-2 downline">Customer Management
							Section</h3>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs nav-dark">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#cust-table">Customer Details</a></li>
								</ul>

								<table id="cust-table"
									class="table table-bordered table-striped table-hover table table-sm table-responsive">
									<thead class="thead-light" style="font-size: 0.9rem;">
										<tr class="text-center">
											<th>Cust-ID</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>E-mail</th>
											<th>Mobile</th>
											<th>Address</th>
											
										</tr>
									</thead>
									<tbody>
									
								<%	List<User> z = (List) session.getAttribute("custlist");

												if (z != null) {
												
													for (User i : z) {
								%>
										<tr class="text-center" style="font-size: 0.9rem;">
											<td>CFBID00<%=i.getId() %></td>
											<td><%=i.getFname() %></td>
											<td><%=i.getLname() %></td>
											<td><%=i.getMail() %></td>
											<td><%=i.getPhn()%></td>
											<td><%=i.getAddr()%> </td>

										</tr>
										
									</tbody>
									<%}} %>
								</table>

							</div>
						</div>
					</div>
				</div>
				<!-------------------[ Customer content box end ]----------------->

				<!-------------------[ Menu content box starts ]----------------->
				<div class="row" id="menu">
					<div class="col-12">
						<h3 class="text-center p-1 downline">Menu Section</h3>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="home-tab"
											data-bs-toggle="tab" data-bs-target="#menu-table"
											type="button" role="tab" aria-controls="home-tab-pane"
											aria-selected="true">Menu Item details</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
											data-bs-target="#menu-form" type="button" role="tab"
											aria-controls="profile-tab-pane" aria-selected="false">Add
											new item</button>
									</li>
								</ul>

								<div class="tab-content tableScroll" id="myTabContent">
									<div class="tab-pane fade active show" id="menu-table"
										role="tabpanel" aria-labelledby="home-tab" tabindex="0">
										<table
											class="table table-bordered table-striped table-hover table-sm table-responsive"
											id="menuTable">
											<thead class="thead-light" style="font-size: 0.9rem;">
												<tr class="text-center">
													<th>Dish-ID</th>
													<th>Dish Name</th>
													<th>Dish Type</th>
													<th>Dish Qty</th>
													<th>Price</th>
													<th>Dish Image</th>
													<th>Time</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<%
												List<AddMenuItem> l = (List) session.getAttribute("menuList");

												if (l != null) {
													int id;
													for (AddMenuItem i : l) {
												%>
												<tr class="text-center" style="font-size: .8rem;">
													<td id="idOfImage">
														FBDID0<%
														out.print(i.getImgId());
														%>
													</td>
													<td>
														<%
														out.print(i.getDishName());
														%>
													</td>
													<td>
														<%
														out.print(i.getDishType());
														%>
													</td>
													<td>
														<%
														out.print(i.getQty());
														%>
													</td>
													<td>
														<%
														out.print(i.getPrice());
														%>
													</td>
													<td><a href="showImg/<%out.print(i.getImgId());%>"
														target="_blank">View</a></td>
													<td>
														<%
														out.print(i.getLastmodified());
														%>
													</td>
													<td style="font-size: 1.2rem;"><a
														href="updMenu?updid=<%out.print(i.getImgId());%>"
														id="updA"><i class='bx bx-edit'></i></a> | <a
														href="delMenuItem?id=<%out.print(i.getImgId());%>"
														data-bs-toggle="tooltip" data-bs-title="Delete"><i
															class='bx bx-trash'></i></a></td>
												</tr>
												<%
												}
												}
												%>
											</tbody>
										</table>
									</div>

									<%
									String mid = (String) request.getAttribute("updT");
									if (mid != null) {
										if (mid.equals("0")) {
											System.out.println("updT isssss " + mid);
									%>
									<script type="text/javascript">

			   console.log(document.getElementById("updA").getAttributeNames());
		        document.getElementById("updA").setAttribute('data-bs-toggle', 'modal');
		        document.getElementById("updA").setAttribute('data-bs-target', '#updItemModal');
		        function clickme() {					
		        document.getElementById("updA").click();
				}
		        console.log(document.getElementById("updA").getAttributeNames());
			</script>
									<%
									}
									}
									%>

									<div class="tab-pane fade" id="menu-form" role="tabpanel"
										aria-labelledby="profile-tab" tabindex="0">

										<p class="lead text-center" style="font-style: italic;">"Fill
											all the details carefully to Add a new delicious item in
											Menu"</p>

										<div class="row m-auto">
											<div class="offset-3 col-6">
												<form action="addImageAction" method="post"
													enctype="multipart/form-data">

													<div class="form-floating mb-1">
														<input type="text" class="form-control" id="floatingName"
															placeholder="Enter Dish name" name="dishName"> <label
															for="floatingName">Dish Name</label>
													</div>

													<div class="form-floating">
														<select class="form-select" id="floatingSelect1"
															name="dishType"
															aria-label="Floating label select example">
															<option>Select Dish Type</option>
															<option value="Starter">Starter</option>
															<option value="main">Main-Dish</option>
															<option value="dessert">Dessert</option>
															<option value="beverage">Beverages</option>
														</select> <label for="floatingSelect1">Dish Type</label>
													</div>

													<div class="form-floating my-1">
														<input type="text" class="form-control" id="floatingPrice"
															name="price" placeholder="Enter Price"> <label
															for="floatingPrice">Price</label>
													</div>

													<div class="form-floating">
														<select class="form-select" id="floatingSelect2"
															name="qty" aria-label="Floating label select example">
															<option selected>Select Quantity</option>
															<option value="1">For 1 person</option>
															<option value="2">For 2 People</option>
															<option value="4">For 4 People</option>
															<option value="8">For 8 People</option>
														</select> <label for="floatingSelect2">Quantity</label>
													</div>
													<div class="my-2">
														<label for="formFile" class="form-label">Choose
															Dish Image</label> <input class="form-control" type="file"
															id="formFile" name="dishImg">
															<div style="font-size: 0.9rem;" class="form-text">*Please upload the image less then 1 MB*</div>
													</div>
													<div class="d-flex justify-content-evenly m-2">
														<button type="submit" class="btn btn-success">Add
															Item</button>
														<button type="reset" class="btn btn-outline-secondary">
															Reset</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
                  String delmsg = request.getParameter("delmsg");
                  if (delmsg != null) {
                  %>
                  <script type="text/javascript">
                    alert("!!..Item is successfully removed from Menu..!!");
                  </script>
                  <%
                  }
                  %>
				<!-------------------[ help content box starts ]----------------->
<!-------------------[ help content box starts ]----------------->
				<div class="row" id="help">
					<div class="col-12">
						<h3 class="text-center p-1 downline">Help and support Section</h3>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs nav-dark">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#help-table"
										style="font-weight: bold;">Users's Query Details</a></li>
								</ul>

								<table id="help-table"
									class="table table-bordered table-striped table-hover table table-responsive table-sm">
									<thead class="thead-light" style="font-size: 0.9rem;">
										<tr class="text-center">
											<th>H&S-ID</th>
											<th>Name</th>
											<th>User ID</th>
											<th>Mobile</th>
											<th>Status</th>
											<th>Query</th>
											<th>Sending Time</th>
											<th>Reply</th>
										</tr>
									</thead>
									<tbody>
									<%
									List<HelpAndSupport> help=(List)session.getAttribute("helpAndSupportList");
									System.out.println("This is help and support "+help);
									if(help!=null)
									{
										for(HelpAndSupport hs:help)
										{
											%>
											<tr class="text-center" style="font-size: 0.8rem;">
											<td><%=hs.getHlpsprtid()%></td>
											<td><%=hs.getFname()%> <%=hs.getLname()%></td>
											<td><%=hs.getUid()%></td>
											<td><%=hs.getMob()%></td>
											<%
												if(hs.isStatus())
												{
													%>
													<td>Replied</td>
													<%
												}else
												{
												%>
												<td>Not Replied</td>
												<%
												}
											%>
											<td><%=hs.getQta()%></td>
											<td><%=hs.getLastmodified()%></td>
											<%
												if(hs.isStatus())
												{
													%>
													<td><a href="delHelp?hid=<%out.print(hs.getSr());%>"
														data-bs-toggle="tooltip" data-bs-title="Delete"><i style="font-size: 1.1rem;"
															class='bx bx-trash'></i></a></td>
													<%
												}else
												{
												%>
											<td><a href="#helpmodal" style="font-size: 1.1rem;" onclick="showhelp(<%=hs.getSr()%>,'<%=hs.getEmail()%>','<%=hs.getQta()%>')"
												data-bs-toggle="modal" data-bs-target="#helpModal"><i
													class='bx bxl-telegram'></i></a></td>
												<%
												}
											%>
											
											
										</tr>	
											<%
										}
									}
									%>
										
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>

				<script type="text/javascript">
					function showhelp(hid,mail,query) 
					{
						document.getElementById("hid").setAttribute("value",hid);		
						document.getElementById("Hmail").setAttribute("value",mail);		
						document.getElementById("Hquery").innerHTML=query;		
					}
				</script>
				<!-- Modal -->
				<div class="modal fade" id="helpModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header bg-dark">
								<h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Help
									and support Reply</h1>
								<button type="button" class="btn-close btn-close-white"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="HnSreplyAction" method="post">
									<input type="text" class="form-control" name="sr"
											id="hid" hidden="true">
											
									<div class="mb-2">
										<label for="Hmail" class="form-label">Email
											address</label> 
											<input type="email" class="form-control"
											id="Hmail" aria-describedby="emailHelp" name="email" >
									</div>

									<div class="mb-2">
										<label for="Hquery" class="form-label">Your
											Query</label>
										<textarea class="form-control" placeholder="Your query"
											id="Hquery" rows="3" name="qta"></textarea>
									</div>

									<div class="mb-2">
										<label for="floatingTextarea2" class="form-label">Reply</label>
										<textarea class="form-control"
											placeholder="Write your reply here" id="floatingTextarea2" name="hreply" rows="4"></textarea>
									</div>
									<button type="submit" class="btn btn-primary float-end">Reply Now</button>
								</form>
							</div>

							<!-- <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div> -->
						</div>
					</div>
				</div>
				<%
					String hmsg=request.getParameter("hmsg");
					if(hmsg!=null)
					{
						if(hmsg.equals("0"))
						{
					%>
					<script type="text/javascript">
						alert("Reply is sent Successfully..");
					</script>
					<%		
						}
					}
				%>
				
				<%
					String helpdel=request.getParameter("helpDel");
					
					if(helpdel!=null)
					{
						if(helpdel.equals("0"))
						{
					%>
					<script type="text/javascript">
						alert("Help Reply details deleted sucessfully");
					</script>
					<%		
						}
					}
				%>
				<!-------------------[ Contact content box starts ]----------------->
				<div class="row" id="contact">
					<div class="col-12">
						<h3 class="text-center p-1 downline">Contact Us Section</h3>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs nav-dark">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#contact-table">User's Contact
											Details</a></li>
								</ul>

								<table id="contact-table"
									class="table table-bordered table-striped table-hover table table-responsive table-sm">
									<thead class="thead-light" style="font-size: 0.9rem;">
										<tr class="text-center">
											<th>Query-ID</th>
											<th>Asked By</th>
											<th>Mobile</th>
											<th>Status</th>
											<th>Regard</th>
											<th>Query</th>
											<th>Sending Time</th>
											<th>Reply</th>
										</tr>
									</thead>
									<tbody>
										<%
										List<Contactus> cont = (List) session.getAttribute("contactList");
										if (cont != null) {
											for (Contactus us : cont) {
										%>
										<tr class="text-center" style="font-size: 0.8rem;">
											<td><%=us.getQid()%></td>
											<td><%=us.getName()%></td>
											<td><%=us.getMobile()%></td>
											<%
												if(us.isStatus())
												{
													%>
													<td>Replied</td>
													<%
												}else
												{
												%>
												<td>Not Replied</td>
												<%
												}
											%>
											
											<td><%=us.getOptions()%></td>
											<td style="word "><%=us.getQta()%></td>
											<td><%=us.getLastmodified()%></td>
											<%
												if(us.isStatus())
												{
													%>
													<td><a href="delContact?id=<%out.print(us.getSr());%>"
														data-bs-toggle="tooltip" data-bs-title="Delete"><i style="font-size: 1.1rem;"
															class='bx bx-trash'></i></a></td>
													<%
												}else
												{
												%>
												<td><a href="#" style="font-size: 1.1rem;"
												onclick="showContactReply(<%=us.getSr()%>,'<%=us.getName()%>','<%=us.getEmail()%>','<%=us.getQta()%>')"
												data-bs-toggle="modal" data-bs-target="#contactModal"><i
													class='bx bxl-telegram'></i></a></td>
												<%
												}
											%>
										</tr>
										<%
										}
										}
										%>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
				<%
					String rmsg=request.getParameter("rmsg");
					
					if(rmsg!=null)
					{
						if(rmsg.equals("0"))
						{
					%>
					<script type="text/javascript">
						alert("Reply is sent Successfully..");
					</script>
					<%		
						}
					}
				%>
				<%
					String conDel=request.getParameter("conDel");
					
					if(conDel!=null)
					{
						if(conDel.equals("0"))
						{
					%>
					<script type="text/javascript">
						alert("Reply details deleted sucessfully");
					</script>
					<%		
						}
					}
				%>
					
				<!-- Modal -->
				<script type="text/javascript">
					function showContactReply(sid,name,mail,query)
					{
						console.log("showcontact reply is working"); 
						document.getElementById("exampleInputid").setAttribute("value",sid);
						document.getElementById("exampleInputname").setAttribute("value",name);
						document.getElementById("contactmail").setAttribute("value",mail);
						document.getElementById("query").innerHTML=query;
					}
				</script>
				<div class="modal fade" id="contactModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header bg-dark" style="font-size: 0.9rem;">
								<h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Contact
									Us Reply</h1>
								<button type="button" class="btn-close btn-close-white"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" style="font-size: 0.9rem;">
								<form action="contactUsReply" method="post">
									<input type="text" class="form-control" id="exampleInputid" name="sr" hidden="true">
									
									<div class="mb-2">
										<label for="exampleInputname" class="form-label">Name </label> 
										<input type="text" class="form-control form-control-sm" name="name"
											id="exampleInputname">
									</div>
									<div class="mb-2">
										<label for="contactmail" class="form-label">Email
											address</label> 
										<input type="email" class="form-control form-control-sm" name="email"
											id="contactmail" aria-describedby="emailHelp">
									</div>
									<div class="mb-2">
										<label for="query" class="form-label">Your
											Query</label>
										<textarea class="form-control form-control-sm" id="query" rows="3" name="qta"></textarea>
									</div>

									<div class="mb-2">
										<label for="floatingTextarea2" class="form-label">Reply</label>
										<textarea class="form-control form-control-sm" name="reply"
											placeholder="Write your reply here" id="floatingTextarea2"
											style="height: 100px"></textarea>
									</div>
									<button type="submit" class="btn btn-primary float-end">Send</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-------------------[ income content box starts ]----------------->
				<div class="row" id="income">
					<div class="col-12">
						<h1>Show income report</h1>
					</div>
				</div>

				<!-------------------[ Feedback content box starts ]----------------->
				<div class="row" id="feedback">
					<div class="col-12">
						<h1 class="text-center p-1 downline">Feedback Section</h1>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs nav-dark">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#Feed-table"
										style="font-weight: bold;">User's Feedback Details</a></li>
								</ul>

								<table id="feed-table"
									class="table table-bordered table-striped table-hover table table-responsive-md">
									<thead class="thead-light" style="font-size: .9rem;">
										<tr class="text-center">
											<th>First Name</th>
											<th>Last Name</th>
											<th>E-mail</th>
											<th>Mobile</th>
											<th>Feedback</th>
											<th>Feedback Comments(*optional)</th>
										</tr>
									</thead>
									<tbody>
										<tr class="text-center" style="font-size: .8rem;">
											<td>Deepak</td>
											<td>Kumar</td>
											<td>deep@gmail.com</td>
											<td>9711574906</td>
											<td>satisfied</td>
											<td>Its being a great experince here...</td>
										</tr>
										<tr class="text-center" style="font-size: .8rem;">
											<td>Deepak</td>
											<td>Kumar</td>
											<td>deep@gmail.com</td>
											<td>9711574906</td>
											<td>satisfied</td>
											<td>Its being a great experince here...</td>
										</tr>
										<tr class="text-center" style="font-size: .8rem;">
											<td>Deepak</td>
											<td>Kumar</td>
											<td>deep@gmail.com</td>
											<td>9711574906</td>
											<td>satisfied</td>
											<td>Its being a great experince here...</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>

				<!-------------------[Book table content box starts ]----------------->
				<div class="row" id="tables">
					<div class="col-12">
						<h4 class="text-center p-1 downline">Table Booking Management</h4>
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs nav-dark">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#book-table">List of Table
											Bookings</a></li>
								</ul>

								<table id="book-table"
									class="table table-bordered table-striped table-hover table table-responsive-md">
									<thead class="thead-light">
										<tr class="text-center" style="font-size: 0.9rem;">
											<th>Table ID</th>
											<th>Booked By</th>
											<th>E-mail</th>
											<th>Tables</th>
											<th>Floors</th>
											<th>Date</th>
											<th>Time</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr class="text-center" style="font-size: 0.8rem;">
											<td>TB001</td>
											<td>Deepak kumar</td>
											<td>deep@gmail.com</td>
											<td>4</td>
											<td>No floors</td>
											<td>12/02/2022</td>
											<td>8:30 pm</td>
											<td style="font-size: 1.0rem;"><a href="#"
												data-bs-toggle="tooltip" data-bs-title="Edit"><i
													class='bx bx-edit'></i></a> | <a href="#"
												data-bs-toggle="tooltip" data-bs-title="Delete"><i
													class='bx bx-trash'></i></a></td>

										</tr>

										<tr class="text-center" style="font-size: 0.8rem;">
											<td>TB001</td>
											<td>Deepak kumar</td>
											<td>deep@gmail.com</td>
											<td>4</td>
											<td>No floors</td>
											<td>12/02/2022</td>
											<td>8:30 pm</td>
											<td style="font-size: 1.0rem;"><a href="#"
												data-bs-toggle="tooltip" data-bs-title="Edit"><i
													class='bx bx-edit'></i></a> | <a href="#"
												data-bs-toggle="tooltip" data-bs-title="Delete"><i
													class='bx bx-trash'></i></a></td>

										</tr>
										<tr class="text-center" style="font-size: 0.8rem;">
											<td>TB001</td>
											<td>Deepak kumar</td>
											<td>deep@gmail.com</td>
											<td>4</td>
											<td>No floors</td>
											<td>12/02/2022</td>
											<td>8:30 pm</td>

											<td style="font-size: 1.0rem;"><a href="#"
												data-bs-toggle="tooltip" data-bs-title="Edit"><i
													class='bx bx-edit'></i></a> | <a href="#"
												data-bs-toggle="tooltip" data-bs-title="Delete"><i
													class='bx bx-trash'></i></a></td>

										</tr>

									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>


				<!-------------------[ Emp click box ]----------------->
				<div class="row backimg p-1 d-flex justify-content-center"
					id="mainDiv">
					<div
						class="col-lg-3 col-md-5 col-sm-5 col-10 boxshadow p-2 text-center m-2"
						id="showEmp" onclick="showEmp()"
						style="background: linear-gradient(90deg, #cc2b5e, #753a88);">
						<h2 class="main-h1">Employee Details</h2>
						<p class="main-p">Click to add new employees, view their
							profiles, make changes in profile details, delete the employees.
						</p>
					</div>

					<!-------------------[ Customer click box ]----------------->
					<div class="col-md-5 col-lg-3 col-sm-5 boxshadow col-10 p-2 m-2"
						id="showCust" onclick="showCust()"
						style="background: linear-gradient(90deg, #000f96, #007be7);">
						<h2 class="main-h1">Customer details</h2>
						<p class="main-p">Click to Add new Customers, view their
							profiles, make changes in profile details, delete the Customer
							details.</p>
					</div>

					<!-------------------[ Order click box ]----------------->
					<div class="col-md-5 col-sm-5 col-lg-3 boxshadow p-2 m-2 col-10"
						id="showOrder"
						style="background: linear-gradient(90deg, #42275a → #734b6d);"
						onclick="showOrder()">
						<h2 class="main-h1">Order details</h2>
						<p class="main-p">Click to view the details, Check Status and
							timings of order and view all details of the customer's orders.</p>
					</div>

					<!-------------------[ Menu click box ]----------------->
					<div class="col-md-5 col-sm-5 boxshadow col-lg-3 col-10 p-2 m-2"
						id="showMenu"
						style="background: linear-gradient(90deg, #2c3e50, #bdc3c7);"
						onclick="showMenu()">
						<h2 class="main-h1">Menu Items</h2>
						<p class="main-p">Click to view the all menu items from the
							menu, add new items in menu, remove the menu item if its not
							available.</p>
					</div>

					<!-------------------[ Income click box ]----------------->
					<div
						class="col-md-5 col-sm-5 col-lg-3 boxshadow bg-success col-10 p-2 m-2"
						id="showIncome"
						style="background: linear-gradient(90deg, #02aab0, #00cdac);"
						onclick="showIncome()">
						<h2 class="main-h1">Income Reports</h2>
						<p class="main-p">Click to show daily to daily incomes of
							orders, perform other operations on the daily income report.</p>
					</div>

					<!-------------------[ table click box ]----------------->
					<div
						class="col-md-5 col-sm-5 col-lg-3 boxshadow bg-success col-10 p-2 m-2"
						id="showTable"
						style="background-image: linear-gradient(83.2deg, rgba(150, 93, 233, 1) 10.8%, rgba(99, 88, 238, 1) 94.3%);"
						onclick="showAdmin()">
						<h2 class="main-h1">Table Bookings</h2>
						<p class="main-p">Click to view the details of tables and
							floors booked by customers, maintain and notify about the floors
							and tables when free.</p>
					</div>

					<!-------------------[ help click box ]----------------->
					<div
						class="col-md-5 col-sm-5 boxshadow col-lg-3 bg-primary p-2 m-2 col-10"
						id="showhelp"
						style="background: linear-gradient(90deg, #eb3349, #f45c43);"
						onclick="showHelp()">
						<h2 class="main-h1">Help and support</h2>
						<p class="main-p">Reply to any queries or questions ask by the
							employees and customers if they have any kind of doubts</p>
					</div>

					<!-------------------[ Contact click box ]----------------->
					<div
						class="col-md-5 col-lg-3 col-sm-5 boxshadow bg-success p-1 m-2 col-10"
						id="showContact"
						style="background: linear-gradient(90deg, #56ab2f, #a8e063);"
						onclick="showContact()">
						<h2 class="main-h1">Contact us</h2>
						<p class="main-p">Make communication to the users who want to
							Contact with you using conact us form.</p>
					</div>


					<!-------------------[ feedback click box ]----------------->
					<div
						class="col-md-5 col-sm-5 col-lg-3 boxshadow bg-success p-1 m-2 col-10"
						id="showFeedback"
						style="background: linear-gradient(90deg, #ff7e5f, #feb47b);"
						onclick="showFeedback()">
						<h2 class="main-h1">Feedback details</h2>
						<p class="main-p">Click to views the feedback details of the
							users and view the reviews about the software.</p>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!----------[ Footer starts here ]------------------------>

	<div class="container-fluid footer pt-3">

		<div class="row box-container">
			<div class="col-lg-4 col-md-4 col-sm-6 box my-3">
				<h3>Branch Locations</h3>
				<a target="_blank" href="https://www.google.com/maps/place/Sector+49,+Noida,+Uttar+Pradesh/@28.5625027,77.3638769,15z/data=!3m1!4b1!4m5!3m4!1s0x390ce5f25ac323b5:0xd496afa2bb8dd672!8m2!3d28.5636272!4d77.3725608">Noida</a> 
				<a target="_blank" href="https://www.google.com/maps/place/Patna,+Bihar/@25.6081756,85.0730019,12z/data=!3m1!4b1!4m5!3m4!1s0x39f29937c52d4f05:0x831a0e05f607b270!8m2!3d25.5940947!4d85.1375645">Patna</a> 
				<a target="_blank" href="https://www.google.com/maps/place/201,+Subdhra+Joshi+Marg,+Shakti+Khand+III,+Indirapuram,+Ghaziabad,+Uttar+Pradesh+201014/@28.6496301,77.3608561,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfaba71329489:0xdf41a8f5a1319840!8m2!3d28.649625!4d77.363044">Indirapuram</a> 
				<a target="_blank" href="https://www.google.com/maps/place/Nyay+Khand+III,+Indirapuram,+Ghaziabad,+Uttar+Pradesh+201014/@28.640902,77.3544585,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfab5d837286f:0xce8b99de587f24e1!8m2!3d28.6407781!4d77.3569897">Nyay Khand</a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6 box my-3">
				<h3>Quick links</h3>
				<a href="/Foodie_Bandhu/#home">home</a> <a
					href="/Foodie_Bandhu/#about">About</a> <a
					href="/Foodie_Bandhu/#menu">Menu</a> <a
					href="/Foodie_Bandhu/#reservation">Reservation</a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6 box my-3">
				<h3>Contact info</h3>
				<p>
					<i class="bx bx-map"></i> noida, india 400104.
				</p>
				<p style="text-transform: lowercase">
					<i class="bx bx-envelope"></i> foodiebandhu1720@gmail.com
				</p>
				<p>
					<i class="bx bx-phone"></i> +91-7217697611
				</p>
			</div>

		</div>
		<div class="row bg-dark p-2">
			<h4 class="credit">
				created by <a href="#" style="text-decoration: none;">deeksha</a><span>&#169;</span>
				all rights reserved.
			</h4>
		</div>
	</div>
	<!--footer ends here  -->

	<div class="modal fade" id="updItemModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Update details of Item</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="font-size: 0.8rem;">
					<p style="font-style: italic; text-align: center;">"Fill All
						the details correctly to update Details of item"</p>
					<form action="updateImageAction" method="post"
						enctype="multipart/form-data">

						<div class="mb-1 row">
							<label for="imgid" class="col-sm-4 col-form-label">Dish
								ID</label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-sm"
									id="imgid" name="imgId" value="${myitem.imgId}"
									readonly="readonly">
							</div>
						</div>
						<div class="mb-1 row">
							<label for="name" class="col-sm-4 col-form-label">Dish
								Name</label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-sm"
									id="name" name="dishName" value="${myitem.dishName}">
							</div>
						</div>
						<div class="mb-1 row">
							<label for="type" class="col-sm-4 col-form-label">Dish
								Type</label>
							<div class="col-sm-8">
								<select class="form-select form-select-sm" name="dishType"
									aria-label=".form-select-sm example">
									<c:choose>
										<c:when test="${myitem.dishType=='Starter'}">
											<option value="Starter" selected="selected">Starter</option>
										</c:when>
										<c:otherwise>
											<option value="Starter">Starter</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${myitem.dishType=='main'}">

											<option value="main" selected="selected">Main-Dish</option>
										</c:when>
										<c:otherwise>

											<option value="main">Main-Dish</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${myitem.dishType=='dessert'}">

											<option value="dessert" selected="selected">Dessert</option>
										</c:when>
										<c:otherwise>

											<option value="dessert">Dessert</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${myitem.dishType=='beverage'}">
											<option value="beverage" selected="selected">Beverages</option>
										</c:when>
										<c:otherwise>
											<option value="beverage">Beverages</option>
										</c:otherwise>
									</c:choose>

								</select>
							</div>
						</div>
<c:if test="${not empty dmsg}">
              <script type="text/javascript">
                alert("${dmsg}");
            </script>
            </c:if>						<div class="mb-1 row">
							<label for="price" class="col-sm-4 col-form-label">Price</label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-sm"
									id="price" name="price" value="${myitem.price}">
							</div>
						</div>
						<div class="mb-1 row">
							<label for="type" class="col-sm-4 col-form-label">Quantity</label>
							<div class="col-sm-8">
								<select class="form-select form-select-sm" name="qty"
									aria-label=".form-select-sm example">

									<c:choose>
										<c:when test="${myitem.qty=='1'}">
											<option value="1" selected="selected">For 1 person</option>
										</c:when>
										<c:otherwise>
											<option value="1">For 1 person</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${myitem.qty=='2'}">
											<option value="2" selected="selected">For 2 person</option>
										</c:when>
										<c:otherwise>
											<option value="2">For 2 person</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${myitem.qty=='4'}">
											<option value="4" selected="selected">For 4 person</option>
										</c:when>
										<c:otherwise>
											<option value="4">For 4 person</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${myitem.qty=='8'}">
											<option value="8" selected="selected">For 8 person</option>
										</c:when>
										<c:otherwise>
											<option value="8">For 8 person</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</div>
						<div class="mb-1 row">
							<label for="type" class="col-sm-4 col-form-label">
								Image</label>
							<div class="col-sm-8">

								
									 <img alt="Dish Image"
									src="showImg/${myitem.imgId}"
									style="width: 10rem; height: auto;">

							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-success">Update
						Details</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	

<!--Update Employee Model Starts Here  -->

<div class="modal fade" id="EmpUpdateModal" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      <form class="px-auto " action="AdminUpdEmpRegis" method="post">
           <!--  <input type="text" value="EFB" hidden name="ucode"> -->
			<input type="text"  hidden="true" name="id" id="Uid">
			
                <div class="row mb-3"  >
                  <div class="col-lg-6 col-md-12">
                    <label for="fname">First Name</label>
                    <input type="text" class="form-control" id="Ufname"  name="fname" required >                  
                  </div>                             
                  <div class="col-lg-6 col-md-12">
                    <label for="lname">Last Name</label>
                    <input type="text" class="form-control" id="Ulname"  name="lname"  >    					
                  </div>
                </div>


                <div class="row mb-3"  >
                    <div class="col-lg-6 col-md-12">
                        <label for="phn">Phone</label>
                      <input type="text" class="form-control" id="Uphn" name="phn" placeholder="+91 7217697611" required  >
                		             
                
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <label for="mail">E-Mail</label>
                      <input type="text" class="form-control" id="Umail" name="mail"  required  >
                                        
                    </div>
                  </div>
                  
       
                  <div class="row mb-3 ">
                    <div class="col-lg-6 col-md-12 ">
                        <label for="deg">Designation</label>
                        <select class="form-control one" id="Udeg" name="designation" >
                            <option>Billing Manager</option>
                            <option>Restuarant staff</option>
                            <option>Waiter</option>
                            <option>Cleaning staff</option>
                            <option>Others</option>
                                                      
                          </select>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <label for="rsm">Salery</label>
                      <input type="text" class="form-control" id="Usal" name="salery" >
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <label for="add">Address</label>
                  <textarea   cols="45" rows="6" name="addr" id="Uadd"></textarea>
                  
                        
                </div>
                </div>               
               <button type="submit" class="btn btn-primary">Submit</button>
              </form>
      </div>
      </div>
      </div>
      
      </div>
     

<!--Update Employee Model ends here  -->

	<script>
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
		const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

        const myModal = document.getElementById('myModal')
        const myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', () => {
            myInput.focus()
        })
    </script>



</body>

<script type="text/javascript">
	function updEmpProfile(id,fname,lname,mail,phn,deg,sal,add)
	{
		console.log(" working upd Emp Profile function");
		/* console.log(Id,Fname,Lname,Mail,Phn,Designation); */
		 document.getElementById("Uid").setAttribute("value",id); 
		 document.getElementById("Ufname").setAttribute("value",fname);
		 document.getElementById("Ulname").setAttribute("value",lname);
		 document.getElementById("Umail").setAttribute("value",mail);
		 document.getElementById("Uphn").setAttribute("value",phn);
		 document.querySelector('#Udeg').value = deg;
		 document.getElementById("Usal").setAttribute("value",sal);
		 document.getElementById("Uadd").innerHTML=add; 
	} 
	
	</script>
</html>
