<%@ include file="/WEB-INF/common/taglib.jsp"%>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/resources/css/private.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commons.css"></link>
 
<header>
<div class="container">
	<br>
	<br>
	<br>
	<div class="row" id="idTitleList">
		<div class="col-lg-12">
			<h3><spring:message code="register.kardex.title" /></h3>
		</div>
	</div>
	<div class="row" id="idFindProduct">
		<div id="divFormDiv" class="formDiv">
			<label><spring:message code="register.kardex.producto" /></label>
		</div>
		<div id="divFormDiv" class="formDiv col-lg-4 col-lg-offset-4">
			<input	type="text" maxlength="60" id="idNameProduct" class="form-control" />
		</div>
		<br>
		<br>
		<div id="divFormDiv" class="formDiv col-lg-4 col-lg-offset-4">
			<button type="submit" id="idFindProduct" class="btn btn-primary btn-lg btn_find_cj">
				<spring:message code="maintenance.generic.button.find"/>
			</button>
		</div>
		<div id="idShowError" class="lblmessagesred col-lg-4 col-lg-offset-4"></div>
		<input type="hidden" maxlength="60" id="idValueNameProduct" value="${nameProduct}" /> 
		<input type="hidden" maxlength="60" id="idValueProduct" value="${productId}" />
	</div>
	<br />
	<div>
		<c:if test="${listProduct==null}">
			<spring:message code="maintenance.type.product.list.empty" />
		</c:if>
		<c:if test="${listProduct!=null}">
		<div class="row">
			<div class="col-lg-12">
				<table class="table" id="table">
					<thead>
						<tr>
							<th><spring:message code="maintenance.generic.table.id" /></th>
							<th><spring:message	code="maintenance.type.product.nombre.presentation" /></th>
							<th><spring:message	code="maintenance.presentation.nombre.presentation" /></th>
							<th><spring:message	code="maintenance.product.price.sale.title" /></th>
							<th><spring:message	code="register.kardex.expiration.date.title" /></th>
							<th><spring:message	code="maintenance.generic.table.registration" /></th>
						</tr>				
					</thead>
					<tbody>
					<c:forEach items="${listProduct}" var="listProductData">
						<tr	>
							<td class="tdDatatable">${listProductData.id}</td>
							<td class="tdDatatable">${listProductData.nameProduct}</td>
							<td class="tdDatatable">${listProductData.namePresentation}</td>
							<td class="tdDatatable">${listProductData.priceSale}</td>
							<td class="tdDatatable">${listProductData.expirationDate}</td>
							<td class="tdDatatable"><a id="linkID"
								href="javascript:listKardex('${listProductData.id}','${listProductData.nameProduct}')"><img
									src="${pageContext.request.contextPath}/resources/images/1418564230_process.png"
									alt="HTML tutorial" style="width: 20px; height: 20px; border: 0"></a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</c:if>
	</div>
	<br />
	<div>
		<c:if test="${listKardex==null && valueKardexList==1}">
			<div id="divFormDiv" class="formDiv">
				<button type="submit" id="idAddNewKardex" class="btn btn-primary btn-lg btn_find_cj">
					<spring:message code="register.kardex.button.new" />
				</button>
			</div>
		</c:if>
		<c:if test="${listKardex!=null}">
			<div class="row">
				<div id='idTitleList'>
					<label class='titlePage'><spring:message code="register.kardex.master.sub.title" /></label>
				</div>
			</div>
			<div class="row">
				<button type="button" id="idNewKardexDetail" class="btn btn-primary btn-lg btn_find_cj">
					<spring:message code="register.kardex.new.detail" />
				</button>
			</div>
			<c:if test="${errorStockProduct=='error'}">
				<label class="labelForm"><spring:message code="error.exceed.limit.product" /></label>
			</c:if>
			<div class="row">
				<div class="col-lg-12">
					<table class="table" id="idTableDetail">
						<thead>
							<tr>
								<th><spring:message code="maintenance.generic.table.id" /></th>
								<th><spring:message code="maintenance.type.product.nombre.presentation" /></th>
								<th><spring:message	code="maintenance.presentation.nombre.presentation" /></th>
								<th><spring:message	code="maintenance.generic.table.total.entry" /></th>
								<th><spring:message	code="maintenance.generic.table.total.egress" /></th>
								<th><spring:message code="maintenance.generic.table.count.total" /></th>
								<th><spring:message code="maintenance.generic.table.detail" /></th>
							</tr>				
						</thead>
						<tbody>
							<c:forEach items="${listKardex}" var="listKardexData">
								<tr>
									<td class="tdDatatable">
										<div id="idKardexTable">
											${listKardexData.id}
										</div>
									</td>
									<td class="tdDatatable">${listKardexData.nameProduct}</td>
									<td class="tdDatatable">${listKardexData.namePresentation}</td>
									<td class="tdDatatable">${listKardexData.totalEntry}</td>
									<td class="tdDatatable">${listKardexData.totalEgress}</td>
									<td class="tdDatatable">${listKardexData.countProduct}</td>
									<td class="tdDatatable">
										<a id="linkID" href="javascript:listDetailKardex('${listKardexData.id}','${listKardexData.nameProduct}','${listKardexData.priceTotalProduct}','${listKardexData.priceTotalSale}','${listKardexData.countProduct}')"><img src="${pageContext.request.contextPath}/resources/images/1419181097_Search-128.png"	alt="HTML tutorial" style="width: 20px; height: 20px; border: 0"></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
	<div id="kardexDetail"></div>
</div>
</header>

<div id="frmRegisterKardex" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<div id="idTitleModal">
					<h4 class='modal-title'>
						<spring:message code="register.kardex.title"/>
					</h4>				
				</div>
			</div>
			<div class="modal-body">
			<div id="typeMessagesFormKardex" class="lblmessagesred"></div>
			<form id="idRegisterKardexForm">
				<div id="divFormDiv" class="formDiv">
					<label class="labelForm"><spring:message code="register.kardex.type.operation" /></label>
					<select id="idTypeOperation" class="form-control">
						<option value="1"><spring:message code="register.kardex.type.operation.entry" /></option>
						<option value="2"><spring:message code="register.kardex.type.operation.egress" /></option>
					</select>
				</div>
				<div id="divFormDiv" class="formDiv">
					<div id="lblTypeOperation">
						<label class="labelForm"><spring:message code="register.kardex.type.operation" /></label>
					</div>
					<input type="text" class="form-control"  id="idCantidad" name="idCantidad"/>
				</div>
				<div id="divFormDiv" class="formDiv">
					<label class="labelForm"><spring:message code="register.kardex.comprobante.class" /></label>
					<div id="idSelectEntrada" style="display: none">
						<select id="idComprobanteClassEntrada"  class="form-control" >
							<option value="Boleta Venta">Boleta Venta</option>
							<option value="Factura">Factura</option>
						</select>
					</div>
					<div id="idSelectSalida" style="display: none">
						<select id="idComprobanteClassSalida"  class="form-control" >
							<option value="Boleta Venta">Boleta Venta</option>
							<option value="Informe">Informe</option>
						</select>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label class="labelForm"><spring:message code="register.kardex.comprobante.number" /></label>
						<input type="text"  class="form-control"  id="idComprobanteNumber" name="idComprobanteNumber"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<label class="labelForm"><spring:message code="register.kardex.comprobante.ticketNumber" /></label>
						<input type="text"  class="form-control"  id="idComprobanteNumber" name="idComprobanteNumber"/>
					</div>
					<div id="divFormDiv" class="formDiv">
						<input type="hidden" id="idProductKardex" /> 
						<input type="hidden" id="idDetailNameKardex" />
						<input type="hidden" id="idKardexMaster"/>
					</div>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="saveKardex">
					<spring:message code="maintenance.botton.new.form" />
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<spring:message code="close.button" />
				</button>
			</div>
		</div>
	</div>
</div>

<div id="idDetailKardex" class="modal fade">
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<div id="idTitleModal">
					<h4 class='modal-title'>
						<spring:message code="kardex.title" />
					</h4>				
				</div>
			</div>
			<div class="modal-body">
				<div id="divFormDiv" class="formDiv">
					<div id="idNameProductDetail"></div>
				</div>
				<div id="divFormDiv" class="formDiv">
					<div id="idCountProductTotal"></div>
				</div>
				<div id="divFormDiv" class="formDiv">
					<div id="idSpanPriceTotalProduct"></div>
				</div>
				<div id="divFormDiv" class="formDiv">
					<div id="idSpanPriceTotalSale"></div>
				</div>
				<br/>
				<div id="idDetailKardexData"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<spring:message code="close.button" />
				</button>
			</div>
		</div>
	</div>
	<br/>
	
</div>
<script type="text/javascript">
	$(document).ready(function() {
		 $("#contenedor").css("visibility","hidden");
	});

	function displayValues() {
		var valueSelect = $("#idTypeOperation").val();
		if (valueSelect == "1") {
			$("#lblTypeOperation").html('<label class="labelForm"><spring:message code="register.kardex.count.entry"/></label>');
			$("#idSelectEntrada").show();
			$("#idSelectSalida").hide();
		} else {
			$("#lblTypeOperation").html('<label class="labelForm"><spring:message code="register.kardex.count.egress"/></label>');
			$("#idSelectSalida").show();
			$("#idSelectEntrada").hide();
		}
	}

	$("select").change(displayValues);
	displayValues();

	$("#saveKardex").click(function(event) {
		var valueSelectForm = $("#idTypeOperation").val();
		var valueComprobanteNumber=$("#idComprobanteNumber").val();
		var valueComprobanteClase;
		var valueCantidad = $("#idCantidad").val();
		var idProduct = $("#idProductKardex").val();
		var typeKardexOperation = "newKardex";

		if(valueSelectForm=="1"){
			valueComprobanteClase = $("#idComprobanteClassEntrada").val();
		}else{
			valueComprobanteClase = $("#idComprobanteClassSalida").val();
		}
		
		if(valueCantidad==""){
			$("#typeMessagesFormKardex").html('<label class="labelForm"><spring:message code="validation.count.requerid"/></label>');
		}else if(!$.isNumeric(valueCantidad)){
			$("#typeMessagesFormKardex").html('<label class="labelForm"><spring:message code="validation.count.incorrect"/></label>');
		}else if(valueComprobanteNumber==""){
			$("#typeMessagesFormKardex").html('<label class="labelForm"><spring:message code="validation.comprobanteNumber.requerid"/></label>');	
		}else if(!$.isNumeric(valueComprobanteNumber)){
			$("#typeMessagesFormKardex").html('<label class="labelForm"><spring:message code="validation.comprobanteNumber.incorrect"/></label>');
		}else if(valueComprobanteClase==""){
			$("#typeMessagesFormKardex").html('<label class="labelForm"><spring:message code="validation.comprobanteclase.requerid"/></label>');
		}else{
			saveKardexByIdProduct(valueSelectForm, valueComprobanteNumber,
					valueComprobanteClase, valueCantidad, idProduct,
					typeKardexOperation);
		}
		
	});

	function saveKardexByIdProduct(valueSelectForm, valueComprobanteNumber,
			valueComprobanteClase, valueCantidad, idProduct,
			typeKardexOperation) {	
		var nameProduct = $("#idValueNameProduct").val();
		var idKardex = $("#idKardexMaster").val();
		document.location = "${pageContext.request.contextPath}/saveKardexByProduct.htm?nameProduct="+nameProduct+"&productId="+ idProduct+ "&cantidad="+ valueCantidad+ "&comprobanteClase="+ valueComprobanteClase+"&comprobanteNumber=" + valueComprobanteNumber+"&idKardex="+idKardex+"&typeOperation="+valueSelectForm;
	}

	$("#idFindProduct").click(function(event) {
		$("#idShowError").empty();
		var nameProduct = $("#idNameProduct").val();
		if(nameProduct==""){
			$("#idShowError").html('<label class="labelForm"><spring:message code="validation.insert.one.criteria"/></label>');
		}else{
			document.location = "${pageContext.request.contextPath}/findProduct.htm?nameProduct="+ nameProduct;	
		}
		
	});
	
	$("#idAddNewKardex").click(function(event) {
			$("#typeMessagesFormKardex").html('<label><spring:message code="register.kardex.comment.header.form"/></label>');
			$("#idTypeOperation").prop("disabled", true);
			$('#frmRegisterKardex').modal('show');
			$("#idProductKardex").val($("#idValueProduct").val());
			$("#idDetailNameKardex").val($("#idValueNameProduct").val());
	});
	
	function listKardex(idProduct, nameProduct) {
// 		alert("ID PRODUCT : "+idProduct);
		var nameProduct = $("#idValueNameProduct").val();
		document.location = "${pageContext.request.contextPath}/listKardexByProduct.htm?nameProduct="
				+ nameProduct + "&productId=" + idProduct;
		
// 		$.ajax({
// 			url : '${pageContext.request.contextPath}/listKardexByProduct.htm',
// 			type : 'GET',
// 			data : 'kardexId=' + idKardex+ "&productId=" + idProduct,
// 			success : function(response) {
// 				alert('Fue Success');
// 			},
// 			error : function() {
// 				alert('Error in AJAX');
// 			}
// 		});
	}

	function listDetailKardex(idKardex, nameProduct,priceTotalProduct,priceTotalSale,countTotalProduct) {
		$.ajax({
			url : '${pageContext.request.contextPath}/listDetailKardex.htm',
			type : 'GET',
			data : 'kardexId=' + idKardex,
			success : function(response) {
				loadDetailKardex(response,nameProduct,priceTotalProduct,priceTotalSale,countTotalProduct);
			},
			error : function() {
				alert('Error in AJAX');
			}
		});
	}
	
	function loadDetailKardex(response,nameProduct,priceTotalProduct,priceTotalSale,countTotalProduct) {
		$("#idDetailKardexData").html(response);
		$("#idNameProductDetail").html('<label class="labelFormDetail"><spring:message code="maintenance.type.product.name"/></label>&nbsp<span>'+nameProduct+'</span>');
		$("#idSpanPriceTotalProduct").html('<label class="labelFormDetail"><spring:message code="price.total.product"/></label>&nbsp<span>'+priceTotalProduct+'</span>');
		$("#idSpanPriceTotalSale").html('<label class="labelFormDetail"><spring:message code="price.total.sale"/></label>&nbsp<span>'+priceTotalSale+'</span>');
		$("#idCountProductTotal").html('<label class="labelFormDetail"><spring:message code="register.kardex.count.total"/></label>&nbsp<span>'+countTotalProduct+'</span>');
		$('#idDetailKardex').modal('show');
	}

	function loadNewKardex(idProduct, nameProduct,idKardex) {
		$("#typeMessagesFormKardex").html('<label><spring:message code="register.kardex.comment.header.form.new"/></label>');
		$("#idTypeOperation").prop("disabled", false);
		$('#frmRegisterKardex').modal('show');
		$("#idProductKardex").val(idProduct);
		$("#idDetailNameKardex").val(nameProduct);
		$("#idKardexMaster").val(idKardex);
	}
	
	$("#idNewKardexDetail").click(function(event) {
		var nameProduct = $("#idValueNameProduct").val();
		var idKardex=$("#idKardexTable").text();
		var idProduct = $("#idValueProduct").val();
		clearForm();
		loadNewKardex(idProduct,nameProduct,idKardex.trim());
	});
	
	function clearForm(){
		$("#idTypeOperation").val("1");
		$("#idCantidad").val("");
		$("#idComprobanteNumber").val("");
		displayValues();
	}
</script>