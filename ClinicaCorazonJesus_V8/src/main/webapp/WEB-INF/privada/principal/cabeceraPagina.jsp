<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" id="btnNavHeader" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- <img style="width: 50%; height:7.5%" src="${pageContext.request.contextPath}/resources/images/logoFinalx3.jpg"> -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="listPresentation.htm" title="<spring:message	code="menu.maintenance.presentation" />">
						<spring:message	code="menu.maintenance.presentation" />
					</a>
				</li>
				<li><a href="listProduct.htm" title="<spring:message  code="menu.maintenance.type.product" />">
						<spring:message	code="menu.maintenance.type.product" />
					</a>
				</li>
				<li><a href="listMaintenancePatient.htm" title="<spring:message code="menu.register.patient" />">
						<spring:message code="menu.register.patient" />
					</a>
				</li>
				<li><a href="registerKardex.htm" title="<spring:message code="menu.register.kardex" />">
						<spring:message code="menu.register.kardex" />
					</a>
				</li>
				<li><a href="closeSession.htm">Cerrar Sessión</a></li>
			</ul>
		</div>
	</div>
</nav>
