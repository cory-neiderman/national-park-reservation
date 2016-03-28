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
		<img id="logo" src="${logoSrc}" alt="National Park Geek Logo" />
		<div4>		
	<p>Please Confirm Reservation for Campsite <c:out value="${campsiteNumber}"/> at <c:out value="${campgroundChosenName}"/> Campgrounds.</p>
	<br>
	<br>
	<c:url value="/reservationSubmit" var="formAction">
		<c:param name="campsiteId" value="${campsiteId}"/>
		<c:param name="campsiteNumber" value="${campsiteNumber}"/>
		<c:param name="campgroundChosenName" value="${campgroundChosenName}"/>
		<c:param name="startDateChosen" value="${startDateChosen}"/>
		<c:param name="endDateChosen" value="${endDateChosen}"/>
	</c:url>
		<form method="POST" action="${formAction}">
	
		<label for="reservationName">Enter the name for the reservation:</label> 
		<input type="text" name="reservationName" id="reservationName" /><br>
		<br>
		<input type="submit" value="Submit Reservation"/>
	</form>
	
	</div4>
	
	</body>
</html>