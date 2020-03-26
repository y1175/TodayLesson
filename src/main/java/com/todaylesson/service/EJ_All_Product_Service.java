package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.PdReviewDTO;
import com.todaylesson.DTO.OptionsDTO;
import com.todaylesson.DTO.OrderDetailDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.ProductDTO;



public interface EJ_All_Product_Service {

	public List<ProductDTO> selectAll();

	public int insertBoard(ProductDTO     dto);

	public ProductDTO select(int product_no);

	public List<PdReviewDTO> replyList(int product_no);

	public int registReply(PdReviewDTO reply);

	public MemberDTO selectm(String member_id);

	public int insertOption(OptionsDTO odto);

	public List<OptionsDTO> optionList(int product_no);

	public int insertorderdetail(OrderDetailDTO oddto);

	public int insertorderlist(OrderListDTO oldto);

	public int insertmylike(MyLikeDTO likedto);

	public int insertcart(CartDTO cartdto);

	public List<MyLikeDTO> selectMyLike(String member_id);

	public List<CartDTO> selectMyCart(String member_id);

	public int updatepoint(MemberDTO memberdto);

	public List<CartDTO> has_cart_product(CartDTO cartdto);

	public List<MyLikeDTO> has_mylike_product(MyLikeDTO likedto);

	public int insertorder_cart(CartDTO cart, int orderlist_no);

	public int deletecart(CartDTO cartdto);

	public int delet_all_cart(String member_id);








}
