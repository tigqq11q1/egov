<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
<c:set var="nowYear"><fmt:formatDate value="${today }" pattern="yyyy"/></c:set>
<script>

	$(document).ready(function(){
	});
	
	function fn_list(){
		 location.href = "<c:url value='/list.do'/>" 
	}
	function fn_save(){
		//if(!fn_validationCheck()) return false;
		if(confirm("저장을")){
			$("#addForm").ajaxSubmit({
				type:"POST",
				url:"<c:url value='/addAjax.do'/>",
				//data:{},
				async: false,
				//dataType:JSON,
				success:function(data){
					alert("등록되었습니다.");
					location.href = "<c:url value='/list.do'/>" 
				}
			});
		}
	}
	
	
</script>
 
	<div>
	
	
	</div>
	<div id="contents">
		<div>
			<h3>add</h3>
			<form id ="addForm">
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td><input type="text" id="name" name="name" value=""/></td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input type="text" id="age" name="age" value="" maxlength="2"/></td>
						</tr>
						<tr>
							<th>생년월일</th>	
							<td><input type="text" id="bday" name="bday" value="" maxlength="8" /></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<select id="gender" name="gender">
									<option value="">선택</option>
									<option value="1">남</option>
									<option value="2">여</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td><input type="text" id="info" name="info" value="" /></td>
						</tr>
						<tr>
							<th>가입일</th>
							<td><input type="text" id="joinDate" value="${today }" readonly="readonly"/></td>
						</tr>
					</tbody>
				</table>
			</form>	
			
			<div>
				<a href="javascript:void(0);" onclick="fn_save();">등록</a>
				<a href="javascript:void(0);" onclick="fn_list();">목록</a>
			</div>
		</div>
	
	
	</div>
