<%@ include file="/WEB-INF/common/taglib.jsp"%>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/resources/css/private.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<header>
<div class="container">
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<h3><spring:message code="maintenance.presentation.title" /></h3>
		</div>
	</div>
	<div class="row">
		<c:if test="${listPresentation==null}">
			<label class="error"><spring:message code="maintenance.presentation.list.empty" /></label>
		</c:if>
	</div>
	<div class="row">
		<div class="col-lg-4 col-lg-offset-4">
			<button type="button" id="new_presentation" class="btn btn-primary btn-lg btn_cj">
				<spring:message code="maintenance.presentation.botton.new.presention" />
			</button>
		</div>
	</div>
	<br>
	<div class="row">
		<div id="idTitleList"><label class="titlePage"><spring:message code="maintenance.presentation.title.list" /></label></div>
	</div>
	<div class="row">
		<div class="col-lg-4 col-lg-offset-4">
			<input type="search" id="search" value="" class="form-control" placeholder="Introduce un criterio de busqueda">
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<c:if test="${listPresentation!=null}">
			<table class="table" id="table">
				<thead>
					<tr>
						<th ><spring:message code="maintenance.generic.table.id" /></th>
						<th ><spring:message code="maintenance.presentation.nombre.presentation" /></th>
						<th ><spring:message code="maintenance.generic.table.edit" /></th>
						<th ><spring:message code="maintenance.generic.table.delete" /></th>
					</tr>				
				</thead>
				<tbody>
				<c:forEach items="${listPresentation}" var="listPresentationData">
					<tr	>
						<td class="tdDatatable">${listPresentationData.id}</td>
						<td class="tdDatatable">${listPresentationData.namePresentation}</td>
						<td class="tdDatatable"><a id="linkID" href="javascript:updatePresentation('${listPresentationData.id}','${listPresentationData.namePresentation}')"><img src="${pageContext.request.contextPath}/resources/images/edit_icon.png" alt="HTML tutorial" style="width:20px;height:20px;border:0"></a></td>
						<td class="tdDatatable"><a id="linkID_delete" class="confirm-delete" data-id="${listPresentationData.id}" href="#"><img src="${pageContext.request.contextPath}/resources/images/delete_icon.png" alt="HTML tutorial" style="width:24px;height:24px;border:0"></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>
</div>
</header>
<div id="modalConfirm" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
		    <div class="modal-header">
		        <a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
		         <h3><spring:message code="confirm.option.title" /></h3>
		    </div>
		    <div class="modal-body">
		        <p><spring:message code="confirm.option.messages.delete.presentation" /></p>
		    </div>
		    <div class="modal-footer">
		      <a href="javascript:deletePresentation()" id="btnYes" class="btn danger btn-primary btn-large confirModal">Yes</a>
		      <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
		    </div>
	    </div>
    </div>
</div>

<div id="frmMaintenancePresentation" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<div id="idTitleModal">
					<h4 class='modal-title'>
						<spring:message code="maintenance.presentation.title.add"/>
					</h4>				
				</div>
			</div>
			<html:form method="POST" commandName="maintenancePresentationForm" action="registerPresentation.htm" id="idMaintenancePresentationForm" novalidate="novalidate">
				<div class="modal-body">
					<div id="divFormDiv" class="formDiv">
						<label><spring:message code="maintenance.presentation.nombre.presentation" /></label>
						<html:input path="namePresentation" class="form-control" maxlength="60" id="namePresentation" />
					</div>
					<div id="divIdPresentation"></div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default" id="savePresentation">
						<spring:message code="maintenance.botton.new.form" />
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">
						<spring:message code="close.button" />
					</button>
				</div>
			</html:form>
		</div>
	</div>
</div>

<script>
var validator;
$(document).ready(function() {
	validator = $("#idMaintenancePresentationForm").validate({
		rules: {
			namePresentation: "required"
		},
		messages: {
			namePresentation: "Ingresar un nombre de Presentación"
		},
        submitHandler: function(form) {
            form.submit();
        }
	});
	
	$('.confirm-delete').on('click', function(e) {
	    e.preventDefault();
	    var id = $(this).data('id');
	    $('#modalConfirm').data('id', id).modal('show');
	});
	
});
$("#new_presentation" ).click(function( event ) {
	$('#frmMaintenancePresentation').modal('show');
	$( "#namePresentation" ).val("");
	$("#idTitleModal" ).html('<h4 class="modal-title"><spring:message code="maintenance.presentation.title.add"/></h4>');
	$("#savePresentation").html('<spring:message code="maintenance.botton.new.form" />');
});

$("#cancel").click(function() {
	$("label.error").hide();
	$(".error").removeClass("error");
});

function updatePresentation(idPresentation,namePresentation){
	$(".error").html('');
	$(".error").removeClass("error");
	$("#divIdPresentation").empty();
	$('#frmMaintenancePresentation').modal('show');
	$("#namePresentation" ).val(namePresentation+"");
	$("#idTitleModal" ).html('<h4 class="modal-title"><spring:message code="maintenance.presentation.title.update"/></h4>');
	$("#savePresentation").html('<spring:message code="maintenance.roles.botton.update.role.form" />');
	$("#divIdPresentation").append('<input id="idPresentation" class="form-control input-lg" name="id" type="hidden" value="'+idPresentation+'"/>');
}

function deletePresentation() {
    var id = $('#modalConfirm').data('id');
    document.location="${pageContext.request.contextPath}/deleteMaintenancePresentation.htm?idPresentation="+id;
    $('#modalConfirm').modal('hide');
}
</script>