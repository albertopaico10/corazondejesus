<%@ include file="/WEB-INF/common/taglib.jsp"%>

<html lang="en">  
<head>  
	<meta charset="utf-8"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
	<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
	<meta name="description" content=""></meta>
	<meta name="author" content=""></meta>
	<title><spring:message code="public.titulo"/></title> 
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'></link>
	<link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'></link>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/font-awesome/css/font-awesome.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/init/animate.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/init/creative.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/init/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/jquery-ui.css"></link>
	
</head>  
<body>

	<div id="master">
		<div class="bodyPublico">
			<div class="header">
				<tiles:insertAttribute name="cabecera" />
			</div>

			<div class="contentpsb">
				<tiles:insertAttribute name="contenidoIzq" />
				<tiles:insertAttribute name="contenidoCentro" />
				<tiles:insertAttribute name="contenidoDcho" />
			</div>

			<div class="footer">
				<tiles:insertAttribute name="pie" />
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/1.13.0/jquery.validate.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/init/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/init/jquery.fittext.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/init/wow.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/init/creative.js"></script> --%>
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>	
</body>  
</html>  