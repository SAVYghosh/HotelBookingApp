<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="com.RoyalStay.hm.pojo.RoomPojo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String username = (String) session.getAttribute("username");
if (username==null){
   response.sendRedirect("Homepage.jsp");
}%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
</head>
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
	top: 190px;
	right: 1100px;
	width: 20%;
}



a:link, a:visited {
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
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

input {
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
  
	color: white;
    padding: 14px 25px;
    text-align: center;
    display: inline-block;
	padding: 8px;
    margin-bottom: 7px;
	border: 1px solid #ccc;
	border-radius:0%;
    width: 210px;
	box-shadow: 5px 10px 18px  #596ca3 ;
	opacity: 0.8;
	font-size:12px;

}


.logo{

    margin: 8px 0;
    border: none;
	position : absolute;
	top: 20px;
	right: 1100px;
    width: 190px;
    opacity: 0.9;
	font-size: 22px;


}
.Container{
	position : absolute;
	bottom: -150px;
	right: 450px;
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
    color: white;
    padding: 24px 25px;
    text-decoration: none;
	width: 500px;
	height: 380px;
	overflow:auto;
	align:left;
	
	text-align: left;
	
}

.Container1{
	position : absolute;
	bottom: 230px;
	right: 450px;
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
    color: white;
    padding: 24px 25px;
    text-decoration: none;
	width: 500px;
	height: 230px;
	border-radius: 4%;
	align:left;
	
	text-align: center;
	
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

</style>
<body>


<div class="logo">

<img src="https://s3-eu-west-1.amazonaws.com/evian-resort-royal-hotel-staging/wp-content/uploads/2016/05/26162606/logo-royal.png"
 style="width: 150px; height:100px;">

</div>



<div class = "tab">
<ul>
    <p><a href="Homepage.jsp">HOME</a></p>
    <p><a href="royal stay.html">About</a></p>
    <p><a href="royal stay.html">Locate Us</a></p>
    <p><a href="royal stay.html">Feedback</a></p>
  </ul>
</div>
<% String msg=(String) request.getAttribute("msg");
String name=(String) request.getAttribute("name");
String checkindate=(String)request.getAttribute("checkin");
String checkoutdate=(String)request.getAttribute("checkout");
String roomnumber=(String)request.getAttribute("roomnumber");
String booking=(String)request.getAttribute("booking");
ArrayList<RoomPojo> list=(ArrayList<RoomPojo>)request.getAttribute("roomlist");%>

<%if(booking!=null&&booking.equals("success")){%>
<div class ="Container1">
<p>Booking Details:</p>
<p>Customer name:<%=name%></p>
<p>Room number:<%=roomnumber%></p>
<p>Check-in Date:<%=checkindate%></p>
<p>Check-out Date:<%=checkoutdate%></p></br></br>
</div>

<%}if(booking!=null&&booking.equals("failed")){%>
<p>Booking not done</p>
<%}%>


<div class="text">
<form action="AvailabilityServlet?msg=<%=msg%>&&name=<%=name%>" method="post">
<label>Room Type:</label><select name="roomtype">
  <option value="All">All</option>
  <option value="single">Single</option>
  <option value="double">Double</option>
</select>
<br><br>
<label>Check in Day</label><input required type="date" name="checkindate" min="2010-01-01" max="2019-12-31"></input>
<br>
<label>Check out Day</label><input required type="date" name="checkoutdate" min="2010-01-01" max="2019-12-31"></input>

<br>

<input type="submit" value="submit" name="submit"></input>
</form>

<%if(msg!=null&&msg.equals("search")&&list!=null&&list.size()>0){%>

<div class="Container">
<table>
<tr>
<td>Room Number</td>
<td>Room Type</td>
</tr>
<%for(RoomPojo roompojo:list){%>
<tr>
<td><%=roompojo.getRoomNumber()%></td>
<td><%=roompojo.getRoomType()%></td>
<% if(name!=null&&!name.equals("null")){%>
<td><a href="BookingServlet?roomNumber=<%=roompojo.getRoomNumber()%>&&userName=<%=name%>&&checkIn=<%=checkindate%>&&checkOut=<%=checkoutdate%>">Book Room</a></td>
<%}%>
</tr>
<%}%>
</table>
<%}if(list!=null&&list.size()==0){%>
<p>Rooms not available</p>
<%}%>
</div>

</div>
<%if(name!=null&&!name.equals("null")){%>
<a style="float:right;" href="AvailabilityServlet">Logout</a>
<%}%>
</body>
</html>