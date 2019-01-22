<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="com.RoyalStay.hm.pojo.*" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<% 	ArrayList<RoomPojo> roomList=(ArrayList<RoomPojo>)request.getAttribute("roomList");
	ArrayList<BookingPojo> bookingList=(ArrayList<BookingPojo>)request.getAttribute("bookingList");
	ArrayList<CustomerPojo> customerList=(ArrayList<CustomerPojo>)request.getAttribute("customerList");
	DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd 00:00:00");
	String msg=(String)request.getAttribute("msg");
	int i=1;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String username = (String) session.getAttribute("username");
if (username==null) {
   request.setAttribute("Error", "Session has ended.  Please login.");
   response.sendRedirect("Login.jsp");
}%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log in</title>
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
	bottom: 320px;
	right: 1100px;
    width: 190px;
    opacity: 0.9;
	font-size: 22px;


}
.Container{
	position : absolute;
	
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
    color: white;
    padding: 24px 25px;
    text-decoration: none;
	width: 480px;
	height:300px;
	
	align:left;
	text-align: left;
	overflow: auto;
}
.Container1{
	position : absolute;
	top: 10px;
	right: 10px;
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
    color: white;
    padding: 24px 25px;
    text-decoration: none;
	width: 450px;
	height:300px;
	
	align:left;
	text-align: left;
	overflow: auto;
}

.Container2{
	position : absolute;
	bottom: 10px;
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
    color: white;
    padding: 24px 25px;
    text-decoration: none;
	width: 900px;
	height:300px;
	
	align:left;
	text-align: left;
	overflow: auto;
}

.Container3{
	position : absolute;
	bottom: 100px;
	right: 120px;
    color: white;

	align:left;
	
}

.Container4{
	position : absolute;
	bottom: 350px;
	right: 550px;
	background-image: url(https://ak6.picdn.net/shutterstock/videos/30248986/thumb/1.jpg);
    color: white;
    padding: 24px 25px;
    text-decoration: none;
	width: 250px;
	height:250px;
	
	align:center;
	text-align: center;
	overflow: auto;
}

body{

background-image:url('https://wallpaper-house.com/data/out/8/wallpaper2you_217102.jpg');
}

table, td, tr{
border: 1px solid white;
}


</style>

</head>
<body>
<div class="Container">
<h1>Room Details</h1>

<form action="AdminServlet" method="post">

<input type="submit" name="submit" value="Modify Room"/>
<table>
<tr>
<td>Room Number</td>
<td>Room Type</td>
</tr>
<%for(RoomPojo roompojo:roomList){%>
<tr>
<td><input type="text" value="<%=roompojo.getRoomNumber()%>" name="roomnumber<%=i%>"/></td>
<td><select name="roomtype<%=i%>" style="background-color:#CBF2F1 ;">
    <option value="Single" <% if(roompojo.getRoomType().equals("Single")){out.print("selected");}%>>Single</option>
    <option value="Double" <% if(roompojo.getRoomType().equals("Double")){out.print("selected");}%>>Double</option>
</select>
</td>
</tr>
<%i++;}%>
</table>
</div>



<div class="Container4">
<p>Add a room:</p>
<input type="text" name="roomnumber" placeholder="Enter room number.."/>
<select name="roomtype" style="background-color:#CBF2F1;text-align:center;"> 
    <option value="Single">Single</option>
    <option value="Double">Double</option>
</select>
<input type="submit" name="submit" value="Add room"/>
<%if(msg!=null){%>
<p><%=msg%></p>
<%}%>
</div>


<div class="Container1">
<h1>Customer Details</h1>
<% if(customerList!=null&&customerList.size()>0){%>
<table>
<tr>
<td>Customer Name</td>
<td>Username</td>
<td>Contact Number</td>
<td>Document Type</td>
</tr>
<%for(CustomerPojo customerpojo:customerList){%>
<tr>
<td><%=customerpojo.getName()%></td>
<td><%=customerpojo.getUserName()%></td>
<td><%=customerpojo.getContactNumber()%></td>
<td><%=customerpojo.getDocumentType()%></td>
</tr>
<%}%>
</table>
<%}else{%>
<p>Customer doesnt exist<p>
<%}%>

<p>Search a customer:</p>
<input type="text" name="customerDetail" placeholder="customer name/contact no."/>
<input type="submit" name="submit" value="Search Customer"/>
</div>

<div class="Container2">
<h1>Booking Details</h1>
<table>
<tr>
<td>Booking Id</td>
<td>Customer Name</td>
<td>Booking Date</td>
<td>CheckIn Date</td>
<td>CheckOut Date</td>
</tr>
<%for(BookingPojo bookingpojo:bookingList){%>
<tr>
<td><%=bookingpojo.getBookingId()%></td>
<td><%=bookingpojo.getCustomerName()%></td>
<td><%=bookingpojo.getBookingDate().format(formatter)%></td>
<td><%=bookingpojo.getCheckInDate().format(formatter)%></td>
<td><%=bookingpojo.getCheckOutDate().format(formatter)%></td>
</tr>
<%}%>
</table>
</div>

<div class="Container3">
<a href="AdminServlet">Logout</a>
</div>

</form>
</body>
</html>