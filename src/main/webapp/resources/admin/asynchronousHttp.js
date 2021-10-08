/**
 * 
 */
 
function coreHttpConnection(){}


var httpSend = new coreHttpConnection();

httpSend.prototype.ajax = function(requestURL_Str, paramObject, callBackFunctionName, etc1, etc2){
	$.ajax({
	url: requestURL_Str,
	type:"POST",
	dataType:"text",
	success:function(data){
		console.log(data)
		},
	error:function(xhr, status, errorMsg){
		console.log(xhr)
		console.log(status)
		console.log(errorMsg)
		}
	});
};