package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.ProductDTO;



public interface EJ_All_Product_Service {

	public List<ProductDTO> selectAll();

	public int insertBoard(ProductDTO dto);

	public ProductDTO select(int product_no);


}