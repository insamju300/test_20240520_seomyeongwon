package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FaQRepository;
import com.example.demo.vo.Address;
import com.example.demo.vo.FaQ;


@Service
public class FaQService {
	@Autowired
	private FaQRepository faQRepository;
	

	public List<FaQ> search(String searchText) {
		// TODO Auto-generated method stub
		return faQRepository.search(searchText);
	}


	public List<Address> searchAddress(String searchAddress) {
		// TODO Auto-generated method stub
		return faQRepository.searchAddress(searchAddress);
	}

//	@Autowired
//	private PlaceInfoRepository placeInfoRepository;
//
//	// 특정 탭과 지역에 해당하는 장소 정보 목록을 가져오는 메서드
//	public List<PlaceInfoDto> getplaceInfoList(int tabId, int regionId) {
//		// PlaceInfoRepository를 통해 장소 정보 목록을 가져옴
//		return placeInfoRepository.getplaceInfoList(tabId, regionId);
//	}
//
//	// 특정 장소의 정보를 가져오는 메서드
//	public PlaceInfoDto getPlaceInfo(int id) {
//		// PlaceInfoRepository를 통해 특정 장소의 정보를 가져옴
//		return placeInfoRepository.getPlaceInfo(id);
//	}

}
