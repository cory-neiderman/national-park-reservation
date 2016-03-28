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
		<br>
	<div10>
	<header>Campgrounds of the Park <c:out value="${parkChosenName}"/></header>
	</div10>
    <br>
	
	<ul class ="display">
		<c:forEach var="campground" items = "${listOfCampgrounds}">
		   <li class ="park">
		   <h3>
				<c:out value="${campground.campgroundName}"/>
			</h3>	
			
				<p>Daily Fee: $<c:out value="${campground.dailyFee}"/></p>
				<p>Number of campsites : <c:out value="${campground.totalNumberOfSites}"/>
				<p>Campground Id : <c:out value="${campground.campgroundId}"/>
				<c:choose>
					<c:when test="${campground.hasClosedMonths}">
						<p>Campground is only from <c:out value="${campground.openFromAsString}"/> to <c:out value="${campground.openToAsString}"/></p>
					</c:when>
					
					<c:otherwise>
						<p>Campground is open all year round!</p>
					</c:otherwise>
				</c:choose>
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