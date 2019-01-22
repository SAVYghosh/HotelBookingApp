<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="com.RoyalStay.hm.pojo.RoomPojo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  
  position: absolute;
  margin: auto;
}

/* Caption text */
.text {

  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 220px;
  right: 10px;
  }



/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 3s;
  
  animation-name: fade;
  animation-duration: 3s;
  
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

.tab{
	
	position: absolute;
  bottom: -10px;
  right: 1300px;
  width: 20%;
}



a:link, a:visited {
	background-image: url(https://images.pexels.com/photos/956999/milky-way-starry-sky-night-sky-star-956999.jpeg?auto=compress&cs=tinysrgb&h=350);
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
	padding: 8px;
    margin-bottom: 7px;
	border: 1px solid #ccc;
	border-radius:0%;
    width: 310px;
	box-shadow: 5px 10px 18px  #596ca3 ;

}

a:hover, a:active {
	box-shadow: 5px 10px 18px  green ;

	
}

.logo{

    margin: 8px 0;
    border: none;
	position : absolute;
	bottom: 320px;
	right: 1100px;
    width: 190px;
    opacity: 0.9;
	font-size: 22px;


}
.Container{
	position : absolute;
	bottom: -150px;
	right: 20px;
	background-image: url(https://images.pexels.com/photos/956999/milky-way-starry-sky-night-sky-star-956999.jpeg?auto=compress&cs=tinysrgb&h=350);
    color: white;
    padding: 24px 25px;
    text-align: center;
    text-decoration: none;
	
}

</style>
<title>Insert title here</title>
</head>
<body>
<div class="slideshow-container">


<div class="mySlides fade"> 
  <img src="https://s-ec.bstatic.com/images/hotel/max1280x900/101/101430248.jpg" style="width:1340px; height:648px;"> 
</div>



<div class="mySlides fade">  
  <img src="https://www.gingerhotels.com/resourcefiles/hotel-profile-listing/ginger-ahmedabad-drive-in-road-hotel-th-1.jpg" style="width:1340px; height:648px;">  
</div>



<div class="mySlides fade">
  <img src="https://taj.tajhotels.com/content/dam/luxury/hotels/Taj_Mahal_Delhi/images/4x3/HotelFacade4x3.jpg" style="width:1340px; height:648px;">
</div>



<div class="text">


<div class="logo">
<img src="https://s3-eu-west-1.amazonaws.com/evian-resort-royal-hotel-staging/wp-content/uploads/2016/05/26162606/logo-royal.png"
 style="width: 150px; height:100px;">
</div>



<div class = "tab">
<ul>
    <p><a href="royal stay.html">HOME</a></p>
    <p><a href="royal stay.html">About</a></p>
    <p><a href="royal stay.html">Locate Us</a></p>
    <p><a href="royal stay.html">Feedback</a></p>
  </ul>
</div>
<% String msg=(String) request.getAttribute("msg");
String value=(String) request.getAttribute("value");%>
<form action="AvailabilityServlet?msg=<%=msg%>" method="post">
<label>Room Type:</label><select name="roomtype">
  <option value="All">All</option>
  <option value="single">Single</option>
  <option value="double">Double</option>
</select>
<p>CheckIn</p>
<label>Day</label><input required type="date" name="checkindate" min="2010-01-01" max="2019-12-31"></input>
<p>CheckOut</p>
<label>Day</label><input required type="date" name="checkoutdate" min="2010-01-01" max="2019-12-31"></input>
<%if(msg!=null&&msg.equals("search")){%>
<table>
<tr>
<td>Room Number</td>
<td>Room Type</td>
</tr>
<% ArrayList<RoomPojo> list=(ArrayList<RoomPojo>)request.getAttribute("roomlist");
for(RoomPojo roompojo:list){%>
<tr>
<td><%=roompojo.getRoomNumber()%></td>
<td><%=roompojo.getRoomType()%></td>
<!-- for users book part -->
<% if(value!=null&&value.equals("user")){%>
<td><a href="book">Book Room</a></td>
<%}%>
</tr>
<%}%>
</table>
<%}%>
<input type="submit" value="submit" name="submit"></input>
</form>

	 
</div>


<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  </div>
<br>





<script>


var slideIndex = 0;
showSlides();


function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}




var myInput = document.getElementById("psw");

var letter = document.getElementById("letter");

var capital = document.getElementById("capital");

var number = document.getElementById("number");

var length = document.getElementById("length");

 

// When the user clicks on the password field, show the message box

myInput.onfocus = function() {

    document.getElementById("message").style.display = "block";

}

 

// When the user clicks outside of the password field, hide the message box

myInput.onblur = function() {

    document.getElementById("message").style.display = "none";

}

 

// When the user starts to type something inside the password field

myInput.onkeyup = function() {

  // Validate lowercase letters

  var lowerCaseLetters = /[a-z]/g;

  if(myInput.value.match(lowerCaseLetters)) { 

    letter.classList.remove("invalid");

    letter.classList.add("valid");

  } else {

    letter.classList.remove("valid");

    letter.classList.add("invalid");

  }

 

  // Validate capital letters

  var upperCaseLetters = /[A-Z]/g;

  if(myInput.value.match(upperCaseLetters)) { 

    capital.classList.remove("invalid");

    capital.classList.add("valid");

  } else {

    capital.classList.remove("valid");

    capital.classList.add("invalid");

  }

 

  // Validate numbers

  var numbers = /[0-9]/g;

  if(myInput.value.match(numbers)) { 

    number.classList.remove("invalid");

    number.classList.add("valid");

  } else {

    number.classList.remove("valid");

    number.classList.add("invalid");

  }

 

  // Validate length

  if(myInput.value.length >= 8) {

    length.classList.remove("invalid");

    length.classList.add("valid");

  } else {

    length.classList.remove("valid");

    length.classList.add("invalid");

  }

}

function myFunction() {

    var pass1 = document.getElementById("pass1").value;

    var pass2 = document.getElementById("pass2").value;

    var ok = true;

    if (pass1 != pass2) {

        alert("Passwords did not match");

        document.getElementById("pass1").style.borderColor = "#E34234";

        document.getElementById("pass2").style.borderColor = "#E34234";

        ok = false;

    }

    else {

        //alert("Passwords Match!!!");

    }
ValidateNo();

    return ok;

}

function ValidateNo() {

  var phoneNo = document.getElementById("phoneNo").value;

 

//  if (phoneNo == "" || phoneNo == null) {

//    alert("Please enter your Mobile No.");

//    return false;

//  }

  if (phoneNo.length < 10 || phoneNo.length > 10) {

    alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");

    return false;

  }


  return true;

}

</script>
</body>
</html>