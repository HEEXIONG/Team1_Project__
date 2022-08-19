<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>register</h1>
<form action="/board/register" method="post">
상품명<input type="text" name="title"><br>
상품정보<input type="text" name="pinfo"><br>
판매자<input type="text" name="celler"><br>
가격<input type="number" name="price"><br>
<hr>
<div class="form_section_title">
            	<div class="form_section">
         	<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
                    			</div>
                    		</div>  
                    		</div>
                    		

<input type="submit">
</form>
<hr>

<div id="uploadResult">
<!-- <div id="result_card">
	<div class="imgDeleteBtn">x</div>
	<img src="/upload/display?fileName=test.png">
</div> -->
</div>











<script type="text/javascript">
$("input[type='file']").on("change", function(e){
	
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	
	/* if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	} */
	
	formData.append("uploadFile", fileObj);
	//파일여러개일때
	/* for(let i = 0; i < fileList.length; i++){
		formData.append("uploadFile", fileList[i]);
	} */
	$.ajax({
		url: '/upload/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    		success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
			error : function(result){
				alert("이미지 파일이 아닙니다.");
	    	}
	});
});

/* var, method related with attachFile */
let regex = new RegExp("(.*?)\.(jpg|png)$");
let maxSize = 5048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;		
	/* 이미지 출력 */
	
}
function showUploadImage(uploadResultArr){
	
	/* 전달받은 데이터 검증 */
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr[0];
	
	let str = "";
	
	let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
	
	str += "<div id='result_card'>";
	str += "<img src='upload/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn'>x</div>";
	str += "</div>";		
	
		uploadResult.append(str);     
    
}


</script>
                    			 
</body>
</html>