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
	
	<h1>Campsite Search Form</h1>
		<c:url  var="formAction" value="/searchDate"/>
		<form method="GET" action="${formAction}">
			<label for="startDate">Start Date: </label>
			<input type="text" id="startDate" name="startDate"/><br>
			
			<label for="endDate">To Date: </label>
			<input type="text" id="endDate" name="endDate"/><br>
			
			<input type="submit" value="Search"/>
		</form>
	
	
	
	
	
	
	</body>
</html>