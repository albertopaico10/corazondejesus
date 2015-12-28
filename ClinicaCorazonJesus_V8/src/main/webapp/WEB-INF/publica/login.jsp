<%@ include file="/WEB-INF/common/taglib.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/1.13.0/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<html:form method="POST" commandName="loginUsuForm" action="validateUser.htm" id="idLoginUsuForm" novalidate="novalidate">
				<div class="modal-header" id="idTitleLogin">
					<h1 class="text-center"><spring:message code="login.titulo" /></h1>
				</div>
				<div class="modal-body">
					<form class="form col-md-12 center-block">
						<div class="form-group">
							<html:input path="userName" maxlength="60"  class="form-control input-lg" id="userName" placeholder="Usuario"/>
						</div>
						<div class="form-group">
							<html:password path="password" maxlength="24" class="form-control input-lg" id="password" placeholder="Contrase�a"/>
						</div>
						<div id="idDivBtnAccept">
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-lg btn-block"><spring:message code="login.ingresar" /></button>
							</div>
						</div>
						<c:if test="${messages == 'FAIL_VALIDATION_USER'}">
							<label class="error"><spring:message code="login.faild.validations" /></label>
						</c:if>
						<c:if test="${messages == 'USER_NOT_EXIST'}">
							<label class="error"><spring:message code="login.user.not.exist" /></label>
						</c:if>
						<c:if test="${messages == 'ERROR'}">
							<label class="error"><spring:message code="login.email.error" /></label><br/>
							<label class="error">${messagesSpecific}</label>
						</c:if>
					</form>
				</div>
				<div class="modal-footer">
					<div class="col-md-12">
						<button class="btn" data-dismiss="modal" aria-hidden="true" onclick="goPrincipalPage();">Cancel</button>
					</div>
				</div>
			</html:form>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	$("#idLoginUsuForm").validate({
		rules: {
			userName: "required",
			password: "required"
		},
		messages: {
			userName: '<spring:message code="login.error.user" />',
			password: '<spring:message code="login.error.password" />'
		},
		submitHandler: function(form) {
            form.submit();
        }
	});

});
function goPrincipalPage(){
	document.location="${pageContext.request.contextPath}/inicio.htm";
}
</script>