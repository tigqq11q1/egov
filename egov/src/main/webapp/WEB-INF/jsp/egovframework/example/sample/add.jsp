<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
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
    <title> 사원 상세정보
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="sampleVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
       
        function fn_add(){
        	alert(1)
        	 /* 글 등록 function */
            $("#detailForm").prop('action', '/addSample.do');
            $("#detailForm").prop('method', 'post');
            $("#detailForm").submit();
        } 
       
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="sampleVO"  id="detailForm"  name="detailForm" enctype="multipart/form-data">
   <input type="hidden" id="memberno" name="memberno" value="${info.memberno}"/>
    <div id="content_pop">
       <!-- 타이틀 -->
       <div id="title">
          <ul>
             <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                  사원 상세정보
                </li>
          </ul>
       </div>
       <!-- // 타이틀 -->
       <div id="table">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
          <colgroup>
             <col width="150"/>
             <col width="?"/>
          </colgroup>
             <tr>
                <td class="tbtd_caption"><label for="kname">한글 이름</label></td>
                <td class="tbtd_content">
                   <form:input path="kname" cssClass="txt" maxlength="10"   />
                </td>
             </tr>
          <tr>
             <td class="tbtd_caption"><label for="ename">영문 이름</label></td>
             <td class="tbtd_content">
                <form:input path="ename" maxlength="30" cssClass="txt"  />
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="jname">한문 이름</label></td>
             <td class="tbtd_content">
                <form:input path="jname" maxlength="30" cssClass="txt"  />
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="mynumber">주민등록번호</label></td>
             <td class="tbtd_content">
                <form:input path="mynumber1" maxlength="30" cssClass="txt"  />&nbsp;-&nbsp;
                <form:input path="mynumber2" maxlength="30" cssClass="txt"  />
             </td>
          </tr>
          <tr>
                <td class="tbtd_caption"><label for="">사진</label></td>
                <td class="tbtd_content">
                   <input type="file" id="uploadFile" name="uploadFile"/>
                </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="year">생년월일</label></td>
             <td class="tbtd_content">
                <form:input path="year" maxlength="30" cssClass="txt" style="width:60px"/>년&nbsp;
                <form:input path="month" maxlength="30" cssClass="txt" style="width:60px"/>월&nbsp;
                <form:input path="day" maxlength="30" cssClass="txt" style="width:60px"/>일&nbsp;
               (<input type="radio" name="calendar" id="calendar" value="1" />&nbsp;양력
                <input type="radio" name="calendar" id="calendar" value="2" />&nbsp;음력)
             </td>
          </tr>
            <tr>
             <td class="tbtd_caption"><label for="gender">성별</label></td>
             <td class="tbtd_content">
             	<input type="radio" name="gender" id="gender" value="1" />&nbsp;남자
             	<input type="radio" name="gender" id="gender" value="2" />&nbsp;여자
             </td>
          </tr>
            <tr>
             <td class="tbtd_caption"><label for="wedding">결혼유무</label></td>
             <td class="tbtd_content">
 				<input type="radio" name="wedding" id="wedding" value="1" />&nbsp;기혼
				<input type="radio" name="wedding" id="wedding" value="2" />&nbsp;미혼            
             </td>
          </tr>
           <tr>
             <td class="tbtd_caption"><label for="">년차</label></td>
             <td class="tbtd_content">
                <form:input path="career" maxlength="30" cssClass="txt"  />
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">급여 지급 유형 </label></td>
             <td class="tbtd_content">
                 <select id="moneyType" name="moneyType">
                   <option value="주급" label="주급"/> 
                   <option value="월급" label="월급"/> 
                </select>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">희망직무</label></td>
             <td class="tbtd_content">
                 <select id="workingType" name="workingType">
                   <option value="SI" label="SI" /> 
                   <option value="SM" label="SM" /> 
                </select>
             </td>
          </tr>
           <tr>
             <td class="tbtd_caption"><label for="welcome">입사유형</label></td>
             <td class="tbtd_content">
                 <select id="welcome" name="welcome">
                   <option value="정규직" label="정규직" /> 
                   <option value="비정규직" label="비정규직" /> 
                </select>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">주소 </label></td>
             <td class="tbtd_content">
                <form:input path="address" maxlength="10" cssClass="txt"  style="width:100px"/>&nbsp;&nbsp;
                <form:input path="detailAddress" maxlength="10" cssClass="txt"  style="width:250px"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">연락처 </label></td>
             <td class="tbtd_content">
                <form:input path="phoneNumber1" maxlength="30" cssClass="txt"  style="width:60px"/>&nbsp;- &nbsp;
                <form:input path="phoneNumber2" maxlength="30" cssClass="txt"  style="width:60px"/>&nbsp;-&nbsp;
                <form:input path="phoneNumber3" maxlength="30" cssClass="txt"  style="width:60px"/>&nbsp;
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">이메일 </label></td>
             <td class="tbtd_content">
                <form:input path="email" maxlength="30" cssClass="txt"  style="width:350px"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">기술등급 </label></td>
             <td class="tbtd_content">
                <form:input path="stat" maxlength="30" cssClass="txt"  style="width:100px"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="">주량 </label></td>
             <td class="tbtd_content">
                <form:input path="alchol" maxlength="30" cssClass="txt"  style="width:130px"/>
             </td>
          </tr>
       </table>
      </div>
       <div id="sysbtn">
          <ul>
             <li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_selectList();"><spring:message code="button.list" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
             <li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_add();">등록</a>
                       
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
            </ul>
       </div>
    </div>
    <!-- 검색조건 유지 
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>-->
</form:form>
</body>
</html>