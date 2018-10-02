<!-- Calculator -->

<!-- attribute -->
<%@ attribute name="x" required="true" %>
<%@ attribute name="y" required="true" %>

<!-- import core taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- declare variables -->
<%@ variable name-given="add" %>
<%@ variable name-given="substract" %>
<%@ variable name-given="multi" %>
<%@ variable name-given="divide" %>

<!-- use core taglib & EL to do the calculate -->
<!-- c:set= place result in the pageContext attributes  -->
<!-- instead of using EL&taglib, you can use pure JAVA here. -->
<c:set var="add" value="${x + y }"/>
<c:set var="substract" value="${x - y }"/>
<c:set var="multi" value="${x * y }"/>
<c:set var="divide" value="${x / y }"/>

<!-- the result will be sent to the browser after they are processed. -->

<!-- Execute the code -->
<!-- doBody limits the variables to live inside the body part (inside tags <tags>body</tags>) -->
<jsp:doBody/>