/**
 * 
 */

function commonUIcomponent() { }(jQuery);

var layerPopup = new commonUIcomponent();

commonUIcomponent.prototype.requrstURLPopup = function(url, param, loddingControll, option) {
	
};
	var htmlArr = new Array();
	htmlArr.push("<div class=\"modal fade bs-example-modal-center\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"mySmallModalLabel\" aria-hidden=\"true\">");
	htmlArr.push("	<div class=\"modal-dialog modal-dialog-centered\">");
	htmlArr.push("		<div class=\"modal-content\">");
	htmlArr.push("			<div class=\"modal-header\">");
	htmlArr.push("				<h5 class=\"modal-title\">Center Modal</h5>");
	htmlArr.push("				<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
	htmlArr.push("			</div>");
	htmlArr.push("			<div class=\"modal-body\">");
	htmlArr.push("				<p>Cras mattis consectetur purus sit amet fermentum.");
	htmlArr.push("					Cras justo odio, dapibus ac facilisis in,");
	htmlArr.push("					egestas eget quam. Morbi leo risus, porta ac");
	htmlArr.push("					consectetur ac, vestibulum at eros.</p>");
	htmlArr.push("				<p>Praesent commodo cursus magna, vel scelerisque");
	htmlArr.push("					nisl consectetur et. Vivamus sagittis lacus vel");
	htmlArr.push("					augue laoreet rutrum faucibus dolor auctor.</p>");
	htmlArr.push("				<p class=\"mb-0\">Aenean lacinia bibendum nulla sed consectetur.");
	htmlArr.push("					Praesent commodo cursus magna, vel scelerisque");
	htmlArr.push("					nisl consectetur et. Donec sed odio dui. Donec");
	htmlArr.push("					ullamcorper nulla non metus auctor");
	htmlArr.push("					fringilla.</p>");
	htmlArr.push("			</div>");
	htmlArr.push("		</div>");
	htmlArr.push("	</div>");
	htmlArr.push("</div>");
	
	$("#modalArea").html(htmlArr.join(""));

/*	var myModalEl = document.getElementById('modalArea');
	myModalEl.addEventListener('shown.bs.modal', function (event) {
		console.log("====ㅡ modal 실행1");
	});*/


function commonUIbodyMask() { }(jQuery);

var bodyMask = new commonUIbodyMask();
commonUIbodyMask.prototype.makeMask = function() {
	$("body").attr("class");//modalArea
}

var myModal = new bootstrap.Modal(document.getElementById('modalArea'), {
  keyboard: false
});