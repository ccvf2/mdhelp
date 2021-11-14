/**
 * 
 */
 
function mdhelpeRequest (){
	var searchWordArray = new Array();
	var requestURL ="http://mdhelp.kr/api";
	
	var options = {
		/** 최대로 요청할수 있는 총 검색어 목록 갯수 0:무제한, 음수값:오류 */
		searchWordMAXCount :0,
		/**한번에 호출할 건수 */
		searchWordSplitCount :9,
		/** AJAX연속 통신시 중간에 줄 지연시간*/
		requestDelayTime : 1000,
	};
	
	
	this.searchWordGet = function(){
		return searchWordArray;
	};
	this.searchWordSet= function(arr, callback){
		searchWordArray=arr;
		
		if(typeof callback == "function"){
			callback();
		}else{
			console.log("callback Type Error");
		}
	};
	
	this.optionSetting = function(){
		return options;
	};
	this.optionSetValue = function(optionKey,setValue){
		options[optionKey]=setValue;
	}
	
	this.dataValidator = function(){
		var validResult = true;
		if(searchWordArray.length <= 0){
			validResult= false;
			console.log("요청할 데이터가 없거나 잘못되었습니다.\"searchWordGet\"Method를 통해 데이터를 확인하세요.");
		}
		
		return validResult;
	}
	
}


/** String을 받아 배열을 반환한다.,*/
mdhelpeRequest.prototype.searchwordStringToArray = function(str, split){
	
};

/** 리퀘스트를 요청 할수 있다.*/
mdhelpeRequest.prototype.requestStart_test = function(){
	var testArr =[];
	testArr.push("CY2AR1118");
	
	var param = {"searchWord" : testArr};
	
	var url_test1 ="/member/getdata.ajax";
	var url_test2 ="https://openapi.naver.com/v1/search/shop.json?query=CY2AR1118&sort=asc&display=1";
	
	$.ajax({
		url: url_test2,
		type:"POST",
		dataType:"TEXT",
		data:param,
		success:function(data){
			console.log(data)
			console.log(data)
			
		},
		error:function(xhr, status, errorMsg){
			console.log(xhr)
			console.log(status)
			console.log(errorMsg)
		}
	});
};
mdhelpeRequest.prototype.requestStart = function(){
	var valid = this.dataValidator();
	if(valid){
		/** 요청할 총 검색어 목록 */
		var requestData = this.searchWordGet();
		/** 요청할 총 검색어 목록 길이 */
		var requestDataLength= requestData.length;
		/** 요청할 셋팅값 */
		var requestOptions = this.optionSetting();
		
		/** 요청할 셋팅값 */
		var requestTempSplitArray = new Array();
			for(var i=0 ; i<requestDataLength ;i++){
				var dataItem = requestData[i];
				var splitArrayLength = requestTempSplitArray.length;
				var searchWordSplitCount =  Number(requestOptions["searchWordSplitCount"]);
				if( splitArrayLength == searchWordSplitCount ){
					//요청
					
					
					requestTempSplitArray = new Array();
					requestTempSplitArray.push(dataItem);
				}else if( (splitArrayLength==0) || (splitArrayLength>searchWordSplitCount) ){
					requestTempSplitArray.push(dataItem);
				}
			}//END FOR
			
	}else{
		console.log("데이터 검증에 실패 하였습니다.");
	}//first IF_ELSE
};



