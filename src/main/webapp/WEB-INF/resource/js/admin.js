function showEmp(){
    // document.getElementById("showEmp").style.display = "none";
    // document.getElementById("showOrder").style.display = "none";
    // document.getElementById("showCust").style.display = "none";
    // document.getElementById("showhelp").style.display = "none";
    // document.getElementById("showContact").style.display = "none";
    // document.getElementById("showMenu").style.display = "none";
    
    // document.getElementById("showIncome").style.display = "none";
    // document.getElementById("showFeedback").style.display = "none";

    document.getElementById("emp").style.display = "block";


    document.getElementById("tables").style.display = "none";
    document.getElementById("customer").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("contact").style.display = "none";
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
     document.getElementById("mainDiv").classList.add("d-none");
}

function showOrder(){
   
    document.getElementById("tables").style.display = "none";
    document.getElementById("order").style.display = "block";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("customer").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("contact").style.display = "none";
    
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
  
     document.getElementById("mainDiv").classList.add("d-none");
}
function showCust(){
 
    document.getElementById("tables").style.display = "none";
    document.getElementById("customer").style.display = "block";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("contact").style.display = "none";

    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
 
     document.getElementById("mainDiv").classList.add("d-none");
}

function showMenu(){
 
    document.getElementById("tables").style.display = "none";
    document.getElementById("menu").style.display = "block";

    document.getElementById("emp").style.display = "none";
    document.getElementById("customer").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("contact").style.display = "none";
    
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
 
     document.getElementById("mainDiv").classList.add("d-none");
}
function showHelp() {
    
    document.getElementById("tables").style.display = "none";
    document.getElementById("help").style.display = "block";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("customer").style.display = "none";
    document.getElementById("contact").style.display = "none";
    
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
    
     document.getElementById("mainDiv").classList.add("d-none");
}

function showContact(){
  
    document.getElementById("tables").style.display = "none";
    document.getElementById("contact").style.display = "block";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("customer").style.display = "none";
    
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
  
     document.getElementById("mainDiv").classList.add("d-none");
}

function showFeedback(){
  
    document.getElementById("contact").style.display = "none";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("customer").style.display = "none";
    
    document.getElementById("tables").style.display = "none";
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "block";
     document.getElementById("mainDiv").classList.add("d-none");
}

function showIncome(){
  
    document.getElementById("contact").style.display = "none";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("customer").style.display = "none";
    
    document.getElementById("tables").style.display = "none";
    document.getElementById("income").style.display = "block";
    document.getElementById("feedback").style.display = "none";

    document.getElementById("mainDiv").classList.add("d-none");
}
function showAdmin(){
  
    document.getElementById("contact").style.display = "none";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("customer").style.display = "none";
    
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
    document.getElementById("tables").style.display = "block";

    document.getElementById("mainDiv").classList.add("d-none");
}


function mainDiv()
{
    if (document.getElementById("mainDiv").classList.contains("d-none")==true)
    {
        document.getElementById("mainDiv").classList.remove("d-none");
    }




    // document.getElementById("showEmp").style.display = "Block";
    // document.getElementById("showOrder").style.display = "block";
    // document.getElementById("showCust").style.display = "block";
    // document.getElementById("showhelp").style.display = "block";
    // document.getElementById("showContact").style.display = "block";
    // document.getElementById("showMenu").style.display = "block";
    // document.getElementById("showIncome").style.display = "block";
    // document.getElementById("showFeedback").style.display = "block";

    document.getElementById("contact").style.display = "none";
    document.getElementById("emp").style.display = "none";
    document.getElementById("menu").style.display = "none";
    document.getElementById("order").style.display = "none";
    document.getElementById("help").style.display = "none";
    document.getElementById("customer").style.display = "none";
    document.getElementById("income").style.display = "none";
    document.getElementById("feedback").style.display = "none";
    document.getElementById("tables").style.display = "none";

}

function openProfile()
{
    console.log("openProfile is called");
    document.getElementById("myul").classList.toggle("d-none");
    
    document.getElementById("myi").classList.toggle("bx-up-arrow");

}