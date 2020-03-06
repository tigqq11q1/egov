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

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface EgovSampleService {

	List<SampleVO> selectSampleList(SampleVO vo) throws Exception;
	
	int selectSampleListCnt(SampleVO vo) throws Exception;

	/**
	 * 사원 상세 조회
	 * @param memberno - 조회할 사원 번호
	 * @return SampleVO - 사원 상세 정보
	 * @exception Exception
	 */
	SampleVO selectSampleView(SampleVO sampleVO) throws Exception;
	
	/**등록*/
	int selectSampleAdd(SampleVO sampleVO) throws Exception;

	int updateSample(SampleVO sampleVO) throws Exception;

	int deleteSample(SampleVO sampleVO)throws Exception;
	
	
/*	

	

	SampleVO selectSampleNo(SampleVO vo) throws Exception;

	int updateSample(SampleVO vo)throws Exception;

	
*/

}
