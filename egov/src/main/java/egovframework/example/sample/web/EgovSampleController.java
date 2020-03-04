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
package egovframework.example.sample.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
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

@Controller
public class EgovSampleController {

	/** EgovSampleService */
	@Resource(name = "sampleService")
	private EgovSampleService service;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/list.do")
	public String selectSampleList(@ModelAttribute SampleVO vo, ModelMap model
			,@RequestParam(value="search_name",required=false) String search_name) throws Exception {
	
		vo.setPageUnit(propertiesService.getInt("pageUnit"));
		vo.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
	//	int listCnt = service.selectSampleListCnt(vo);
	//	paginationInfo.setTotalRecordCount(listCnt);
			
	//	vo.setTotalRecordCount(listCnt);
		model.addAttribute("search_name",search_name);
		model.addAttribute("list",service.selectSampleList(vo));
		model.addAttribute("paginationInfo", paginationInfo);
		return "sample/list";
	}
/*	
	@RequestMapping(value="/add.do",method = RequestMethod.GET)
	public  String add(@ModelAttribute SampleVO vo,ModelMap model)throws Exception{
		model.addAttribute("list",service.selectSampleList(vo));
		return "sample/add";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/addAjax.do",method = RequestMethod.POST)
	public @ResponseBody JSONObject addAjax(SampleVO vo) {
		
		JSONObject json = new JSONObject();
		Map<String,Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;
		
		try {
			resultCnt = service.insertSampleList(vo);
			System.out.println(resultCnt);
			if(resultCnt > 0) {
				resultMap.put("result","success");
			}else {
				resultMap.put("result","error");				
			}
		} catch(DataAccessException e ) {
				e.printStackTrace();
				resultMap.put("result", "error");
		}catch (Exception e){
			e.printStackTrace();
			resultMap.put("result", "error");
			resultMap.put("message", e.getCause().getMessage());
		}
		json.putAll(resultMap);
		return json;
	}
	
	@RequestMapping(value="/view.do")
	public String view(SampleVO vo,ModelMap model) throws Exception {
		model.addAttribute("view",service.selectSampleNo(vo));
		return "sample/view";
	}
	
	@RequestMapping(value="/edit.do")
	public String edit(SampleVO vo,ModelMap model) throws Exception {
		model.addAttribute("data",service.selectSampleNo(vo));
		return "sample/edit";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/updateAjax.do",method = RequestMethod.POST)
	public @ResponseBody JSONObject updateAjax(SampleVO vo) {
		
		JSONObject json = new JSONObject();
		Map<String,Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;
		try {
			resultCnt = service.updateSample(vo);
			if(resultCnt > 0) {
				resultMap.put("result","success");
			}else {
				resultMap.put("result","error");				
			}
		} catch(DataAccessException e ) {
				e.printStackTrace();
				resultMap.put("result", "error");
		}catch (Exception e){
			e.printStackTrace();
			resultMap.put("result", "error");
			resultMap.put("message", e.getCause().getMessage());
		}
		json.putAll(resultMap);
		return json;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/delAjax.do",method = RequestMethod.POST)
	public @ResponseBody JSONObject delAjax(SampleVO vo,
			@RequestParam(value="checkArray[]",required=false) List<Integer> deleteList) {
		
		
		JSONObject json = new JSONObject();
		Map<String,Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;
		
		try {
			ArrayList<Integer>deleteArray = new ArrayList<Integer>();
			for(int i = 0; i <deleteList.size(); i++) {
				deleteArray.add(deleteList.get(i));
			}
			service.deletetSample(deleteArray);
			if(resultCnt > 0) {
				resultMap.put("result","success");
			}else {
				resultMap.put("result","error");				
			}
		} catch(DataAccessException e ) {
				e.printStackTrace();
				resultMap.put("result", "error");
		}catch (Exception e){
			e.printStackTrace();
			resultMap.put("result", "error");
			resultMap.put("message", e.getCause().getMessage());
		}
		json.putAll(resultMap);
		return json;
	}*/
}
