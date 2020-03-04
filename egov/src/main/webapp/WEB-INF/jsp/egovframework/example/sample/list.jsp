<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
    
    function fn_searchCondition(){
    	alert( $("#searchCondition").val())
       	document.listForm.action = "<c:url value='/list.do'/>"
       	document.listForm.submit(); 
    }


        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="sampleVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        	
        		<ul>
        		<li>
        		<label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use" onchange="fn_searchCondition()">
        					<form:option value="" label="전체" />
        					<form:option value="B" label="번역봉사" />
        					<form:option value="K" label="기관방문" />
        					<form:option value="N" label="일반" />
        					<form:option value="S" label="신청 일시중지 " />
        					<form:option value="P" label="페널티 일시중지" />
        					<form:option value="J" label="직원 일시중지" />
        					<form:option value="H" label="활동제테스트" />
        				</form:select>
        		</li>
        		<li>
        			    <label for="searchKeyword" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchKeyword" cssClass="use">
        					<form:option value="G" label="새싹" />
        					<form:option value="Y" label="열매" />
        				</form:select>
        		</li>
        		<li>	
        			    <label for="searchKeyword" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchKeyword" cssClass="use">
        					<form:option value="" label="모두" />
        					<form:option value="I" label="아동서신" />
        					<form:option value="H" label="후원자서신" />
        				</form:select>
        		</li>
        			<li>
        			    <label for="searchName" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="" cssClass="use">
        					<form:option value="NAME" label="이름" />
        					<form:option value="ID" label="ID" />
        					<form:option value="EMAIL" label="EMAIL" />
        				</form:select>
        			</li>
        			<li><label for="searchName" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				<col width="150"/>
        				<col width="80"/>
    					<col width="80"/>
    					<col width="80"/>
    					<col width="80"/>
    					<col width="80"/>
    					<col width="80"/>
        				<col width="?"/>
        				<col width="60"/>
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center">유형구분</th>
        				<th align="center">봉사단계</th>
        				<th align="center">이름</th>
        				<th align="center">생년월일</th>
        				<th align="center">아이디</th>
        				<th align="center">이메일</th>
	        			<th align="center">번역구분</th>
	        			<th align="center">담당직원</th>
	        			<th align="center">가입일</th>
        			</tr>
        			<c:forEach var="data" items="${list}" varStatus="status">
            			<tr>
            		 <%-- 	<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/> </td> --%>
            				<td align="center"><c:out value="${status.count}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.typeGubunNm}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.serviceNm}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.name}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.birthDay}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.id}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.email}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.translation}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.staff}"/>&nbsp;</td>
            				<td align="center"><c:out value="${data.regDate}"/>&nbsp;</td>
            			<%-- 	
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${data.id}"/>')"><c:out value="${data.id}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${data.name}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${data.useYn}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${data.description}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${data.regUser}"/>&nbsp;</td> --%>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List 
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>-->
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div>
        </div>
    </form:form>
</body>
</html>
