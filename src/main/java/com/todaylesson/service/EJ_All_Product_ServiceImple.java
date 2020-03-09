package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.Mapper.EJ_US_ProductMapper;


@Service(value="service")
public class EJ_All_Product_ServiceImple implements EJ_All_Product_Service {

	@Autowired
	EJ_US_ProductMapper mapper;
	
	@Override
	public List<ProductDTO> selectAll() {
		return mapper.allData();
	}

	@Override
	public int insertBoard(ProductDTO dto) {
		return mapper.insertBoard(dto);
	}

	@Override
	public ProductDTO select(int product_no) {
		return mapper.selectBoard(product_no);
	}
}
