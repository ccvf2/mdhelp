/**
 * 
 */

function commonUIcomponent() {
	var layerIdMapper = new Array();
 }(jQuery);

commonUIcomponent.prototype.requrstURLPopup = function(url, param, id,closeCallBack, option) {
	console.log(url);
	console.log(param);
	console.log(id);
	console.log(closeCallBack);
	console.log(option);
	this.coreRequrst(url, param);
};
commonUIcomponent.prototype.coreRequrst = function(url, param) {
	$.ajax({
		url: url,
		type:"GET",
		success:function(data){
			console.log(data);
		},
		error:function(xhr, status, errorMsg){
			console.log(xhr)
			console.log(status)
			console.log(errorMsg)
		}
	});
};
