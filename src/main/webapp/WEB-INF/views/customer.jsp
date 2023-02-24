<%@page import="com.spring.Modal.AddMenuItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Dash board</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
	
<script type="text/javascript"
	src="<c:url value="/resource/js/addTocart.js"/>"></script>
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
<link rel="stylesheet" href='<c:url value="/resource/css/custt.css"/>'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Merienda&display=swap"
	rel="stylesheet">
</head>
<body onload="showCart()">
	<%
	String t = (String) request.getParameter("t");
	if (t != null) {
		if (t.equals("0")) {
	%>
	<script type="text/javascript">
			alert("Your Query is accepted and your ticket is successfully generated our executive will resolve your problem withing 48 hours./n For more information check your registered email id.")
			</script>

	<%
	}
	}
	%>
	<div class="header p-4"
		style="background: url('<c:url value="/resource/images/f1.jpg"/>') 0 0 no-repeat;background-size: cover;">
		<!-- nav starts here -->
		<nav class="navbar navbar-expand-lg navbar-dark text-white p-3 mb-3">
			<div class="container">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="nav ms-auto d-flex align-items-center order-lg-last">
				
				<span data-bs-toggle="modal" data-bs-target="#myCart" class="me-3">
						<i class='bx bxs-cart-alt text-white' style="font-size: 2.5rem;"></i>
						<span id="ctr"></span>
					</span>
						
					<img src='<c:url value="/resource/images/man.png"/>'
						alt="profile pic" class="man-img">

					<p class="mx-2 align-self-end">
						Hii!! ${user.fname} ${user.lname} <i
							class='bx bx-down-arrow' id="myi" onclick="openProfile()"></i>
					</p>

					<ul class="list-group text-center d-none" id="myul">
						<li class="list-group-item"><a href="profile"
							style="text-decoration: none; color: black;"> <i
								class='bx bxs-user-account'></i> Profile
						</a></li>
						<li class="list-group-item" style="cursor: pointer;"><a
							href="logoutControler"
							style="text-decoration: none; color: black;"> <i
								class='bx bx-exit'></i> Logout
						</a></li>
					</ul>
				</div>
				<div
					class="collapse navbar-collapse text-center order-lg-first my-3"
					id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#menu">Menu</a></li>
						<li class="nav-item"><a class="nav-link" href="order">Orders</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#booktable">Book
								Table</a></li>
						<li class="nav-item"><a class="nav-link" href="#help"
							data-bs-target="#help" data-bs-toggle="modal">Help&Support</a></li>

					</ul>
				</div>

			</div>

		</nav>
		<!-- cart starts  -->

		<div class="modal fade" tabindex="-1" id="myCart">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">My Cart</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="cartTable"></div>

					</div>

					<div id="total"></div>
					<!-- <div class="modal-footer">
					
					</div> -->
				</div>
			</div>
		</div>
		<!-- cart ends  -->
		
		<!-- Help and Support model starts here  -->

		<div class="modal fade" tabindex="-1" id="help">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header"
						style="background: linear-gradient(90deg, rgb(255, 217, 0), rgb(255, 239, 19), rgb(248, 211, 0));">
						<h3 class="modal-title">How can i help you???</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-dark">
						<h4 class="text-center">..Common questions..</h4>
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										Ques: How can i cancel my order??</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<b>Ans:</b> Follow steps to cancel order:
										<ol style="list-style-type: lower-latin;">
											<li>Go to home page</li>
											<li>Click on orders option from navigation bar</li>
											<li>Click on cancel order button.</li>
										</ol>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Ques: How to logout from website??</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<b>Ans:</b> Follow steps to logout from website :
										<ol style="list-style-type: lower-latin;">
											<li>Go to home page</li>
											<li>Click on your profile image.</li>
											<li>Click on logout button.</li>
										</ol>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Ques: How can i cancel my ordered table??</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse show"
									aria-labelledby="headingThree"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<p>
											<b>Ans:</b> To cancel your ordered table you need to contact
											Manager:
										<ol style="list-style-type: lower-latin;">
											<li>Fill your details in form given below</li>
											<li>Explain your issue</li>
											<li>submit your query</li>
											<li>Within 15-20 min your will get your Solution.</li>
										</ol>

									</div>
								</div>
							</div>
						</div>

						<div class="container p-1"
							style="background: url('<c:url value="/resource/images/help.jpg"/>') 0 0 no-repeat; background-size: cover;">

							<h4 class="text-center m-4">Share Your Query with us</h4>
							<form action="HelpandSupport" method="post">
								<div class="row">
									<input type="text" name="id" value="${user.id }" hidden>
									<div class="my-3 col-6">
										<label for="fname" class="form-label">First Name</label> <input
											type="text" class="form-control" id="fname" name="fname"
											readonly="readonly" value="${user.fname} ">

									</div>
									<div class="col-6 my-3">
										<label for="lname" class="form-label">Last Name</label> <input
											type="text" class="form-control" id="lname" name=lname
											readonly="readonly" value="${user.lname }">
									</div>
									<div class="col-6 mb-3">
										<label for="exampleInputEmail1" class="form-label">Email
											address</label> <input type="email" class="form-control"
											id="exampleInputEmail1" name="email" readonly="readonly"
											value="${user.mail }" aria-describedby="emailHelp">
									</div>
									<div class="col-6 mb-3">
										<label for="mob" class="form-label">Mobile No.</label> <input
											type="text" class="form-control" id="mob" name="mob"
											readonly="readonly" value="${user.phn }"
											aria-describedby="emailHelp">
									</div>
									<div class="col mb-3">
										<div class="form-floating">
											<textarea class="form-control"
												placeholder="Leave a comment here" id="floatingTextarea2"
												name="qta" style="height: 100px" required></textarea>
											<label for="floatingTextarea2">Write Your query
												here...</label>
										</div>
									</div>
								</div>
						</div>

					</div>
					<div class="modal-footer"
						style="background: linear-gradient(90deg, rgb(216, 184, 0), rgb(255, 238, 0), rgb(230, 195, 0));">
						<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success">Share Query</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--Help and support model ends here  -->
		<div class="container my-4">
			<!-- food image and content -->
			<div class="row ">
				<div class="col-3">
					<img src='<c:url value="/resource/images/food-logo.png"/>'
						alt="Foodie Bandhu logo" class="img-fluid food-logo">
				</div>
				<div class="col-9 text-white">
					<h1 class="text-gold d-inline p-1 head1">Welcome to Foodie
						Bandhu..!!</h1>
					<p class="lead food-cont-p d-block p-2">Flavour of Foodiees.
						Where every ingredient tells a story and your food dreams come
						true.The best ingredients from around the world to delight your
						senses Good Food in Minutes. Better Food. Better Body. Better
						World.....</p>
					<button class="btn"
						style="background: linear-gradient(90deg, rgb(255, 217, 0), rgb(252, 255, 93), rgb(255, 217, 0)); font-weight: bold;">
						<a href="#menu" class="text-dark" style="text-decoration: none;">Order
							Now >></a>
					</button>
				</div>
				<div class="col-lg-6 col-md-4 col-1"></div>
				<div class="col-lg-6 col-md-8 col-11 my-5">
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Find Your nearest Foodie bandhu branch.."
							aria-label="Search">
						<button class="btn btn-outline-warning" type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- menu part start here -->
	<div class="container mt-5" id="menu">
		<h1 class="text-center h1 mb-2">Select Your Dishes</h1>

		<!-- starters -->
		<div class="row">
			<h2 class="h2 mb-2">Starters</h2>
			<%
			List<AddMenuItem> list = (List) session.getAttribute("menuList");
			if (list != null) {
				System.out.println("list is working.....");
				int ctr = 1;
				for (AddMenuItem i : list) {
					if (ctr >= 5) {
				System.out.println(i);
				break;
					}
					if (i.getDishType().equals("Starter")) {
				ctr++;
			%>

			<div class="col-md-3 col-sm-6 mb-sm-3 col-6 mb-2">
				<div class="card">
					<img src="showImg/<%=i.getImgId()%>" alt="starter-1"
						class="card-img" style="width: auto; height: 11rem;">
					<div class="card-body">
						<h4 class="card-title"><%=i.getDishName()%></h4>
						<p class="card-text">
							Price:
							<%=i.getPrice()%>
							INR <br>Quantity: for
							<%=i.getQty()%>
							People
						</p>

						<div class="btns">
							<button class="cartbtn" id="cbtn" onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
							<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			}
			%>
			<div class="col-md-3 col-sm-6 mt-2 mb-4" style="cursor: pointer;"
				data-bs-target="#starter-modal" data-bs-toggle="modal">
				<h5 class="show">
					Show More<i class='bx bx-right-arrow'></i>
				</h5>
			</div>

			<div class="modal fade" tabindex="-1" id="starter-modal">
				<div class="modal-dialog modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="btn-close float-end"
								data-bs-dismiss="modal" aria-label="Close"></button>
							<div class="container">
								<h2 class="h2 mb-3">Starters</h2>
								<div class="row">
									<%
									
									if (list != null) 
									{
										for (AddMenuItem i : list) 
										{
									
											if (i.getDishType().equals("Starter")) {
									
									%>
									<div class="col-lg-4 col-md-6 col-sm-6 col-6 mb-sm-3 mb-2">
										<div class="card">
											<img src="showImg/<%=i.getImgId()%>" alt="starter-2"
												class="card-img" style="width: auto; height: 8rem;">
											<div class="card-body">
												<h5 class="card-title"><%=i.getDishName()%></h5>
												<p class="card-text">
													Price:
													<%=i.getPrice()%>INR <br>Quantity: for
													<%=i.getQty()%>
													people
												</p>
												<div
													class="btns d-flex flex-lg-column flex-sm-row flex-column">
													
														<button class="cartbtn mb-lg-1 mb-sm-0 mb-1" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
														
												<a href="Menuorder?id=<%=i.getImgId()%>" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-------------------------------- main dishes ----------------------------->

		<div class="row">
			<h2 class="h2 mb-2">Main Dishes</h2>
			<%
			if (list != null) {
				System.out.println("list is working.....");
				int ctr = 1;
				for (AddMenuItem i : list) {
					if (ctr >= 5) {
				System.out.println(i);
				break;
					}
					if (i.getDishType().equals("main")) {
				ctr++;
			%>

			<div class="col-md-3 col-sm-6 mb-sm-3 col-6 mb-2">
				<div class="card">
					<img src='showImg/<%=i.getImgId()%>' alt="starter-1"
						class="card-img" style="width: auto; height: 11rem;">
					<div class="card-body">
						<h5 class="card-title"
							style=" box-sizing: content-box;"><%=i.getDishName()%></h5>
						<p class="card-text">
							Price:
							<%=i.getPrice()%>INR <br>Quantity: for
							<%=i.getQty()%>
							people
						</p>
						<div class="btns">
						
						<button class="cartbtn" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
							<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			}
			%>

			<div class="col-md-3 col-sm-6 mb-4" style="cursor: pointer;"
				data-bs-target="#maindish-modal" data-bs-toggle="modal">
				<h5 class="show">
					Show More<i class='bx bx-right-arrow'></i>
				</h5>
			</div>

			<div class="modal fade" tabindex="-1" id="maindish-modal">
				<div class="modal-dialog modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="btn-close float-end"
								data-bs-dismiss="modal" aria-label="Close"></button>
							<div class="container">
								<h2 class="h2 mb-3">Main Dish</h2>
								<div class="row">
									<%
									if (list != null) {
										
										for (AddMenuItem i : list) {
										
											if (i.getDishType().equals("main")) {
										
									%>
									<div class="col-lg-4 col-md-6 col-sm-6 col-6 mb-sm-3 mb-2">
										<div class="card">
											<img src="showImg/<%=i.getImgId()%>" alt="starter-2"
												class="card-img" style="width: auto; height: 8rem;">
											<div class="card-body">
												<h5 class="card-title"><%=i.getDishName()%></h5>
												<p class="card-text">
													Price:
													<%=i.getPrice()%>INR <br>Quantity: for
													<%=i.getQty()%>
													people
												</p>
												<div
													class="btns d-flex flex-lg-column flex-sm-row flex-column">
												
												<button class="cartbtn mb-lg-1 mb-sm-0 mb-1" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
													<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									}
									%>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!----------------------- desserts ----------------------->

		<div class="row">
			<h2 class="h2 mb-2">Desserts</h2>
			<%
			if (list != null) {
				System.out.println("list is working.....");
				int ctr = 1;
				for (AddMenuItem i : list) {
					if (ctr >= 5) {
				System.out.println(i);
				break;
					}
					if (i.getDishType().equals("dessert")) {
				ctr++;
			%>

			<div class="col-md-3 col-sm-6 mb-sm-3 col-6 mb-2">
				<div class="card">
					<img src='showImg/<%=i.getImgId()%>' alt="starter-1"
						class="card-img" style="width: auto; height: 11rem;">
					<div class="card-body">
						<h5 class="card-title"><%=i.getDishName()%></h5>
						<p class="card-text">
							Price:
							<%=i.getPrice()%>INR <br>Quantity: for
							<%=i.getQty()%>
							people
						</p>
						<div class="btns">
							
						<button class="cartbtn" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
							<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			}
			%>

			<div class="col-md-3 col-sm-6 mb-4" style="cursor: pointer;"
				data-bs-target="#dessert-modal" data-bs-toggle="modal">
				<h5 class="show">
					Show More<i class='bx bx-right-arrow'></i>
				</h5>
			</div>

			<div class="modal fade" tabindex="-1" id="dessert-modal">
				<div class="modal-dialog modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="btn-close float-end"
								data-bs-dismiss="modal" aria-label="Close"></button>
							<div class="container">
								<h2 class="h2 mb-3">Dessert</h2>
								<div class="row">
									<%
									if (list != null) {

										for (AddMenuItem i : list) {

											if (i.getDishType().equals("dessert")) {
									%>
									<div class="col-lg-4 col-md-6 col-sm-6 col-6 mb-sm-3 mb-2">
										<div class="card">
											<img src="showImg/<%=i.getImgId()%>" alt="starter-2"
												class="card-img" style="width: auto; height: 8rem;">
											<div class="card-body">
												<h5 class="card-title"><%=i.getDishName()%></h5>
												<p class="card-text">
													Price:
													<%=i.getPrice()%>INR <br>Quantity: for
													<%=i.getQty()%>
													people
												</p>
												<div
													class="btns d-flex flex-lg-column flex-sm-row flex-column">
												<button class="cartbtn mb-lg-1 mb-sm-0 mb-1" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
								<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									}
									%>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!------------------------ beverages ---------------------->

		<div class="row">
			<h2 class="h2 mb-2">Beverages</h2>
			<%
			if (list != null) {
				System.out.println("list is working.....");
				int ctr = 1;
				for (AddMenuItem i : list) {
					if (ctr >= 5) {
				System.out.println(i);
				break;
					}
					if (i.getDishType().equals("beverage")) {
				ctr++;
			%>

			<div class="col-md-3 col-sm-6 mb-sm-3 col-6 mb-2">
				<div class="card">
					<img src='showImg/<%=i.getImgId()%>' alt="starter-1"
						class="card-img" style="width: auto; height: 11rem;">
					<div class="card-body">
						<h5 class="card-title"><%=i.getDishName()%></h5>
						<p class="card-text">
							Price:
							<%=i.getPrice()%>INR <br>Quantity: for
							<%=i.getQty()%>
							people
						</p>
						<div class="btns">
							<button class="cartbtn" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
							<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			}
			%>

			<div class="col-md-3 col-sm-6 mb-4" style="cursor: pointer;"
				data-bs-target="#drink-modal" data-bs-toggle="modal">
				<h5 class="show">
					Show More<i class='bx bx-right-arrow'></i>
				</h5>
			</div>

			<div class="modal fade" tabindex="-1" id="drink-modal">
				<div class="modal-dialog modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="btn-close float-end"
								data-bs-dismiss="modal" aria-label="Close"></button>
							<div class="container">
								<h2 class="h2 mb-3">Beverages</h2>
								<div class="row">
									<%
									if (list != null) {
										for (AddMenuItem i : list) {
											if (i.getDishType().equals("beverage")) {
									%>
									<div class="col-lg-4 col-md-6 col-sm-6 col-6 mb-sm-3 mb-2">
										<div class="card">
											<img src="showImg/<%=i.getImgId()%>" alt="starter-2"
												class="card-img" style="width: auto; height: 8rem;">
											<div class="card-body">
												<h5 class="card-title"><%=i.getDishName()%></h5>
												<p class="card-text">
													Price:
													<%=i.getPrice()%>INR <br>Quantity: for
													<%=i.getQty()%>
													people
												</p>
												<div
													class="btns d-flex flex-lg-column flex-sm-row flex-column">
									<button class="cartbtn mb-lg-1 mb-sm-0 mb-1" id="cbtn"
								onclick="addToCart(${user.id },<%=i.getImgId()%>,'<%=i.getDishName()%>','<%=i.getDishType()%>',<%=i.getPrice()%>,<%=1%>)">Add
								to cart</button>
													<a href="Menuorder?id=<%=i.getImgId()%>&uid=${user.id}" style="text-decoration: none;text-align: center" class="orderbtn">Order now</a>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									}
									%>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
<div id="msgs">
		<!-- Button trigger modal -->
		<button type="button" id="add" class="btn btn-primary" data-bs-toggle="modal" 
			data-bs-target="#addcart" style="display: none;">Add</button>
			
		<button type="button" id="qty" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#addqty" style="display: none;">increse</button>
			
		<button type="button" id="del" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#delcart" style="display: none;">del</button>

		<!-- Modal -->
		<div class="modal fade" id="addcart" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
					<p class="text-center">!!..Dish is added to cart successfully..!!</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="addqty" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
					<p class="text-center">!!..Dish is already in cart. Quantity is increased..!!</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="delcart" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
					<p class="text-center">!!..Dish is Removed from cart..!!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--[ book your table ]-->
  <div class="booktable py-3 pb-5">
    <div class="container" id="booktable">
      <div class="row">
        <h1 class="th1 text-center my-3" style="color: rgb(255, 217, 0);">Book
          Your Table</h1>
        <div class="col-lg-6 col-md-8 col-sm-10 col-12 m-auto">
          <form action="BookTable" method="post" class="form-floating">
          
          <input type="text" name="userID" value="${user.id }" hidden="true">
          
            <div class="form-floating mb-2">
              <input type="text" class="form-control" id="custname"
                placeholder="Enter Your name" name="userName"
                onchange="custValidName()" required pattern="[A-Za-z ]{1,32}"
                title="Name doesnot contain number and special character and It shoud be less then 30 characters"
                style="box-shadow: none; border: 2px solid rgb(255, 217, 0);">
              <label for="custname">Enter Name</label>
              <div class="valid-feedback" id="validname">Perfect!</div>
              <div class="invalid-feedback" id="invalidname">Please
                provide a valid name.</div>
            </div>

            <div class="form-floating mb-2">
              <input type="email" class="form-control" id="custmail"
                placeholder="name@example.com" onchange="custValidMail()"
                required="required" name="userMail"
                style="box-shadow: none; border: 2px solid rgb(255, 217, 0);">
                
              <label for="custmail">Email address</label>
              <div class="valid-feedback" id="validname">Perfect!</div>
              <div class="invalid-feedback" id="invalidname">Please
                provide a valid E-mail address.</div>
            </div>

            <div class="form-floating mb-2">
              <select class="form-select" id="selectfloor" name="floor"
                onchange="myfun()" aria-label="Floating label select example"
                style="box-shadow: none; border: 2px solid rgb(255, 217, 0);">
                <option>Select No. of floors</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
                <option value="4">Four</option>
              </select> <label for="selectfloor" style="color: black;">Choose
                Number of floors you want to book</label>
            </div>
            <div class="form-floating mb-2">
              <select class="form-select" id="selectTime" name="floorsTime"
                onchange="myfun()" aria-label="Floating label select example"
                style="box-shadow: none; display: none; border: 2px solid rgb(255, 217, 0);">
                <option>Select Timing</option>
                <option value="4">4</option>
                <option value="8">8</option>
                <option value="12">12</option>
                <option value="customize">Customize</option>
              </select> <label for="selectTime" style="color: black;">How much
                time you want to spend??</label>
            </div>

            <div class="form-floating mb-2">
              <input type="number" class="form-control" id="tHours" name="timeInHour"
                placeholder="enter Hours" min="0"
                style="box-shadow: none; display: none; border: 2px solid rgb(255, 217, 0);"
                max="4"> <label for="tHours">How much time you
                want to spend??(Hours*)</label>
            </div>

            <div class="form-floating mb-2">
              <input type="number" class="form-control" id="noOfSeats"
                placeholder="Enter Your name"
                style="box-shadow: none; border: 2px solid rgb(255, 217, 0);"
                min="0" max="16"> <label for="nooftable">Enter
                no of table</label>
            </div><div class="form-floating mb-2">
              <input type="date" class="form-control" id="tDate" name="bookingDate" 
                style="box-shadow: none; border: 2px solid rgb(255, 217, 0)" pattern="yyyy-MM-dd">
              <label for="tDate">Enter Date</label>
              <div class="valid-feedback" id="validname">Perfect!</div>
              <div class="invalid-feedback" id="invalidname">Please
                provide a valid date </div>
            </div>

            <div class="form-floating mb-2">
              <input type="time" class="form-control" id="tTime" min="8:30"
                max="18:00" name="bookingSlot" pattern="hh:mm"
                style="box-shadow: none; border: 2px solid rgb(255, 217, 0);">
              <label for="tTime">Enter Time</label>
            </div>

            <div class="d-grid gap-2">
              <button class="btn btn-warning" type="submit">Book your
                table now</button>
              <button class="btn btn-outline-warning" type="reset">Clear</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
<%
  String bk=request.getParameter("bookMsg");
  if(bk!=null)
  {
    if(bk.equals("booked"))
    {
      %>
      <script type="text/javascript">
        alert("Your table has been Booked successfully.\nPlease Check you mail for the booking details.");
      </script>
      <%
    }
  }
%>
	<div class="container-fluid footer pt-3 pb-0">

		<div class="row box-container">
			<div class="col-lg-4 col-md-4 col-sm-6 box my-3">
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
		<div class="row">
			<h1 class="credit">
				created by <a href="#" style="text-decoration: none;">deeksha</a><span>&#169;</span>
				all rights reserved.
			</h1>
		</div>
	</div>
	<!-- footer section ends -->
	<script>
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

        function openProfile() {
            console.log("openProfile is called");
            document.getElementById("myul").classList.toggle("d-none");

            document.getElementById("myi").classList.toggle("bx-up-arrow");

        }

        function custValidName() {
            var regex = /^[a-zA-Z ]{2,30}$/;
            var custname = document.getElementById("custname").value;

            if (regex.test(custname)) {
                document.getElementById("custname").classList.add("is-valid");
                document.getElementById("custname").classList.remove("is-invalid");

            } else {
                document.getElementById("custname").classList.add("is-invalid");
                document.getElementById("custname").classList.remove("is-valid");
            }
        }

        function custValidMail() {
            var custmail = document.getElementById("custmail").value;
            var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

            if (mailformat.test(custmail)) {
                document.getElementById("custmail").classList.add("is-valid");
                document.getElementById("custmail").classList.remove("is-invalid");

            } else {
                document.getElementById("custmail").classList.add("is-invalid");
                document.getElementById("custmail").classList.remove("is-valid");
            }

        }

        function myfun() {
            var val1 = document.getElementById("selectfloor").value;

            if (val1 == 1 || val1 == 2 || val1 == 3 || val1 == 4) {
                document.getElementById("nooftable").style.display = "none";
                document.getElementById("selectTime").style.display = "block";
                var val2 = document.getElementById("selectTime").value;
                if (val2 == "customize") {
                    document.getElementById("tHours").style.display = "block";
                } else {
                    document.getElementById("tHours").style.display = "none";
                }

            } else {
                document.getElementById("tHours").style.display = "none";
                document.getElementById("nooftable").style.display = "block";
            }
        }
    </script>
</body>
</html>