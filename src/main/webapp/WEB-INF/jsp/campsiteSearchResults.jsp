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
	<header>Search Results</header>
	
	<c:out value="${campgroundId}"/>
	<p>These campsites are available at <c:out value="${campgroundChosenName}"/>.  Click to reserve a campsite<p>
	<ul>
		<c:forEach var="campsite" items="${listOfSites}">
		<li>Campsite Id: <c:out value="${campsite.siteId}"/></li>
		<li>Campsite Number(in the Campground): <c:out value="${campsite.siteNumber}"/></li>
		<li>Max Occupancy: <c:out value="${campsite.maxOccupancy}"/> people</li>
		<li>Maximum RV Length: <c:out value="${campsite.maxRVLength}"/>ft.</li>
		<li><c:choose>
				<c:when test="${campsite.isHandicapAccessible}">
					Handicap Accessible
				</c:when>
				<c:otherwise>
					NOT Handicap Accessible
				</c:otherwise>
			</c:choose></li>
		<li><c:choose>
				<c:when test="${campsite.hasUtilities}">
					Utilities Available
				</c:when>
				<c:otherwise>
					NO Utilities
				</c:otherwise>
			</c:choose></li>
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