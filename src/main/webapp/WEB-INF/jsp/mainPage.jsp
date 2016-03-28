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
				
	<h1 class="parklist">Park List</h1>
	
	
	
	<ul>
	
		<c:forEach var="park" items = "${listOfParks}">
		   <li class ="park">
		   <h3>
			<c:url var="parkDetailHref" value="/parkCampgroundDetail">
				<c:param name="parkId" value="${park.parkId}"/>
				<c:param name="parkChosenName" value="${park.parkName}"/>
			</c:url>
			<a href="${parkDetailHref}"><c:out value="${park.parkName}"/></a>
			</h3>
	   		</li>
		</c:forEach>
	</ul>
	
	
	
	
	
	
	</body>
</html>