<%@ include file="/WEB-INF/common/taglib.jsp"%>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/resources/css/private.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
 
<header>
<div class="container">
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<h3><spring:message code="atention.patient.title" /></h3>
		</div>
		
	</div>
	<div class="row">
		<div class="col-lg-4 col-lg-offset-4">
			<button type="button" id="new_patient" class="btn btn-primary btn-lg btn_cj">
				<spring:message code="maintenance.patient.botton.new.patient" />
			</button>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<h4><spring:message code="atention.patient.filter.subtitle" /></h4>
		</div>
	</div>
	<div class="row">
		<form id="idFindPatient" action="findPatientSpecific.htm" method="POST">
			<div id="divFormDiv" class="formDiv">
				<input id="lastName" class="form-control" name="lastName" placeholder="Apellido" title="Apellido" type="text" value="" size="40"/>
			</div>
			<br>
			<div id="divFormDiv" class="formDiv">
				<input id="dniValue" class="form-control" name="dniValue" placeholder="DNI" title="DNI" type="text" value="" size="8"/>
			</div>
			<br>
			<div id="divFormDiv" class="formDiv">
				<input id="submit" name="submit" onclick="$('#contenedor').css('visibility','')" type="submit" value="Buscar" class="btn btn-primary btn-lg btn_find_cj">
			</div>
		</form>	
	</div>
	<br>
	<c:if test="${listPatient!=null}">
	<div class="row">
		<div id="idTitleList"><label class="titlePage"><spring:message code="maintenance.patiente.title.list" /></label></div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<table class="table table-striped table-bordered" cellspacing="0" width="100%" id="table">
				<thead>
					<tr>
						<th ><spring:message code="maintenance.generic.table.id" /></th>
			
						<th ><spring:message code="maintenance.patient.table.name" /></th>
						<th ><spring:message code="maintenance.patient.table.dni" /></th>
						<th ><spring:message code="maintenance.patient.table.historyClinic" /></th>
						<th ><spring:message code="maintenance.patient.table.address" /></th>
						<th ><spring:message code="maintenance.patient.table.districtName" /></th>
						<th ><spring:message code="maintenance.patient.table.birthDay" /></th>
						<th ><spring:message code="maintenance.patient.table.age" /></th>
						<th ><spring:message code="maintenance.patient.table.sex" /></th>
						<th ><spring:message code="maintenance.patient.table.name.reference" /></th>
						<th ><spring:message code="maintenance.patient.table.phone.reference" /></th>
			
						<th width="34px" ><spring:message code="maintenance.generic.table.edit" /></th>
						<th width="34px" ><spring:message code="maintenance.generic.table.delete" /></th>
					</tr>				
				</thead>
				<tbody>
				<c:forEach items="${listPatient}" var="listPatientData">
					<tr	>
						<td class="tdDatatable">${listPatientData.id}</td>
						<td class="tdDatatable">${listPatientData.completeName}</td>
						<td class="tdDatatable">${listPatientData.dni}</td>
						<td class="tdDatatable">${listPatientData.codeHistoryClinic}</td>
						<td class="tdDatatable">${listPatientData.address}</td>
						<td class="tdDatatable">${listPatientData.districtName}</td>
						<td class="tdDatatable">${listPatientData.birthDayFormat}</td>
						<td class="tdDatatable">${listPatientData.edad} <spring:message code="maintenance.generic.age" /></td>
						<td class="tdDatatable">
						<c:if test="${listPatientData.idSexo==1}">
							<spring:message code="male.option" />
						</c:if>
						<c:if test="${listPatientData.idSexo==2}">
							<spring:message code="female.option" />
						</c:if>
						</td>
						<td class="tdDatatable">${listPatientData.nameReference}</td>
						<td class="tdDatatable">${listPatientData.phoneReference}</td>
						<td class="tdDatatable"><a id="linkID" href="javascript:updatePatient('${listPatientData.id}','${listPatientData.namePatient}','${listPatientData.lastNamePatient}','${listPatientData.dni}','${listPatientData.codeHistoryClinic}','${listPatientData.address}','${listPatientData.districtName}','${listPatientData.idSexo}','${listPatientData.nameReference}','${listPatientData.phoneReference}','${listPatientData.birthDayFormat}')"><img src="${pageContext.request.contextPath}/resources/images/edit_icon.png" alt="HTML tutorial" style="width:20px;height:20px;border:0"></a></td>
						<td class="tdDatatable"><a id="linkID_delete" class="confirm-delete" href="javascript:showDeletePatient('${listPatientData.id}')"><img src="${pageContext.request.contextPath}/resources/images/delete_icon.png" alt="HTML tutorial" style="width:24px;height:24px;border:0"></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</c:if>
</div>
</header>
<div id="frmMaintenancePatient" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<div id="idTitleModal">
					<h4 class='modal-title'>
						<spring:message code="maintenance.patient.title.add" />
					</h4>				
				</div>
			</div>
			<html:form method="POST" commandName="maintenancePatientForm" action="registerPatient.htm" id="idMaintenancePatientForm" novalidate="novalidate">
				<div class="modal-body">
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.name.form" /></label>
						<html:input path="namePatient" maxlength="60" class="form-control" id="namePatient"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.lastName.form" /></label>
						<html:input path="lastNamePatient" maxlength="60" class="form-control" id="lastNamePatient"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.DNI.form" /></label>
						<html:input path="dni" maxlength="8" class="form-control" id="dni"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.birthDate.form" /></label>
						<html:input class="form-control" path="birthDay" id="birthDay"  name="birthDay" placeholder="MM/DD/YYY" type="text"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.history.clinic.form" /></label>
						<html:input path="codeHistoryClinic" id="codeHistoryClinic" class="form-control" readonly="true"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.adress.form" /></label>
						<html:input path="adress" maxlength="100" id="adress" class="form-control"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.district.form" /></label>
						<html:input path="districtName" maxlength="100" id="districtName" class="form-control"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.sex.form" /></label>
						<input type="radio" value="1" id="idRbMale"><spring:message code="male.option" />
						<input type="radio" value="2" id="idRbFemale"><spring:message code="female.option" />
						<html:hidden path="sex" maxlength="100" id="finalsex"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.nameperson.reference.form" /></label>
						<html:input path="nameReference" maxlength="100" id="idNameReference" class="form-control"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.patient.phone.reference.form" /></label>
						<html:input path="phoneReference" maxlength="9" id="idPhoneReference"  class="form-control"/>
					</div>
				</div>
				<div id="divIdPatient"></div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default" id="idSave">
						<spring:message code="maintenance.botton.new.form"/>
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">
						<spring:message code="close.button" />
					</button>
				</div>
			</html:form>
		</div>
	</div>
</div>

<div id="modalConfirm" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
		    <div class="modal-header">
		        <a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
		         <h3><spring:message code="confirm.option.title" /></h3>
		    </div>
		    <div class="modal-body">
		        <p><spring:message code="confirm.option.messages.delete.patient" /></p>
		        <div style="display: none">
		        	<p><input id="idPatient" type="text" value=""/></p>
		        </div>
		    </div>
		    <div class="modal-footer">
		      <a href="javascript:deletePantient()" id="btnYes" class="btn danger btn-primary btn-large confirModal">Yes</a>
		      <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
		    </div>
	    </div>
    </div>
</div>




<script>

$(document).ready(function() {
	$('#table').DataTable();
	$("#contenedor").css("visibility","hidden");
	$("#birthDay").datepicker();
		
	$("#idMaintenancePatientForm").validate({
		rules: {
			namePatient: "required",
			lastNamePatient: "required",
			dni:{
				required:true,
				number:true,
				minlength: 8
			},
			adress: "required",
			districtName: "required",
			birthDay: {
				required:true,
				dateFormat: true
			},
			'tbArea.id':{min:1},
			sex: "required",
			phoneReference:{
				maxlength: 9,
				number:true,
			}
		},
		messages: {
			namePatient: '<spring:message code="login.error.namePatient" />',
			lastNamePatient: '<spring:message code="login.error.lastNamePatient" />',
			dni: {
				required:'<spring:message code="login.error.dni" />',
				number:'<spring:message code="login.error.number" />',
				minlength:'<spring:message code="login.error.dni.count" />'
			},
			adress: '<spring:message code="login.error.adress" />',
			districtName: '<spring:message code="login.error.districtName" />',
			birthDay:{
				required:'<spring:message code="login.error.birthDay" />'
			} ,
			'tbArea.id': '<spring:message code="login.error.tbArea" />',
			sex: '<spring:message code="requerid.sex" />',
			phoneReference: {
				number:'<spring:message code="login.error.number" />',
				minlength:'<spring:message code="requerid.error.phone.max" />'
			}
		},
		submitHandler: function(form) {
            form.submit();
        }
	});
}); 


$("#new_patient" ).click(function( event ) {
	$('#frmMaintenancePatient').modal('show');
	$( "#namePatient" ).val("");
	$( "#lastNamePatient" ).val("");
	$( "#dni" ).val("");
	$( "#codeHistoryClinic" ).val("");
// 	$( "#historyClinic" ).hide();
	$( "#birthDay" ).val("");
	$( "#adress" ).val("");
	$( "#districtName" ).val("");
	$( "#idNameReference" ).val("");
	$( "#idPhoneReference" ).val("");
// 	$( 'select' ).val("0");
	$("#savePatient").html('<spring:message code="maintenance.botton.new.form" />');
});

$("#cancel").click(function() {
	$("label.error").hide();
	$(".error").removeClass("error");
});

// $("#savePatient").click(function(){
// 	var title = $( "#frmMaintenancePatient" ).dialog( "option", "title" );
// 	var titleUpdate='<spring:message code="maintenance.roles.title.update" />';
// 	if(title==titleUpdate){
// 		$('#maintenanceRoleForm').attr('action', 'updateArea.htm').submit();
// 	}
// });

$("#idRbMale").change(function () {
	if($('#idRbMale').is(':checked')){
		$( "#finalsex" ).val("1");
		$( "#idRbFemale" ).attr('checked',false);
		$( "#idRbMale" ).attr('checked',true);
	}
	
});

$("#idRbFemale").change(function () {
	if($('#idRbFemale').is(':checked')){
		$( "#finalsex" ).val("2");
		$( "#idRbMale" ).attr('checked',false);
		$( "#idRbFemale" ).attr('checked',true);
	}	
});

function updatePatient(idPatient,namePatient,lastNamePatient,dni,historyClinic,address,district,sexo,namereference,phonereference,birthDay){
	$("#divIdPatient").empty();
// 	$( "#frmMaintenancePatient" ).dialog({
// 		width:569,
// 		height:408
// 	});
	$('#frmMaintenancePatient').modal('show');
	$( "#namePatient" ).val(namePatient+"");
	$( "#lastNamePatient" ).val(lastNamePatient+"");
	$( "#dni" ).val(dni+"");
	historyClinic=historyClinic.split("_");
	$( "#codeHistoryClinic" ).val(historyClinic[1]+"");
	$( "#birthDay" ).val(birthDay+"");
	$( "#adress" ).val(address+"");
	$( "#districtName" ).val(district+"");
// 	$( 'select' ).val(idArea+"");
	if(sexo=="1"){
		$( "#idRbFemale" ).attr('checked',false);
		$( "#idRbMale" ).attr('checked',true);
		$( "#finalsex" ).val("1");
	}else{
		$( "#idRbMale" ).attr('checked',false);
		$( "#idRbFemale" ).attr('checked',true);
		$( "#finalsex" ).val("2");
	}
	$( "#idNameReference" ).val(namereference+"");
	$( "#idPhoneReference" ).val(phonereference+"");
	$("#idTitleModal" ).html('<h4 class="modal-title"><spring:message code="maintenance.patient.title.update"/></h4>');
	$("#idSave").html('<spring:message code="maintenance.generic.update.button" />');
	$("#divIdPatient").append('<input id="idPatient" name="id" type="hidden" value="'+idPatient+'"/>');
}

function showDeletePatient(idPatient) {
    $('#modalConfirm').modal('show');
    $('#idPatient').val(idPatient);
}


function deletePantient() {
    var id =  $('#idPatient').val();
    document.location="${pageContext.request.contextPath}/deleteMaintenancePatient.htm?idPatient="+id;
    $('#modalConfirm').modal('hide');
}


</script>