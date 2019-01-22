<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 220px;
  right: 10px;
  width: 20%;
  	border: 1px blue;
	border-radius:20%;
	box-shadow: 5px 10px 18px  #596ca3 ;
	background-image: url(https://images.pexels.com/photos/956999/milky-way-starry-sky-night-sky-star-956999.jpeg?auto=compress&cs=tinysrgb&h=350);
	color:white;
	text-align: center;
}



/* The dots/bullets/indicators */
.dot {
  height: 0px;
  width: 0px;
  margin: 0 2px;
  background-color: white;
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
    width: 210px;
	box-shadow: 5px 10px 18px  #596ca3 ;

}

a:hover, a:active {
	box-shadow: 5px 10px 18px  green ;

	
}

.signup{
	position : absolute;
	bottom: 350px;
	left: 20px;
	}

.login{
	position : absolute;
	bottom: 350px;
	left: -190px;
	
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

body{

background-image:url('https://wallpaper-house.com/data/out/8/wallpaper2you_217102.jpg');
}


footer{
position: absolute;
bottom:-200px;
border: 1px;
background-color: "transparent";
font-size:10px;
color:black;
box-shadow: 3px 3px 5px  blue ;
border:2px solid green;

}

@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}
.lol:hover {
  animation: shake 0.5s;
  animation-iteration-count: infinite;
}

</style>
<title>Homepage</title>
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
  
  <img src="http://hotelitali.com/wp-content/uploads/2018/07/hotel-background-images-hd-best-of-naturally-new-zealand-08-days-australia-the-global-wizard-education-of-hotel-background-images-hd.jpg" style="width:1340px; height:648px;">
  
</div>



<div class="text">

<div class="logo">

<img src="https://s3-eu-west-1.amazonaws.com/evian-resort-royal-hotel-staging/wp-content/uploads/2016/05/26162606/logo-royal.png"
 style="width: 150px; height:100px;">

</div>


<div class ="login">

<ul>
    <p><a href="LoginPage.html">Log In</a></p>


  </ul>
</div>

<div class ="signup">

<ul>

    <p><a href="RegistrationPage.html">Sign Up</a></p>

  </ul>
</div>


<div class = "tab">
<ul>
    <p><a href="Homepage.jsp">HOME</a></p>
    <p><a href="royal stay.html">About</a></p>
    <p><a href="royal stay.html">Locate Us</a></p>
    <p><a href="feedback.html">Feedback</a></p>
  </ul>
</div>

  	 <b><p> <span style="color:yellow">CHECK ROOM AVAILIBILITY</span> </p> </b>
<form action="AvailabilityServlet?msg=null&&name=null" method="post" onsubmit="return check()">
	

	<b>Room Type: </b>
	<select name="roomtype"style="background-color:#CBF2F1 ; "> 
    <option value="All">All</option>
    <option value="Single">Single</option>
    <option value="Double">Double</option>
	</select>
	
    <br><br>
	
    <b>Check-in Date: </b><br>
   <input id="checkin" type="date" name="checkindate" style="background-color:#CBF2F1;" min="2010-11-11" required>
    <br>
	<b>Check-out Date: </b><br>
   <input id="checkout" type="date" name="checkoutdate" style="background-color:#CBF2F1 ; "min="2010-11-11" required>
    <br>
	<br>
    <input type="submit" value="submit" style="color:white;background-color: green;" >
	<input type="reset" value="Reset" style="color:white;background-color: red;">
	<br><br>
	</form>

	<div class="lol" id="demo">
	
	
	<p><a href="https://paytm.com/" style="font-color=red;position=relative;top=20px;left=500px;">EXCITING OFFER</a></p>
	
	
	
	</div>
	
	
	<footer class="footer">
  
  <b><p>Powered by : Team SASS</p>
     <i class="fa fa-copyright"></i>
	 ALL COPYRIGHTS ARE RESERVED</p></b>
</footer>
</div>
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

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("checkin").setAttribute("min", today);
document.getElementById("checkout").setAttribute("min", document.getElementById("checkin").value);
function check()
{
	var ok = true;
	if(document.getElementById("checkin").value > document.getElementById("checkout").value)
		{
			ok = false;
			alert("Not allowed");
		}
			
		return ok;
	
}


</script>
</body>
</html>