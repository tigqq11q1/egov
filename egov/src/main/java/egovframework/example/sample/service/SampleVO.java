/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class SampleVO extends SampleDefaultVO {

	 static final long serialVersionUID = 1L;

	private int memberno;				// 사원번호
	private String kname;				// 한글이름
	private String ename;				// 영문이름
	private String jname;				// 한문이름
	private String mynumber1; 			// 주민번호앞자리
	private String mynumber2; 		 	// 주민번호뒷자리
	private String photo; 				// 
	private String year;				// 생년월일-년
	private String month;				// 생년월일-월
	private String day;					// 생년월일-일
	private String calendar; 			// 양력(1), 음력(2) 선택
	private String gender; 				// 남자(1),여자(2)
	private String wedding; 			// 기혼(1), 미혼(2)
	private String career; 				// 년차
	private String moneyType; 			// 급여 지급유형
	private String workingType;  		// 희망직무
	private String welcome; 			// 입사유형
	private String address;				// 우편번호
	private String detailAddress;		// 상세주소
	private String phoneNumber1;		// 연락처앞자리
	private String phoneNumber2;		// 연락처가운데자리
	private String phoneNumber3;		// 연락처뒷자리
	private String email;				// 이메일
	private String stat; 				// 기술등급
	private String alchol;				// 주량
	private String listStat; 			// 리스트상태
	private String workYn; 				// 근무정보
	private String workYnNm; 			// 근무정보명
	private String genderNm; 			// 성별한글표기
	
	private String filename;			// 파일명
	private String filePath;			// 파일경로
	private MultipartFile uploadFile;	// 파일

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public String getMynumber1() {
		return mynumber1;
	}
	public void setMynumber1(String mynumber1) {
		this.mynumber1 = mynumber1;
	}
	public String getMynumber2() {
		return mynumber2;
	}
	public void setMynumber2(String mynumber2) {
		this.mynumber2 = mynumber2;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getCalendar() {
		return calendar;
	}
	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWedding() {
		return wedding;
	}
	public void setWedding(String wedding) {
		this.wedding = wedding;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getMoneyType() {
		return moneyType;
	}
	public void setMoneyType(String moneyType) {
		this.moneyType = moneyType;
	}
	public String getWorkingType() {
		return workingType;
	}
	public void setWorkingType(String workingType) {
		this.workingType = workingType;
	}
	public String getWelcome() {
		return welcome;
	}
	public void setWelcome(String welcome) {
		this.welcome = welcome;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPhoneNumber1() {
		return phoneNumber1;
	}
	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}
	public String getPhoneNumber2() {
		return phoneNumber2;
	}
	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}
	public String getPhoneNumber3() {
		return phoneNumber3;
	}
	public void setPhoneNumber3(String phoneNumber3) {
		this.phoneNumber3 = phoneNumber3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getAlchol() {
		return alchol;
	}
	public void setAlchol(String alchol) {
		this.alchol = alchol;
	}
	public String getWorkYn() {
		return workYn;
	}
	public void setWorkYn(String workYn) {
		this.workYn = workYn;
	}
	public String getListStat() {
		return listStat;
	}
	public void setListStat(String listStat) {
		this.listStat = listStat;
	}
	public String getWorkYnNm() {
		return workYnNm;
	}
	public void setWorkYnNm(String workYnNm) {
		this.workYnNm = workYnNm;
	}
	public String getGenderNm() {
		return genderNm;
	}
	public void setGenderNm(String genderNm) {
		this.genderNm = genderNm;
	}
	
	
}
