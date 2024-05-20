package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.FaQService;
import com.example.demo.vo.Address;
import com.example.demo.vo.FaQ;
import com.example.demo.vo.ResultData;

@Controller
public class UsrHomeController {
    @Autowired
    FaQService faqService;
	public UsrHomeController(FaQService faqService) {
	    this.faqService = faqService; 
	 }

    // 메인 페이지 요청 처리
    @RequestMapping("/")
    public String showMain() {

        // 메인 페이지로 이동
        return "/usr/home/main";
    }
    
    @GetMapping("/search")
    @ResponseBody
    public ResultData<List<FaQ>> search(String searchText) {
    	List<FaQ> faqs= faqService.search(searchText);
    	
    	
    	ResultData<List<FaQ>> rs = ResultData.from("S-1", "FaQ데이터 리스트 습득", "FaQ리스트", faqs);
    	
    	return rs;
    	
    }

    @GetMapping("/searchAddress")
    @ResponseBody
    public ResultData<List<Address>> searchAddress(String searchAddress) {
    	List<Address> addressList= faqService.searchAddress(searchAddress);
    	
    	
    	ResultData<List<Address>> rs = ResultData.from("S-1", "FaQ데이터 리스트 습득", "주소 리스트", addressList);
    	
    	return rs;
    	
    }
    
}
