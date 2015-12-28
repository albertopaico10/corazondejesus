<%@ include file="/WEB-INF/common/taglib.jsp"%>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<header>
	<div class="header-content">
		<div class="header-content-inner">
			<h1>
				<spring:message code="welcome.titulo" />&nbsp${userObject.nombreUsuario}&nbsp${userObject.apellidoUsuario}
				<br><spring:message code="welcome.lastLogin" /></b>&nbsp${userObject.lastLoginFormat}
<%-- 				<input type="hidden" id=idUser name="idUser" value="${idUserLogin}"></input> --%>
			</h1>
		</div>
	</div>
</header>