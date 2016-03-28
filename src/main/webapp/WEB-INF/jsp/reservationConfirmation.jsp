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
	<header>Reservation Confirmation</header>
	
	<p>Thank you <c:out value="${reservation.name}"/> for the reservation.
	You are booked at campsite number (need to add campiteNumber still)<c:out value="${reservation.campsiteNumber}"/> at the <c:out value="${reservation.campgroundName}"/> campground
	from <c:out value="${reservation.fromDateAsString}"/> to <c:out value="${reservation.toDateAsString}"/>. 
	Your Reservation number is <c:out value="${reservation.reservationId}"/>.</p>
	
	<c:url value="/" var="mainPageHref"/>
	<p><a href="${mainPageHref}">Return to home page</a>
	
	
	
</body>
</html>