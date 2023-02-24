<%@page import="java.util.Iterator"%>
<%@page import="com.spring.Modal.AddMenuItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
<link rel="stylesheet" href='<c:url value="/resource/css/custt.css"/>'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'rel='stylesheet'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merienda&display=swap"rel="stylesheet">
<title>Order</title>
</head>


<body style="overflow-x:hidden">
<!--Navbar Starts here  -->
 <div class="container-fluid" style="box-shadow: 0.09rem 0.09rem 0.3rem 0.010rem rgb(156, 156, 156);">
        <div class="row">
            <div class="col-12 bg-dark">
                <div class="imageback d-flex justify-content-between align-items-center">
                    <div class="img">
                        <img src='<c:url value="/resource/images/food-logo.png"/>' alt="logo" style="height: 7rem; width: auto;">
                   </div>           
                    <a class="bottomNav" onclick="history.go(-1); return false;"> <i class='bx bx-left-arrow-alt' style="font-size: 3rem; color: white; "></i></a>                     
                </div>
            </div>
            
</div>
<!--Navbar ends here  -->
<!--Home page order starts here  -->
<%

String order=(String)request.getAttribute("order");
 
if(order!=null)
	{
	if(order.equals("0"))
	{
		int price=(Integer)request.getAttribute("price");		
%>

<div class="container mt-5 border shadow">
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Dish ID</th>
      <th scope="col">Dish Name</th>
      <th scope="col">Dish Quantity</th>
      <th scope="col">Dish Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">FBDID00${menu.getImgId()}</th>
      <td>${menu.getDishName()}</td>
      <td>1 Quantity for ${menu.getQty()} People</td>
      <td>${menu.getPrice()}</td>
    </tr>
      </tbody>
</table>
<h6 style="font-weight: bold;"> Total Discount Section:</h6>
  <table class="table table-striped bg-white border" style="margin-top: 2%;width: max-content;">
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          
          <th>CGST+SGST</th>
          <th>Delivery Charges</th>
          <th>MRP</th>
          <th>Customer Discount</th>
          <th>Total Price</th>
     </tr>
  </thead>
  <tbody>
    
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>3% of Total Rate</td>
        <td >70 INR</td>
        <td>${menu.getPrice()} INR</td>
        <td>5% of MRP</td>
         <td><%=(price+(price*3/100)-(price*5/100))+199%> INR</td>
       
    </tr>
    

    

  </tbody>
</table>
<h6 style="font-weight: bold;"> Payment Section:</h6>
<form action="" class="mb-5">
<div class="form-check">
  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
  <label class="form-check-label" for="exampleRadios1">
    Cash On Delivery
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
  <label class="form-check-label" for="exampleRadios2">
    Online Payment On Delivery
  </label>
</div>
<div>
<input hidden="true" type="text" value="${user.fname }">
<input hidden="true" type="text" value="${user.lname }">
<input hidden="true" type="text" value="${user.id }">
<input hidden="true" type="text" value="${user.addr }" id="add">

<button type="submit" class="btn btn-primary mt-5 mb-5" id="orderbtn" >Check Out</button>
</div>
</form>
</div>
</div>	
<!--Home page order ends here  -->
<!--Add to cart page order starts here  -->
<% }else if(order.equals("1"))
	{		int total=0;
	
	%>
<div class="container mt-5 border shadow">
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Dish ID</th>
      <th scope="col">Dish Name</th>
      <th scope="col">Dish Quantity</th>
      <th scope="col">MRP</th>
      <th scope="col">Total Price</th>
    </tr>
  </thead>
	
	
	<tbody>
    <%	List<AddMenuItem> menu = (List)session.getAttribute("menu");
   		List<String> quantity = (List)session.getAttribute("quantity");
   		Iterator<AddMenuItem> iterator1=menu.iterator();
   		Iterator<String> iterator=quantity.iterator();
   		
   		
		if (menu != null) {
			while(iterator1.hasNext() || iterator.hasNext()  )  
				{
					AddMenuItem m=iterator1.next();
					String qty=iterator.next();
					int q=Integer.parseInt(qty);
					int j=m.getPrice()*q;
					total=total+j;
					
				%>
				
				
    <tr>
      <th id="did">FBDID00<%=m.getImgId() %></th>
      <td><%=m.getDishName() %></td>
      <td><%=qty%></td>
      <td><%=m.getPrice() %></td>
      <td><%=m.getPrice()*q %></td>
     
	<% }}%>
 </tr>
</tbody>
</table>
<h6 style="font-weight: bold;"> Total Discount Section:</h6>
  <table class="table table-striped bg-white border" style="margin-top: 2%;width: max-content;">
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          
          <th>CGST+SGST</th>
          <th>Delivery Charges</th>
          <th>Total Price</th>
          <th>Customer Discount</th>
          <th>Sub Total</th>
     </tr>
  </thead>
  <tbody>
    
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>3% of Total Rate</td>
        <td >70 INR</td>
        <td><%=total%> INR</td>
        <td>5% of Total Price</td>
        <td><%=(total+(total*3/100)-(total*5/100))+199%> INR</td>    
    </tr>
    

    

  </tbody>
</table>
<h6 style="font-weight: bold;"> Payment Section:</h6>
<form action="OrderAction" method="post" class="mb-5">
<div class="form-check">
  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
  <label class="form-check-label" for="exampleRadios1">
    Cash On Delivery
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
  <label class="form-check-label" for="exampleRadios2">
    Online Payment On Delivery
  </label>
</div>
<div>
<input hidden="true" type="text" value="${user.fname }">
<input hidden="true" type="text" value="${user.lname }">
<input hidden="true" type="text" value="${user.id }">
<input hidden="true" type="text" value="${user.addr }" id="add">

<select multiple="multiple" hidden="hidden" name="did">
<%
Iterator<AddMenuItem> i=menu.iterator();
Iterator<String> j=quantity.iterator();
System.out.print("hello world");
if (menu != null) {
	System.out.print("hello world2");
			while(i.hasNext() || j.hasNext()  )  
				{
				System.out.print("hello world3");
					AddMenuItem m=i.next();
					System.out.print(m.getDishName());
					String qty=j.next();
					int q=Integer.parseInt(qty);
					int k=m.getPrice()*q;
					total=total+k;
					
				%>




<option value="<%out.print(m.getImgId());%>" selected><%out.print(m.getDishName());%></option>
<%}}%>
</select >

<select multiple="multiple" hidden="hidden" name="qty">
<%
Iterator<AddMenuItem> k=menu.iterator();
Iterator<String> l=quantity.iterator();
System.out.print("hello world");
if (menu != null) {
	System.out.print("hello world2");
			while(k.hasNext() || l.hasNext()  )  
				{
				System.out.print("hello world3");
					AddMenuItem m=k.next();
					System.out.print(m.getDishName());
					String qty=l.next();
					int q=Integer.parseInt(qty);
					int o=m.getPrice()*q;
					total=total+o;
					
				%>




<option value="<%out.print(qty);%>" selected><%out.print(qty);%></option>
<%}}%>
</select>






















<button type="submit" class="btn btn-primary mt-5 mb-5" id="orderbtn" >Check Out</button>
</div>
</form>
</div>
		
<%}} %>



<!--Add to cart page order ends here  -->

<div class="row" >
            <div class="footer bg-dark text-white text-center col-12 p-1">
                <h5>Designed by &copy;Deeksha Developers</h5>
            </div>
        </div>
</body>
<script type="text/javascript">
console.log(" working order");

var add=document.getElementById("add").value;

console.log("address is"+add);
if(add.trim() ==='')
	{
	console.log("address is"+add);
	document.getElementById("orderbtn").innerHTML="Please First go to profile and set your current address";
	document.getElementById("orderbtn").setAttribute("disabled","disabled");
	}
console.log(" working order");	

</script>
</html>