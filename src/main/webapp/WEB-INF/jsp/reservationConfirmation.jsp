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
	
	<p>Thank you <c:out value="${reservationName}"/> for the reservation.
	You are booked at campsite number <c:out value="${campsiteNumber}"/> at the <c:out value="${campgroundChosenName}"/> campground
	from <c:out value="${startDateChosen}"/> to <c:out value="${endDateChosen}"/></p>
	
	<c:url value="/" var="mainPageHref"/>
	<p><a href="${mainPageHref}">Return to home page</a>
	
	
	
</body>
</html>