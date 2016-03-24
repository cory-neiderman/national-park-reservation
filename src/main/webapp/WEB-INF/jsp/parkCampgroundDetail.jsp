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
	<header>Campgrounds of the park <c:out value="${parkChosenName}"/></header>
	<h1>Campground List</h1>
	
	
	
	<ul>
	
		<c:forEach var="campground" items = "${listOfCampgrounds}">
		   <li class ="park">
		   <h3>
				<c:out value="${campground.campgroundName}"/>
			</h3>	
			
				<p>Daily Fee: $<c:out value="${campground.dailyFee}"/></p>
				<p>Number of campsites:<c:out value="${campground.totalNumberOfSites}"/>
				<p><c:out value="${campground.campgroundId}"/>
				
				<c:url var="campgroundHref" value="/campsiteSearch">
				<c:param name="campgroundId" value="${campground.campgroundId}"/>
				<c:param name="campgroundChosenName" value="${campground.campgroundName}"/>
				</c:url>
				<br>
				<a href="${campgroundHref}">Find Availability</a>
			
	   		</li>
		</c:forEach>
		
	</ul>
	
	
	
	
	
	
	</body>
</html>