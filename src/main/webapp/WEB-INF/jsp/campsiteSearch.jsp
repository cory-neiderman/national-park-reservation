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
	<header>Search</header>
	
	
	
	<c:out value="${campgroundChosenName}"/>
	<br>
	<c:out value="${campgroundId}"/>
	<br>
	
	<h1>Campsite Search Form</h1>
		<c:url  var="formAction" value="/searchForSites"/>
		<form method="GET" action="${formAction}">
			<label for="startDateChosen">Start Date: </label>
			<input type="text" id="startDateChosen" name="startDateChosen" placeholder="yyyy-mm-dd"/><br>
			
			<label for="endDateChosen">End Date: </label>
			<input type="text" id="endDateChosen" name="endDateChosen" placeholder="yyyy-mm-dd"/><br>
			<br>
			Additional Features:<br>
			<label for="handicap">Handicap Accessibility:</label>
			yes<input type="radio" id="handicapAccessible" name="handicapAccessible" value="1"/>
			no<input type="radio" id="handicapAccessible" name="handicapAccessible" value="-1"/>
			does not matter<input type="radio" id="handicapAccessible" name="handicapAccessible" value="0"/>
			
			<input type="hidden" name="campgroundId" value="${campgroundId}"/>
			<input type="hidden" name="campgroundChosenName" value="${campgroundChosenName}"/>
			<input type="submit" value="Search"/>
		</form>
	
	
	
	
	
	
	</body>
</html>