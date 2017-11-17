function checkImageType(fileName){
	
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);

}

function getFileInfo(fullName){
		
	var fileName,imgsrc, getLink, isImg;
	
	var fileLink;
	
	if(checkImageType(fullName)){ // /2017/11/16/t_645d88bc-3186-4407-a667-0e84ef1680e4_sample.jpg
		isImg = true;
		
		imgsrc = "/displayFile?fileName="+fullName; // 썸네일 주소 
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12); // =>  /2017/11/01/ 
		var end = fullName.substr(14);
		
		getLink = "/displayFile?fileName="+front + end; // 원본 주소('t_' 제거)
		
	}else{
		isImg = false;
		
		imgsrc ="/resources/images/save1.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return  {isImg:isImg, fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	
}