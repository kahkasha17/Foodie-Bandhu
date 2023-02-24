
/* add to cart starts */

/*step-1: create a function that accept the dish id,name,price,type,qty */
function addToCart(uId,dId, dName, dType, dPrice, dQty) {
	/*2: Now get the value of 'cart' in which our dished will store from localstorage */

	let cart = localStorage.getItem("cart");

	/*3: now check the cart if its is exist or not. if it is not exist then
		  we will create the cart other wise we will add the data in existing cart*/

	if (cart == null) {
		/* cart is null means it is not exist we need to create it*/
		/* to create a cart we need to need to create an array of objects that contain multiple dish objects.*/
		let dishes = [];

		/* now we need to create an object of our dish and in javascript we create object as key,value pair.*/
		let dish = { userId:uId,dishId: dId, dishName: dName, dishType: dType, dishPrice: dPrice, dishQty: dQty };

		/* add this dish object to our dishes array*/
		dishes.push(dish);

		/* now add this array ion localstorage as cart*/
		/* as thge localstogare take the key and value as only string so need to cast the object array in to string*/
		/* so we use JSON.stringify method. which convert object to string */

		localStorage.setItem("cart", JSON.stringify(dishes));

		document.getElementById("add").click();

		console.log("Cart is created and First item is added to cart");
	} else {
		/* cart is not null means it exist we can add the dish in existing cart.*/
		/* the cart is already exist and it return the data as simple string
		 so we need to convert it into javascript object which is an array object */
		let existingCart = JSON.parse(cart);
		console.log("existing cart is get");
		/* now we need to check that the dish is already present in cart or not.*/
		/* to check whether our dish is present in cart or not we can check the ids of 
		existing dish and new dish. to get the id of existing dish we can use the callback fun of javascriot ehich is find*/
		/* now inside find callback function we can an another callback function 
			that get the item one by one using item from existing cart*/

		let oldDish = existingCart.find((item) => item.dishId == dId);


		/*now it will return check dishid from list of cart and if it is found the it return the oldDish */
		/* now if the dish is found then increase its quantity and if the dish is not found then 
		  add it to cart.*/
		console.log("Old product is " + oldDish);


		if (oldDish) {
			/* incrase the quantity of dish*/
			/* now increase the quantity and price of existing cart */
			oldDish.dishQty = oldDish.dishQty * 2;

			oldDish.dishPrice = oldDish.dishPrice * 2;

			/* now update the price and quantity in existing cart so we use map function 
			that take key and return the items of dish*/
			existingCart.map((item) => {
				/* now check kro ki list ke items ko old dish se usinng id*/

				if (oldDish.dishId == item.dishId) {
					item.dishPrice = oldDish.dishPrice;
					item.dishQty = oldDish.dishQty;
				}
			})

			/* now update the cart */

			localStorage.setItem("cart", JSON.stringify(existingCart));
			console.log("Dish is already exist. quantity is increased");
			document.getElementById("qty").click();

		} else {
			/* add the new dish to cart. create a new dish object*/
			let newDish = { userId:uId,dishId: dId, dishName: dName, dishType: dType, dishPrice: dPrice, dishQty: dQty };
			/*now add this dish into existing cart*/

			existingCart.push(newDish);
			/* now update the localStrorage*/

			localStorage.setItem("cart", JSON.stringify(existingCart));
			console.log("New Item is added to cart");

			document.getElementById("add").click();
		}
	}
	showCart();
}
/* addto cart ends */

/* show the details in cart */
/* sbowCart method is used to show the detals in cart */
function showCart() {
	/* first we need to get the cart from localstorage */
	let cartString = localStorage.getItem("cart");

	/* now conver this string cart into javacsript array object using parse function */
	let cart = JSON.parse(cartString);

	if (cart == null || cart.length == 0) {
		console.log("cart is empty");
		document.getElementById("ctr").innerHTML = "(0)";
		document.getElementById("cartTable").innerHTML = "<h4 class='text-center'>Cart is empty. Add Dishes now.</h4>";
		document.getElementById("total").innerHTML = "<h5 class='text-center'>Add Item now</h5>";


	} else {
		console.log("length is " + cart.length);
		/*document.getElementById("ctr").innerHTML=cart.length;*/
		$("#ctr").html(`(${cart.length})`);

		let table = `
					<table class='table'>
					<thead>
						<tr>
							<th>Dish Name</th>
							<th>Dish Type</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Remove</th>
						</tr>
					</thead>
					<tbody>
				`;

		let total=0;
		
		let uids="";
		let dids="";
		let dnames="";
		let dprices="";
		let dtypes="";
		let dqtys="";

		cart.map((item) => {
			uids=uids+item.userId+":";
			dids = dids+item.dishId+":";
			dnames =dnames+item.dishName+":";
			dprices =dprices+ item.dishPrice+":";
			dtypes =dtypes+ item.dishType+":";
			dqtys =dqtys+item.dishQty+":";
			total=total+item.dishPrice;
		});
		console.log("did=" + dids + "dname" + dnames + "dishtype" + dtypes);
		
		cart.map((item) => {

			table += `
						<tr>
							<td>${item.dishName}</td>	
							<td>${item.dishType}</td>	
							<td>${item.dishQty}</td>	
							<td>${item.dishPrice}</td>
					<td class='text-center'><a href="#" onclick='deleteItem(${item.dishId})' data-bs-toggle="tooltip" data-bs-title="Delete" style='color:red;font-size:1.1rem;'><i class='bx bx-trash'></i></a></td>
						</tr>
					`;
		});

		table = table + "</tbody></table>";
		document.getElementById("cartTable").innerHTML = table;
		document.getElementById("total").innerHTML = "";

		/*$("#total").html(`<table class='table text-center'><thead><tr><td>MRP</td><td>GST</td><td>Service Tax</td><td>FB Discount</td><td>Total</td></tr></thead><tbody><tr><td>${total}</td><td>12%</td><td>5%</td><td>6%</td><td>${grand}</td></tr></tbody></table><h5 class='text-center my-2'>Grand Total ${grand} INR</h5>`);*/

		$("#total").html(`<h5 class='text-center px-3'>Total ${total} INR  <a class="btn btn-warning ms-4" href='JSToJava?uid=${uids}&qty=${dqtys}&did=${dids}'>Order Now <i class='bx bx-bowl-hot' style='font-size:1.4rem;'></i></a></h5>`);
		
	}
}

function deleteItem(did) {
	let cart = JSON.parse(localStorage.getItem("cart"));

	let newcart = cart.filter((item) => item.dishId != did);

	localStorage.setItem("cart", JSON.stringify(newcart));
	document.getElementById("del").click();
	showCart();
}





