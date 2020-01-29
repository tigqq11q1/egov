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
	
	function fn_update(){
		if(confirm("수정을")){
			$("#editForm").ajaxSubmit({
					type:"POST",
					url:"<c:url value='/updateAjax.do'/>",
					data :{mNo : "${data.no}"},
					async: false,
					success:function(data){
						alert("수정되었습니다.");
						location.href = "<c:url value='/list.do'/>" 
					}
				});
		}
	}
</script>
 
	<div id="contents">
		<div>
			<h3>edit</h3>
			<form id ="editForm">
				<table>
					<tbody>
						<c:if test="${not empty data}">
						<tr>
						<th scope= "row">고유번호</th>
							<td><c:out value="${data.no}"/></td>
						</tr>
						<tr>
						<th scope= "row">이름</th>
							<td><c:out value="${data.name}"/></td>
						</tr>
						<tr>
						<th scope= "row">나이</th>
							<td><input type="text" id="age" name="age" value="<c:out value='${data.age}'/>" title="age"/></td>
						</tr>
						<tr>
						<th scope= "row">생년월일</th>
							<td><input type="text" id="bday" name="bday" value="<c:out value='${data.bday}'/>" title="bday"/></td>
						</tr>
						<tr>
						<th scope= "row">성별</th>
							<td>
							<select id="gender" name="gender">
									<option value="1" <c:if test="${data.gender eq '남'}">selected</c:if>>남</option>
									<option value="2" <c:if test="${data.gender eq '여'}">selected</c:if>>여</option>
							</select>
							</td>
						</tr>
						<tr>
						<th scope= "row">기타</th>
							<td><input type="text" id="info" name="info" value="<c:out value='${data.info}'/>" title="info"/></td>
						</tr>
						<tr>
						<th scope= "row">가입일</th>
							<td><c:out value="${data.joinDate}"/></td>
						</tr>
						</c:if>
						<c:if test="${empty data}">
						<tr><th>데이터 없음<th></tr>
						</c:if>
					</tbody>
				</table>
			</form>
			<div>
				<a href="javascript:void(0);" onclick="fn_update();">등록</a>
				<a href="javascript:void(0);" onclick="fn_list();">목록</a>
			</div>
		</div>
	
	</div>
