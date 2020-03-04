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
package egovframework.example.sample.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("sampleService")
public class EgovSampleServiceImpl extends EgovAbstractServiceImpl implements EgovSampleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleServiceImpl.class);

	// TODO mybatis 사용
	  @Resource(name="sampleMapper")
		private SampleMapper mapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<SampleVO> selectSampleList(SampleVO vo) throws Exception{
		List<SampleVO> result = mapper.selectSampleList(vo);
		return result;
	}
	/*@Override
	public int selectSampleListCnt(SampleVO vo) throws Exception {
		int result = mapper.selectSampleListCnt(vo);
		return result;
	}

	@Override
	public int insertSampleList(SampleVO vo) throws Exception {
		int result = mapper.insertSample(vo);
		return result;
	}

	@Override
	public SampleVO selectSampleNo(SampleVO vo) throws Exception {
		SampleVO result = mapper.selectSampleNo(vo);
		return result;
	}

	@Override
	public int updateSample(SampleVO vo) throws Exception {
		int result = mapper.updateSample(vo);
		return result;
	}

	@Override
	public int deletetSample(ArrayList<Integer> deleteArray) throws Exception {
		int result = 0;
		for(int i = 0; i <deleteArray.size(); i++) {
			int empno = deleteArray.get(i);
			result = mapper.deletetSample(empno);
		}
		return result;

	}*/

	
}