/**
 * MDH Helper 에서만 사용되는 공통
 * ★통신을 이용하지 않는 페이지★ 조작에 해당되는 공통 스크립트
 */
 //$commonPage.url_request_post("/test/test", {})
const $commonPage = {
	/** GET URL 요청 페이지 이동시. */
	url_request_get:function(urlStr){
		var requestAddress = "";
		if(true){
		requestAddress = JSStringUtils.trimToEmpty(urlStr);
		location.href=requestAddress;
		}
	},
	/** POST URL 요청 페이지 이동시. */
	url_request_post:function(urlStr,params,autoSubmit){
		var templaryForm = document.createElement("form");
		templaryForm.setAttribute("action"	,	urlStr);
		templaryForm.setAttribute("method"	,	"post");
		templaryForm.setAttribute("name"	,	"temp");
		$.each(params, function(itemKey,itemValue){//요청들어온 params를 모두 hidden Input 으로담는다.
			if(Array.isArray(itemValue)){//요청들어온 params 중 Array는 중복으로 담는다.
				itemValue.forEach(function(arrValue){
					var inputElemnet = document.createElement("input");
					inputElemnet.setAttribute("type"	, "hidden");
					inputElemnet.setAttribute("name"	, itemKey);
					inputElemnet.setAttribute("value"	, arrValue);
					templaryForm.appendChild(inputElemnet)
				});
			}else{
				var inputElemnet = document.createElement("input");
				inputElemnet.setAttribute("type"	, "hidden");
				inputElemnet.setAttribute("name"	, itemKey);
				inputElemnet.setAttribute("value"	, itemValue);
				templaryForm.appendChild(inputElemnet)
			}
		});
		//document.appendChild(templaryForm);
		console.log("6");
		console.log(templaryForm);
		document.body.appendChild(templaryForm);
		if(autoSubmit){
			templaryForm.submit();
		}else{
			return templaryForm;
		}

	},
	
	
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
};//$commonPage END Block





const modalPopup = {
	/** 최대로 열 수 있는 모달팝업 갯수 */
	MAX_MODALPOPUP_COUNT : 5,
	/** 최대로 열 수 있는 모달팝업 갯수 */
	opendModalId : [],
	/** 모달프레임 생성 */
	createModalFrame : function(createID,rType){
		var type = "gen";
		if(JSStringUtils.trimToEmpty(rType) != ""){
			type = rType;
		}
		
		var layerID ="";
		if(createID == undefined ){
			layerID = this.util_randomIDGenerator();
		}else{
			layerID = createID;
		}
		var modalFrame = document.createElement("div"); 
		modalFrame.setAttribute("class"		, "modal fade");
		modalFrame.setAttribute("id"		, layerID);
		modalFrame.setAttribute("tabindex"	, "-1");
		modalFrame.setAttribute("role"		, "dialog");
		modalFrame.setAttribute("aria-labelledby"	, "모다제목");
		modalFrame.setAttribute("aria-hidden"	, "true");
		
		var dialog = document.createElement("div"); 
		dialog.setAttribute("class"		, "modal-dialog");
		
		var content = document.createElement("div"); 
		content.setAttribute("class"		, "modal-content");
		
		var body = document.createElement("div"); 
		body.setAttribute("class"		, "modal-body");
		body.setAttribute("id"		, type+layerID);
		
		content.appendChild(body);
		dialog.appendChild(content);
		modalFrame.appendChild(dialog);
		
		this.opendModalId.push(layerID);
		//document.body.appendChild(modalFrame);
		document.getElementById("modalAppendArr").appendChild(modalFrame);
	},
	/** URL로 MODAL 호출 */
	urlModalOpen :function(rURL, rParam,closeCBFn){
		var modalId		=this.util_randomIDGenerator();
		var modalType	= "url";
		this.createModalFrame(modalId, modalType);
		
		$.ajax({
			url			: rURL,
			type		: "GET",
			dataType	: "TEXT",
			data		: rParam,
			success		: function(data){
				$("#"+modalType+modalId).html(data);
				var myModal = new bootstrap.Modal(document.getElementById(modalId), {
				  keyboard: false
				});
				myModal.show();
				var myModalEl = document.getElementById(modalId);
				myModalEl.addEventListener('hidden.bs.modal', function (event) {
					console.log("모달을 닫았습니다.");
					if(typeof closeCBFn =="function"){
						console.log("모달닫기콜백실행");
						closeCBFn();
					}else{
						console.log("모달닫기콜백실행 안함");
					}
				});
			},
			error:function(xhr, status, errorMsg){
				console.log(xhr);
				console.log(status);
				console.log(errorMsg);
			}
		});
	},
	/** HTMLString으로 MODAL 호출 */
	htmlStrModalOpen :function(rHtmlStr, rParam,closeCBFn){
		
	},
	/** 임의의 아이디 생성기 */
	util_randomIDGenerator : function (){
		var randomID =["x"];
		randomID.push( Math.trunc(Math.random() * 100000000) );
		return randomID.join("");
	},
};//modalPopup END Block