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
				
	<p1>Available Campsites At <c:out value="${campgroundChosenName}"/> : </p1>
	<ul>
		<c:forEach var="campsite" items="${listOfSites}">
		<li>Location Id : <c:out value="${campsite.siteId}"/></li><br>
		<li>Location Number (in the Campground) : <c:out value="${campsite.siteNumber}"/></li><br>
		<li>Location Max Occupancy : <c:out value="${campsite.maxOccupancy}"/> people</li><br>
		<li>Location Maximum RV Length : <c:out value="${campsite.maxRVLength}"/>ft.</li><br>
		<li><c:choose>
				<c:when test="${campsite.isHandicapAccessible}">
					This Location is Handicap Accessible
				</c:when>
				<c:otherwise>
					Location is not handicap accessible.
				</c:otherwise>
			</c:choose></li><br>
		<li><c:choose>
				<c:when test="${campsite.hasUtilities}">
					Utilities Available.
				</c:when>
				<c:otherwise>
					Utilities are not available.
				</c:otherwise>
			</c:choose></li><br>
		<c:url var="reserveHref" value="/reserveForm">
			
		</c:url>
		<li><form method="GET" action="${reserveHref}">
		<input type="hidden" name="campsiteId" value="${campsite.siteId}"/>
		<input type="hidden" name="campsiteNumber" value="${campsite.siteNumber}"/>
		<input type="hidden" name="campgroundChosenName" value="${campgroundChosenName}"/>
		<input type="hidden" name="startDateChosen" value="${startDateChosen}"/>
		<input type="hidden" name="endDateChosen" value="${endDateChosen}"/>
		<input type="submit" value="Click To Reserve This Site"/>
		</form></li>
		<br>
		
		
	
		</c:forEach>
	
	</ul>
	
	</body>
</html>