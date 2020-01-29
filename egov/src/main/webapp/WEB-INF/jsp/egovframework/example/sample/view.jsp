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
	function fn_edit(mNo){
		location.href = "<c:url value='/edit.do?mNo="+${view.no}+"'/>"
	}
</script>
 
	<div id="contents">
		<div>
			<h3>view</h3>
				<table>
					<tbody>
						<c:if test="${not empty view}">
						<tr>
						<th scope= "row">번호</th>
							<td><c:out value="${view.no}"/></td>
						</tr>
						<tr>
						<th scope= "row">이름</th>
							<td><c:out value="${view.name}"/></td>
						</tr>
						<tr>
						<th scope= "row">나이</th>
							<td><c:out value="${view.age}"/></td>
						</tr>
						<tr>
						<th scope= "row">생년월일</th>
							<td><c:out value="${view.bday}"/></td>
						</tr>
						<tr>
						<th scope= "row">성별</th>
							<td><c:out value="${view.gender}"/></td>
						</tr>
						<tr>
						<th scope= "row">기타</th>
							<td><c:out value="${view.info}"/></td>
						</tr>
						<tr>
						<th scope= "row">가입일</th>
							<td><c:out value="${view.joinDate}"/></td>
						</tr>
						</c:if>
						<c:if test="${empty view}">
						<tr><th>데이터 없음<th></tr>
						</c:if>
					</tbody>
				</table>
			
			<div>
				<a href="javascript:void(0);" onclick="fn_edit();" id ="editBtn">수정</a>
				<a href="javascript:void(0);" onclick="fn_list();" id ="listBtn">목록</a>
			</div>
		</div>
	<!--  -->
	
	<div id="DIV_EDIT">
			
	</div>
	<!--  -->
	
	</div>
