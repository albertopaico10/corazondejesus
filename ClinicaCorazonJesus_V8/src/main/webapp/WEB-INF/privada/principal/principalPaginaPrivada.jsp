<%@ include file="/WEB-INF/common/taglib.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"></meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
    <meta name="description" content=""></meta>
    <meta name="author" content=""></meta>
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'></link>
	<link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'></link>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/font-awesome/css/font-awesome.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/init/animate.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/init/creativePrivate.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/init/bootstrap.min.css" type="text/css"></link>
<%-- 	<link href="${pageContext.request.contextPath}/resources/css/style.css"	rel="stylesheet" type="text/css" media="screen"></link> --%>
	
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/tableList.css" rel="stylesheet"></link>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/carousel.css" rel="stylesheet"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/jquery-ui.css"></link>
	
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/simple-sidebar.css" rel="stylesheet"></link>
	
		
</head>
<body>
	<div id="contenedor">
		<div class="spinner">
		  <div class="bounce1"></div>
		  <div class="bounce2"></div>
		  <div class="bounce3"></div>
		</div>
	</div>
	<div id="master">
		
		<div class="body">
			
			<div class="header">
				<tiles:insertAttribute name="cabecera" />
			</div>
			
			<div class="content">
				<tiles:insertAttribute name="contenidoIzq" />
				<tiles:insertAttribute name="contenidoCentro" />
				<tiles:insertAttribute name="contenidoDcho" />
			</div>

			<div>
				<tiles:insertAttribute name="pie" />
			</div>
		</div>

	</div>
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/tablesList.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.searchable.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/1.13.0/jquery.validate.min.js"></script>
</body>
</html>
