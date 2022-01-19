/**
 * 
 */
 
const JSStringUtils = {
	trimToEmpty : function(str){
		if(typeof str == "string"){
			str.trim();
		}else{
			console.log("[JSStringUtils][trimToEmpty] parmata Type Error - return To Empty String");
			str ="";
		}
		return str;
	}
};