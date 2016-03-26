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
	<header>Reserve Form</header>
	
	<c:out value="${campsiteId}"/>
	<p>Reservation for campsite number <c:out value="${campsiteNumber}"/> at the <c:out value="${campgroundChosenName}"/> campgrounds</p>
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
		<input type="submit" value="Submit Reservation"/>
	</form>
	
	
	
	</body>
</html>