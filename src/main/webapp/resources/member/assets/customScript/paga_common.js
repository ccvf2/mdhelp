/**
 * MDH Helper 에서만 사용되는 공통
 * ★통신을 이용하지 않는 페이지★ 조작에 해당되는 공통 스크립트
 */
const $commonPage = {
	url_request_get:function(urlStr){
		var requestAddress = "";
		if(true){
		requestAddress = JSStringUtils.trimToEmpty(urlStr);
		location.href=requestAddress;
		}
	},
	url_request_post:function(urlStr,params){},
	mainPageInnerMoving : function(targetId, duration){
		
		var pathname = window.location.pathname;
		if(pathname == "/member/main"){
			var elementTargetId = JSStringUtils.trimToEmpty(targetId);
			var offsetValue = 0;
			var durationTime = 100;
			if( (duration != undefined) && (duration != null) && (duration != "") ){
				if(isNaN(duration) == false){
					durationTime = duration;
					console.log("[$commonPage]\"mainPageInnerMoving\"의 duration value:["+durationTime+"ms]"); 
				}else{
					console.log("[$commonPage]\"mainPageInnerMoving\"의 duration이 Number Type이 아닙니다.value:["+durationTime+"ms]"); 
				}
			}else{
				console.log("[$commonPage]\"mainPageInnerMoving\"의 duration이 지정되지 않았습니다.value:["+durationTime+"ms]"); 
			}
			
			console.log("[$commonPage]\"mainPageInnerMoving\" - [ elementTargetId ] - value:["+elementTargetId+"ms]"); 
			if(elementTargetId != ""){
				const $offset = $("#" +elementTargetId).offset();
				offsetValue = $offset.top;
			}
			$("html, body").animate({scrollTop: offsetValue},durationTime);
		}else{
			location.href="/member/main";
		}
	},
}