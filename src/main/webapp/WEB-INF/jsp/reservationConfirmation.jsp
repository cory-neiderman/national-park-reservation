<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE>
<html>

	<head>
		<title>Campsite Reservation</title>
		<c:url var="cssHref" value="/css/site.css" />
		<link type="text/css" rel="stylesheet" href="${cssHref}"/>
	</head>
	
	<body>
	
		<c:url var="logoSrc" value="/img/logo.png" />
		<img id="logo" src="${logoSrc}" alt="National Park Geek Logo" /><br>
		
		
	<h11>
	<p>Thank you <c:out value="${reservation.name}"/>!<br>
	<br>
	You have booked campsite number <c:out value="${reservation.campsiteNumber}"/> at the <c:out value="${reservation.campgroundName}"/> campground !
	<br>
	<br>From :   <c:out value="${reservation.fromDateAsString}"/> 
	<br>
	<br>To :   <c:out value="${reservation.toDateAsString}"/> 
	<br>
	<br>
	Confirmation Number : <c:out value="${reservation.reservationId}"/></p>
	
	<c:url value="/" var="mainPageHref"/>
	<p><a href="${mainPageHref}">Return to home page</a>
	</h11>
	
	
</body>
</html>