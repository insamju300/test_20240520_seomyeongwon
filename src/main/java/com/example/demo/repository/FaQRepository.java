package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.FaQ;

@Mapper
public interface FaQRepository {

	@Select("""
	        SELECT * FROM FaQ
	        WHERE question LIKE CONCAT('%', #{searchText}, '%') OR answer LIKE CONCAT('%', #{searchText}, '%')
	        """)
	public List<FaQ> search(String searchText);
} 