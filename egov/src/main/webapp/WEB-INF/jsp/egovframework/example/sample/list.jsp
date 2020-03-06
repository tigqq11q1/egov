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
    <title> 사원 조회
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">

   $(document).ready(function(){
      
   });
   function fn_goAdd(){
      alert("등록버튼")
       location.href = "<c:url value='/add.do'/>" 
   }
   function fn_searchBtn(){
      alert("검색버튼")
   }
   /*
   function fn_delete(){
      alert("삭제")
   }
   */
   
   <!--
   /* pagination 페이지 링크 function */
   function fn_egov_link_page(pageNo){
   	document.listForm.pageIndex.value = pageNo;
   	document.listForm.action = "<c:url value='/list.do'/>";
      	document.listForm.submit();
   }
   
   //-->
   
   // 전제 체크 이벤트
   function fn_allChk(obj){
       var chkObj = document.getElementsByName("chk");
       var rowCnt = chkObj.length - 1;
       var check = obj.checked;
       if (check) { 
           for (var i=0; i<=rowCnt; i++){
            if(chkObj[i].type == "checkbox")
                chkObj[i].checked = true;
           }
       } else {
           for (var i=0; i<=rowCnt; i++) {
            if(chkObj[i].type == "checkbox"){
                chkObj[i].checked = false;
            }
           }
       }
   } 

   function fn_goView(memberno){
	   alert(memberno)
	      location.href = "<c:url value='/view.do?memberno="+memberno+"'/>"
	   }
</script>
</head>

  <body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
           <!-- 타이틀 -->
           <div id="title">
              <ul>
                 <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                                  사원 조회
                 </li>
              </ul>
           </div>
           <!-- // 타이틀 -->
           <div id="search">
           
              <ul>
                 <li><label for="searchName" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="" cssClass="txt"/>
                    </li>
                 <li>
                       <span class="btn_blue_l">
                           <a href="javascript:fn_searchBtn();"><spring:message code="button.search" /></a>
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
                 </colgroup>
                 <tr>
                    <th align="center"><input type="checkbox" name="chkAll" id ="chkAll" onclick="fn_allChk(this);"/></th>
                    <th align="center">이름</th>
                    <th align="center">주민번호</th>
                    <th align="center">성별</th>
                    <th align="center">기술등급</th>
                    <th align="center">상태</th>
                    <th align="center">근무정보 </th>
                 </tr>
                 <c:forEach var="list" items="${list}" varStatus="status">
                     <tr>
                        <td align="center">
                        	<input type="checkbox" name="chk"  id="chk"value=""/>
                        	<input type="hidden" name="memberno" id="memberno" value="${list.memberno}"/>
                        </td>
                     <%--    <td align="center"><a href="/view.do?memberNo=${list.memberno}">${list.kname}</a></td> --%>
                        <td align="center" onclick="fn_goView('${list.memberno}')" style="cursor:pointer;" >${list.kname}</td>
                        <td align="center">${list.mynumber1}-${list.mynumber2}</td>
                        <td align="center">${list.genderNm}</td>
                        <td align="center">${list.stat}</td>
                        <td align="center">${list.listStat}</td>
                        <td align="center">${list.workYnNm}</td>
                     </tr>
                 </c:forEach>
                 
                 <c:if test="${empty list }">
	                 <tr>
	                 	<td colspan="8" >data null</td>   
	                 </tr>
               </c:if>      
              </table>
           </div>
           <!-- /List --> 
           <div id="paging">
              <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
              <form:hidden path="pageIndex" />
           </div>
           <div id="sysbtn">
             <ul>
                 <%-- <li>
                     <span class="btn_blue_l">
                       <a href="javascript:fn_delete();"><spring:message code="button.delete" /></a>
                         <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li> --%>
                 <li>
                     <span class="btn_blue_l">
                         <a href="javascript:fn_goAdd();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
           </div>
        </div>
    </form:form>
</body>
</html>