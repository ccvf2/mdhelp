/**
 * 
 */
 
const testSearchWoed = ["CZ1YMR913    ", "        CY1WE0855", "CY1YM3812", "CY1YMP383","        CY1WE0855", "CY2YM3822", "CY2YM3833", "CZ2AE0698", "CZ2YM3922", "CY1YL3803", "CY1YL3812", "CY1YLG320", "CZ1RR1017", "CZ1WR0200", "CZ1YL1901", "CZ1YL3904", "CZ1YLM300", "CZ1YLM600", "CY2AR1118", "CY2YL3822", "CY2YL3832", "CY2YL3833", "CZ2YL3921", "CZ2KR1018", "CZ2YL1921", "CZ2YL3931", "CZ2YL3932", "CZ2YLM320", "CY2YM6822", "CZ2YMR912", "CZ1YM6911"];
 
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
			console.log("searchWordSet 의 콜백정상 실행요청.");
			callback();
		}else if( (callback == "") || (callback == undefined) || (callback == unll)){
			console.log("searchWordSet 의 콜백이 정의되지 않았습니다.");
		}else if( typeof callback != "function"){
			console.log("searchWordSet 의 콜백이 function이 아닙니다.(callback Type Error)");
		}else{
			console.log("searchWordSet 의 콜백을 실행 할 수 업습니다.");
		}
	};
	
	this.optionSetting = function(){
		return options;
	};
	this.optionSetValue = function(optionKey,setValue){
		options[optionKey]=setValue;
	};
	
	this.dataValidator = function(){
		var validResult = true;
		if(searchWordArray.length <= 0){
			validResult= false;
			console.log("요청할 데이터가 없거나 잘못되었습니다.\"searchWordGet\"Method를 통해 데이터를 확인하세요.");
		}
		return validResult;
	};
	
	
}//mdhelpeRequest END













mdhelpeRequest.prototype.searchWordSpliter = function(originalArray){
	var option = this.optionSetting();
	var resultObj = new Array();
	var tempArray = new Array();
	
	var OAL = originalArray.length;

	//console.log("this.searchWordSplitCount : " + this.options.searchWordSplitCount);
	for(var i = 0 ; i<OAL ; i++){
		var o_searchWord = originalArray[i];
		if(tempArray.length >= option.searchWordSplitCount){
			resultObj.push(tempArray);
			tempArray = new Array();
			tempArray.push(o_searchWord);
		}else{
			tempArray.push(o_searchWord);
		}
	}
	
	if(tempArray.length != 0){
		resultObj.push(tempArray);
	}
	return resultObj;
};

/** String을 받아 배열을 반환한다.,*/
mdhelpeRequest.prototype.searchwordStringToArray = function(str, split){
	var resultArray = str.split(split);	
};

/** 리퀘스트를 요청 할수 있다.*/
mdhelpeRequest.prototype.requestStart_test = function(){
	var testArr =[];
	testArr.push("CY2AR1118");
	
	var param = {"searchWord" : testArr};
	
	var url_test1 ="/member/getdata.ajax";
	//var url_test2 ="https://openapi.naver.com/v1/search/shop.json?query=CY2AR1118&sort=asc&display=1";
	
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
mdhelpeRequest.prototype.searchWordDuplicateFilter = function(originalArray){
	var OAL = originalArray.length;
	
	var filteringArray = new Array();//중복이 제거죔 배열
	var duplicateIndex = new Array();//중복된 targetIndex
	for(var idx = 0; idx<OAL ;idx++){
		var searchWord = originalArray[idx];
		var addFlag = true;
		for(var ix = 0; ix<filteringArray.length ;ix++){
			if(searchWord == filteringArray[ix]){
				addFlag = false;
				duplicateIndex.push(idx);
			}
		}//End FOR
		if(addFlag){
			filteringArray.push(searchWord);
		}
	}//End FOR
	var resultObj = {
		"originalArray"			: originalArray,
		"filteringArray"		: filteringArray,
		"duplicateTargetIndex"	: duplicateIndex
	};
	return resultObj;
};

/** 검색어 정제기*/
mdhelpeRequest.prototype.searchWordStandardize = function(targetArray){
	var TAL = targetArray.length;
	var resultArray = new Array();
	if(TAL > 0){
		for(var ix = 0 ; ix< TAL ;ix++){
			var targetSW = targetArray[ix];
			targetSW = targetSW.trim();
			resultArray.push(targetSW);
		}
	}
	return resultArray;
};



















function testGo(){
	//객체를 생성
	var test_mdhelpeRequest = new mdhelpeRequest();
	//각 키워드의 trim을 실시
	var obj1 = test_mdhelpeRequest.searchWordStandardize(testSearchWoed)
	console.log(obj1);
	//중복된 키워드 찾아낸다. = {originalArray:요청된 키워드배열, filteringArray:중복이 제거된 키워드배열, duplicateTargetIndex:원본기준 중복된배열인덱스.}
	var obj2 = test_mdhelpeRequest.searchWordDuplicateFilter(obj1);
	console.log(obj2);
	//각 키워드를 한번에 네이버에 요청 할 수 있는 건수로 잘른다.
	var obj3 = test_mdhelpeRequest.searchWordSpliter(obj2.filteringArray);
	console.log(obj3);
	test_mdhelpeRequest.searchWordSet(obj3, function(){});
	
}