package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
    // RegionService 의존성 주입
    @Autowired
    FaQService faqService;
	/*
	 * RegionService regionService;
	 * 
	 * // 생성자를 통한 의존성 주입 public UsrHomeController(RegionService regionService) {
	 * this.regionService = regionService; }
	 */

    // 메인 페이지 요청 처리
    @RequestMapping("/")
    public String showMain() {
//        // 지역 목록 조회
//        List<Region> regions = regionService.getRegionList();
//        
//        // 지역 목록을 JSON 형태로 변환
//        String regionsJson = new Gson().toJson(regions);
//        
//        // 모델에 지역 목록과 JSON 데이터 추가
//        model.addAttribute("regions", regionService.getRegionList());
//        model.addAttribute("regionsJson", regionsJson);

        // 메인 페이지로 이동
        return "/usr/home/main";
    }
    
    @GetMapping("/search")
    @ResponseBody
    public String search(String searchText) {
    	
    	return searchText;
    	
    }


}
