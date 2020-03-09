package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.ProductDTO;



@Mapper
public interface EJ_US_ProductMapper {

	public List<ProductDTO> allData();

	public int insertBoard(ProductDTO dto);

	public ProductDTO selectBoard(int product_no);

}
