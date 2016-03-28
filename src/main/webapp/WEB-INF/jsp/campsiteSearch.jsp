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
				
	<header class="searchform"><c:out value="${campgroundChosenName}"/></header>
	
	<h1>Campsite Search Form</h1>
	
		<c:url  var="formAction" value="/searchForSites"/>
		<form method="GET" action="${formAction}">
			<div3>
			<label for="startDateChosen">Start Date: </label>
			<input type="text" id="startDateChosen" name="startDateChosen" placeholder="yyyy-mm-dd"/><br>
			<br>
			<label for="endDateChosen">End Date: </label>
			<input type="text" id="endDateChosen" name="endDateChosen" placeholder="yyyy-mm-dd"/><br>
			</div3>
			<br>
			<h4>Additional Features: </h4>
			<div3>
			<label for="handicap">Handicap Accessibility:</label>
			Yes <input type="radio" id="handicapAccessible" name="handicapAccessible" value="1"/>
			No <input type="radio" id="handicapAccessible" name="handicapAccessible" value="-1"/>
			N/A <input type="radio" id="handicapAccessible" name="handicapAccessible" value="0"/>
			</div3>
			<input type="hidden" name="campgroundId" value="${campgroundId}"/>
			<input type="hidden" name="campgroundChosenName" value="${campgroundChosenName}"/>
			<input type="submit" value="Search"/>
		</form>
	
	
	
	
	
	
	</body>
</html>