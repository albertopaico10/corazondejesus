<%@ include file="/WEB-INF/common/taglib.jsp"%>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/private.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<header>
	<div class="container">
		<br>
		<br>
		<br>
		<div class="row">
			<div class="col-lg-12">
				<h3><spring:message code="maintenance.type.product.title" /></h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-lg-offset-4">
				<button type="button" id="new_product" class="btn btn-primary btn-lg btn_cj">
					<spring:message code="maintenance.type.product.botton.new" />
				</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div id="idTitleList"><label class="titlePage"><spring:message code="maintenance.type.product.title.list" /></label></div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-lg-offset-4">
				<input type="search" id="search" value="" class="form-control" placeholder="Introduce un criterio de busqueda">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<c:if test="${listTypeProduct!=null}">
				<table class="table" id="table">
					<thead>
						<tr>
							<th ><spring:message code="maintenance.generic.table.id" /></th>
							<th ><spring:message code="maintenance.type.product.nombre.presentation" /></th>
							<th ><spring:message code="maintenance.presentation.nombre.presentation" /></th>
							<th ><spring:message code="maintenance.product.price.buy.title" /></th>
							<th ><spring:message code="maintenance.product.price.sale.title" /></th>
							<th ><spring:message code="maintenance.generic.expiration.date" /></th>
							<th width="34px" ><spring:message code="maintenance.generic.table.edit" /></th>
							<th width="34px" ><spring:message code="maintenance.generic.table.delete" /></th>
						</tr>				
					</thead>
					<tbody>
					<c:forEach items="${listTypeProduct}" var="listTypeProductData">
						<tr	>
							<td class="tdDatatable">${listTypeProductData.id}</td>
							<td class="tdDatatable">${listTypeProductData.nameProduct}</td>
							<td class="tdDatatable">${listTypeProductData.namePresentation}</td>
							<td class="tdDatatable">${listTypeProductData.price}</td>
							<td class="tdDatatable">${listTypeProductData.priceSale}</td>
							<td class="tdDatatable">${listTypeProductData.expirationDate}</td>
							<td class="tdDatatable"><a id="linkID" href="javascript:updateProduct('${listTypeProductData.id}','${listTypeProductData.nameProduct}','${listTypeProductData.idPresentation}','${listTypeProductData.price}','${listTypeProductData.priceSale}','${listTypeProductData.expirationDate}')"><img src="${pageContext.request.contextPath}/resources/images/edit_icon.png" alt="HTML tutorial" style="width:20px;height:20px;border:0"></a></td>
							<td class="tdDatatable"><a id="linkID_delete" class="confirm-delete" data-id="${listTypeProductData.id}" href="#"><img src="${pageContext.request.contextPath}/resources/images/delete_icon.png" alt="HTML tutorial" style="width:24px;height:24px;border:0"></a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
			</div>
		</div>
	</div>
</header>
<div id="frmMaintenanceProduct" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<div id="idTitleModal">
					<h4 class='modal-title'>
						<spring:message code="maintenance.type.product.title.add"/>
					</h4>				
				</div>
			</div>
			<html:form method="POST" commandName="maintenanceForm" action="registerProduct.htm" id="idMaintenanceForm" novalidate="novalidate">
				<div class="modal-body">
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.type.product.name" /></label>
						<html:input path="nameProduct" class="form-control" maxlength="60" id="nameProduct"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.product.presentation" /></label>
						<html:select path="idPresentation" id="idPresentation" class="form-control">
							<html:option value="0">
								<spring:message code="maintenance.product.option.0"/>
							</html:option>
							<html:options items="${listAllPresentation}" itemLabel="namePresentation" itemValue="id" />
						</html:select> 
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.product.price.unit" /></label>
						<html:input path="price_Product" class="form-control" maxlength="60" id="price"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="maintenance.product.price.sale" /></label>
						<html:input path="price_sale" class="form-control" maxlength="60" id="priceSale"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label for="userName" class="labelForm"><spring:message code="register.kardex.expiration.date" /></label>
						<html:input path="strExpirationDate" date-format="mm/dd/yyyy" class="form-control" type="date" id="strExpirationDate"/>
					</div>
				</div>
				<div id="divIdValue"></div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default" id="idSave">
						<spring:message code="maintenance.botton.new.form"/>
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
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
		        <p><spring:message code="confirm.option.messages.delete.product" /></p>
		    </div>
		    <div class="modal-footer">
		      <a href="javascript:callback()" id="btnYes" class="btn danger btn-primary btn-large confirModal">Yes</a>
		      <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
		    </div>
	    </div>
    </div>
</div>
<script>
$(document).ready(function() {
		
	$("#idMaintenanceForm").validate({
		rules: {
			nameProduct: "required",
			idPresentation : {
			    required: true
			},
			price_Product:{
				required:true,
				number:true
			},
			price_sale:{
				required:true,
				number:true,
// 				greaterThan:"#price"
			},
			strExpirationDate:"required"
		},
		messages: {
			nameProduct: '<spring:message code="maintenance.generic.field.required" />',
			idPresentation: '<spring:message code="maintenance.generic.field.required" />',
			price_Product:{
					required:'<spring:message code="maintenance.generic.field.required" />',
					number:'<spring:message code="login.error.number" />',
				},
			'tbPresentation.id': '<spring:message code="maintenance.generic.select.required" />',
			price_sale:{
				required:'<spring:message code="maintenance.generic.field.required" />',
				number:'<spring:message code="login.error.number" />',
// 				greaterThan:'<spring:message code="login.error.number" />'
			},
			strExpirationDate: '<spring:message code="maintenance.generic.field.required" />'
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
$("#new_product" ).click(function( event ) {
	$('#frmMaintenanceProduct').modal('show');
	$( "#nameProduct" ).val("");
	$( 'select' ).val(0);
	$( "#price" ).val("");
	$( "#priceSale" ).val("");
	$( "#strExpirationDate" ).val("");
	$("#idSave").html('<spring:message code="maintenance.roles.botton.new.role.form" />');
});

function updateProduct(idValue,nameProduct,idPresentation,price,priceSale,expirationDate){
	console.log("Valor date : "+expirationDate);
// 	$(".error").html('');
// 	$(".error").removeClass("error");
	$("#divIdValue").empty();
	$('#frmMaintenanceProduct').modal('show');
	$( "#nameProduct" ).val(nameProduct+"");
	$( 'select' ).val(idPresentation+"");
	$( "#price" ).val(price+"");
	$( "#priceSale" ).val(priceSale+"");
	$( "#strExpirationDate" ).val(expirationDate+"");
	$( "#frmMaintenance" ).dialog('option', 'title', '<spring:message code="maintenance.areas.title.update" />');
	$("#idSave").html('<spring:message code="maintenance.roles.botton.update.role.form" />');
	$("#divIdValue").append('<input id="idValue" name="id" type="hidden" value="'+idValue+'"/>');
}

function callback(id,option) {
	var id = $('#modalConfirm').data('id');
	document.location="${pageContext.request.contextPath}/deleteMaintenanceProduct.htm?idProduct="+id;
	$('#modalConfirm').modal('hide');
}
</script>