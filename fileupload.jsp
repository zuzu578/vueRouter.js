<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--context 설정 --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
	<head>
	<title><s:message code="common.fileupload.title"/></title>
	<link href="${ctx }/site/<c:out escapeXml='true' value='${siteIdx}'/>/jsp/fileupload/css/fileupload.css" rel="stylesheet" type="text/css"/>
	
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script>
	/* <![CDATA[ */
    $(document).ready(function(){
    	
    	opener.$.unblockUI();
    	<c:if test='${fileChk == "uploadY" || fileChk == "deleteY"}'>
    	<c:if test='${fileChk == "uploadY"}'>
    		$("input:radio[name='bbsDataThumb']", parent.opener.document).prop("checked", false);
    		<c:out escapeXml='false' value='${messageHtml}' />
    		$("input:radio[name='bbsDataThumb']:checked", parent.opener.document).parent().parent().addClass('active').siblings().removeClass('active');
    	</c:if>
    	<c:out escapeXml='false' value='${fileSizeHtml}' />
    	window.close();
    	</c:if>

    	$("#frm").submit(function(){
    		
    		if($("#upFile").val() == ""){
    			alert("<s:message code="common.fileupload.message.upload"/>");
    			$("#upFile").focus();
    			return false;
    		}
    		
    		var val = $("#upFile").val().split("\\");
    		var fileName = val[val.length-1]; //마지막 화일명
    		var fileType = fileName.substring(fileName.lastIndexOf("."));//확장자빼오기
    		
    		var extArray = new Array("txt","jpeg","jpg","png","gif","bmp","mp3","mp4","hwp","doc","docx","xls","xlsx","ppt","pptx","pdf","zip","alz");
    		
    		var extChk = false;
    		
    		for(var f=0; f<extArray.length; f++){
    			if("."+extArray[f] == fileType.toLowerCase()){
    				extChk = true;
    				break;
    			}
    		}
    		
    		if(!extChk){
    			alert("<s:message code="common.fileupload.message.no.upload"/>");		
    			return false;
    		}
    		
    		if("<s:eval expression="@config['file.text']" />" == "true"){
    			if($("#commonFileText").val() == ""){
    				if(fileType.toLowerCase() == '.jpg' || fileType.toLowerCase() == '.gif' ||
    						fileType.toLowerCase() == '.bmp' || fileType.toLowerCase() == '.png'){//허용 확장자 비교
    					alert("<s:message code="common.fileupload.message.image.alt"/>");
    					$("#commonFileText").focus();
    					return false;
    				}else if(fileType.toLowerCase() == '.mp4'){//허용 확장자 비교
    					alert("<s:message code="common.fileupload.message.movie.alt"/>");
    					$("#commonFileText").focus();
    					return false;
    				}else{
    					alert("<s:message code="common.fileupload.fileName.text"/> <s:message code="common.message.essential"/>");
    					$("#commonFileText").focus();
    					return false;
    				}
    			}
    		}
    		
    		//$.blockUI({ message: null });				
    		//opener.$.blockUI({ message : '<h1><img src="${ctx }/img/blockbusy.gif" />&nbsp;&nbsp;<s:message code="common.message.ajaxwait"/></h1>' });
    	});
    });
	/* ]]> */
	</script>	
	
	</head>
	
	<body>
	
	<!--@seed:jsp:s-->
	
	<form:form id="frm" name="frm" action="${ctx }/user/common/proc/${siteIdx}/${funcType}/${funcIdx}/${funcDataIdx}/${fileCode}/fileRegProc.do" method="post" enctype="multipart/form-data">
	
	<c:import url="/WEB-INF/views/site/${siteIdx}/jsp/fileupload/fileupload.jsp"></c:import>
			
	<!--@seed:jsp:e-->
	
	</form:form>
	<!--  웹필터 수정 -->  
	<%@ include file="/webfilter/inc/initCheckWebfilter.jsp"%>
	<!--  웹필터 수정 -->

	</body>
	
</html>