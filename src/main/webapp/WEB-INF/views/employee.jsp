<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/employee.css"/>'>

</head>
<body>
  
<div class="sidebar">
  <a class="navbar-brand" href="#">
    <img
         src='<c:url value="/resource/images/logo.png"/>'
         width="80%"
         alt=""
         loading="lazy"
         />
  </a>
  <a class="active" href="#home">Home</a>
  
  <a href="#order" onclick="order()">Order</a>
  <a href="#bills" onclick="billss()">Bills</a>
  <a href="#income" onclick="incomee()">Income</a>
  <a href="logoutControler">Logout</a>
  
</div>
<div class="maincontent">
<div class="bg-white">
  <h3 class="text-center mt-2">Billing Management</h3>
</div>
<div class="container con">
  
  <div class="row mb-3  ">


    <div class="col-lg-3 col-sm-9 text-center  column c1" >
        <a href="profile" style="text-decoration: none; "> PROFILE</a>
      <p style="font-weight: normal;">
        <span>Click to see your profile(personal data) also you can change and update your data</span>
    </p>
    </div>





    <div class="c2 col-lg-3 col-sm-9  text-center "style="border-radius:5% ;margin-bottom: 2%;margin-top:2%; font-weight: bold;" ><a href="#income" style="text-decoration: none;" onclick="incomee()"> DAILY INCOME</a>
      <p style="font-weight: normal;"><span>Click to see and generate the daily income reports of the restuarant</span></p>
    </div>
    <div class=" c3 col-lg-3 col-sm-9 text-center  " style="font-weight: bold; border-radius:5% ;margin-bottom: 2%;margin-top:2%;"><a href="#bills" style="text-decoration: none;" onclick="billss()"> CUSTOMER'S BILLS</a>
      <p style="font-weight: normal;"><span>Click to see and analy ze all the customer order bills here</span></p>
    </div>
    
  </div>
</div>
<!-- Income starts here -->

<div class="content2" id="income" >
    <div class="bg-white">
        <h3 class="text-center mt-2">Daily Income</h3>
      </div>
      <h6 style="font-weight: bold;"> Total Sales Section:</h6>   
  <table class="table table-striped bg-white border" style="margin-top: 2%;">
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          <th>Product-ID</th>
          <th>Product-Name</th>
          <th>MRP</th>
          <th>Sales</th>
          <th>Total</th>
     </tr>
  </thead>
  <tbody>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord001</td>
        <td >Foods</td>
        <td>120INR</td>
        <td>20 unit</td>
        <td>2400 INR</td>
       
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord002</td>
        <td >Mutter Pulao</td>
        <td>120INR</td>
        <td>20 unit</td>
        <td>2400 INR</td>
       
    </tr>        
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord003</td>
        <td >Beverages</td>
        <td>120INR</td>
        <td>20 unit</td>
        <td>2400 INR</td>
       
    </tr>

    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord004</td>
        <td >Sahii Panner</td>
        <td>120INR</td>
        <td>20 unit</td>
        <td>2400 INR</td>
       
    </tr>
  

  </tbody>


  </table>
  <h6 style="font-weight: bold;"> Total Discount Section:</h6>
  <table class="table table-striped bg-white border" style="margin-top: 2%;width: max-content;">
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          <th>Customer Discount</th>
          <th>Complementary Discount</th>
          <th>Other</th>
          <th>Total</th>
     </tr>
  </thead>
  <tbody>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>850 INR</td>
        <td >500 INR</td>
        
        <td></td>
        <td>1600 INR</td>
       
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>850 INR</td>
        <td >500 INR</td>
        
        <td>50</td>
        <td>1600 INR</td>
       
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>850 INR</td>
        <td >500 INR</td>
        
        <td>700</td>
        <td>1600 INR</td>
       
    </tr>

    <tr class="text-center" style="font-size: 0.8rem;">
        <td>850 INR</td>
        <td >500 INR</td>
        <td>250 INR</td>
        
        <td>1600 INR</td>
       
    </tr>
  

  </tbody>


  </table>
  <h6 style="font-weight: bold;"> Payment Mode Section:</h6>
  <table class="table table-striped bg-white border" style="margin-top: 2%; width: max-content;">
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          <th>Online Mode</th>
          <th>Cash Mode</th>
          <th>Total</th>
     </tr>
  </thead>
  <tbody>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>850 INR</td>
        <td >500 INR</td>      
        <td>1600 INR</td>
       
    </tr>
   
  </tbody>


  </table>
  <form action="" style="margin-bottom: 2%;">
    <label for="total">Total Income</label>
    <input type="text" disabled value="80000">
    <button type="submit">Generate Income report</button>
  </form>
</div>

<!-- Income Ends here -->














<!-- Biils -->
<div class="content2" id="bills">
    <div class="bg-white">
        <h3 class="text-center mt-2">Customer's Bills</h3>
      </div>
  <table class="table table-striped bg-white border" style="margin-top: 2%;">
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          <th>Order-ID</th>
          <th>Item Details</th>
          <th>Total price</th>
          <th>Ordered by</th>
          <th>Final Bill</th>
     </tr>
  </thead>
  <tbody>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord001</td>
        <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
            style="cursor: pointer;">View item details
        </td>

        <td>120INR</td>
        <td>Ruhi Verma</td>
        <td>blob</td>
       
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord002</td>
        <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
            style="cursor: pointer;">View item details
        </td>

        <td>120INR</td>
        <td>Deepak Verma</td>
        <td>blob</td>
       
            
      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Kahkasha</td>
          <td>blob</td>
       
      </tr>

      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Kahkasha khan</td>
          <td>blob</td>
       
      </tr>
  

  </tbody>


  </table>
</div>















<div class="content" id="order">
<div class="bg-white" id="">
        <h3 class="text-center mt-2">Customer's Order</h3>
      </div>
  <table class="table table-striped bg-white border" style="margin-top: 2%;">
    
    <thead class="thead-light" style="font-size: 0.9rem;">
      <tr class="text-center">
          <th>Order-ID</th>
          <th>Item Details</th>
          <th>Total price</th>
          <th>Ordered by</th>
          <th>Invoice</th>
          <th>Order status</th>
          <th>Payment status</th>
          <th>Action</th>
      </tr>
  </thead>
  <tbody>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord001</td>
        <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
            style="cursor: pointer;">View item details
        </td>

        <td>120INR</td>
        <td>Ruhi Verma</td>
        <td><a>View</a></td>
        <td>
            Not Delivered
        </td>
        <td>
            Not Paid
        </td>
        <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                <a href="#" data-bs-toggle="tooltip"
                data-bs-title="Edit"><i class='bx bx-edit'></i></a></td>
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord002</td>
        <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
            style="cursor: pointer;">View item details
        </td>

        <td>120INR</td>
        <td>Deep Verma</td>
        <td>view</td>
        <td>
            Not Delivered
        </td>
        <td>
            Not Paid
        </td>
        <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                <a href="#" data-bs-toggle="tooltip"
                data-bs-title="Generate Invoice"><i class='bx bx-edit'></i></a></td>
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord003</td>
        <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
            style="cursor: pointer;">View item details
        </td>

        <td>120INR</td>
        <td>Deepak Verma</td>
        <td>View</td>
        <td>
            Not Delivered
        </td>
        <td>
            Not Paid
        </td>
        <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                <a href="#" data-bs-toggle="tooltip"
                data-bs-title="Generate Invoice"><i class='bx bx-edit'></i></a></td>
    </tr>
    <tr class="text-center" style="font-size: 0.8rem;">
        <td>Ord004</td>
        <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
            style="cursor: pointer;">View item details
        </td>

        <td>120INR</td>
        <td>Deepak Kumar</td>
        <td>View</td>
        <td>
            Not Delivered
        </td>
        <td>
            Not Paid
        </td>
        <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                <a href="#" data-bs-toggle="tooltip"
                data-bs-title="Generate Invoice"><i class='bx bx-edit'></i></a></td>
    </tr>
      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord005</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Kahkasha Khan</td>
          <td>View</td>
          <td>
              Not Delivered
          </td>
          <td>
              Not Paid
          </td>
          <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                  style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                  <a href="#" data-bs-toggle="tooltip"
                  data-bs-title="Generate Invoice"><i class='bx bx-edit'></i></a></td>
      </tr>
      <!-- <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Ruhi Verma</td>
          <td>blob</td>
          <td>
              Not Delivered
          </td>
          <td>
              Not Paid
          </td>
          <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                  style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                  <a href="#" data-bs-toggle="tooltip"
                  data-bs-title="Edit"><i class='bx bx-edit'></i></a></td>
      </tr>
      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Ruhi Verma</td>
          <td>blob</td>
          <td>
              Not Delivered
          </td>
          <td>
              Not Paid
          </td>
          <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                  style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                  <a href="#" data-bs-toggle="tooltip"
                  data-bs-title="Edit"><i class='bx bx-edit'></i></a></td>
      </tr>
      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Ruhi Verma</td>
          <td>blob</td>
          <td>
              Not Delivered
          </td>
          <td>
              Not Paid
          </td>
          <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                  style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                  <a href="#" data-bs-toggle="tooltip"
                  data-bs-title="Edit"><i class='bx bx-edit'></i></a></td>
      </tr>
      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Ruhi Verma</td>
          <td>blob</td>
          <td>
              Not Delivered
          </td>
          <td>
              Not Paid
          </td>
          <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                  style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                  <a href="#" data-bs-toggle="tooltip"
                  data-bs-title="Edit"><i class='bx bx-edit'></i></a></td>
      </tr>

      <tr class="text-center" style="font-size: 0.8rem;">
          <td>Ord001</td>
          <td data-bs-toggle="modal" data-bs-target="#orderDeatils"
              style="cursor: pointer;">View item details
          </td>

          <td>120INR</td>
          <td>Ruhi Verma</td>
          <td>blob</td>
          <td>
              Not Delivered
          </td>
          <td>
              Not Paid
          </td>
          <td><a href="#" data-bs-toggle="tooltip" data-bs-title="Cancel"
                  style="font-size: 1rem;"><i class='bx bx-trash'></i></a>|
                  <a href="#" data-bs-toggle="tooltip"
                  data-bs-title="Edit"><i class='bx bx-edit'></i></a></td>
      </tr>
 -->  

  </tbody>


  </table>
</div>
</div>
<!-- Order details -->
<div class="modal" tabindex="-1" id="orderDeatils" style="font-size: 0.8rem;">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h4 class="modal-title">Ordered Item Details</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
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

























<div class="foot">
  <!-- footer starts here -->
  <div class="footer">

    <div class="box-container">

        <div class="box">
            <h3>branch locations</h3>
            <a href="#">Noida</a>
            <a href="#">Patna</a>
            <a href="#">Mayur Vihar Phase-3</a>
            <a href="#">Nyay Khand</a>
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

    <h1 class="credit">created by <a href="#">deeksha	</a><span>&#169;</span> all rights reserved. </h1>
</div>
<!--footer ends here  -->
</div>
<script>
    var orders=document.getElementById("order");
    var bill=document.getElementById("bills");
    var incomes=document.getElementById("income");
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

  const myModal = document.getElementById('myModal')
  const myInput = document.getElementById('myInput')

  myModal.addEventListener('shown.bs.modal', () => {
      myInput.focus()
  })

  function order()
  {
    orders.style.display="block";
    bills.style.display="none";
    income.style.display="none";

  }
  function billss()
  {
    orders.style.display="none";
    bill.style.display="block";
    income.style.display="none";

  }
  function incomee()
  {
    orders.style.display="none";
    bills.style.display="none";
    incomes.style.display="block";

  }
</script>
</body>
</html>
