package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.EventDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.PdReviewDTO;
import com.todaylesson.DTO.OptionsDTO;
import com.todaylesson.DTO.OrderDetailDTO;
import com.todaylesson.DTO.OrderListDTO;
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

	@Override
	public List<PdReviewDTO> replyList(int product_no) {
		// TODO Auto-generated method stub
		return mapper.selectReply(product_no);
	}

	@Override
	public int registReply(PdReviewDTO reply) {

		return mapper.registReply(reply);
		
	}

	@Override
	public MemberDTO selectm(String member_id) {
		// TODO Auto-generated method stub
		return mapper.selectMember(member_id);
	}

	@Override
	public int insertOption(OptionsDTO odto) {
		// TODO Auto-generated method stub
		return mapper.insertOption(odto);
	}

	@Override
	public List<OptionsDTO> optionList(int product_no) {
		// TODO Auto-generated method stub
		return  mapper.selectOption(product_no);
	}

	@Override
	public int insertorderdetail(OrderDetailDTO oddto) {
		return mapper.insertorderdetail(oddto);
		
	}

	@Override
	public int insertorderlist(OrderListDTO oldto) {
		// TODO Auto-generated method stub
		return mapper.insertorderlist(oldto);
	}

	@Override
	public int insertmylike(MyLikeDTO likedto) {
		// TODO Auto-generated method stub
		return mapper.insertmylike(likedto);
	}

	@Override
	public int insertcart(CartDTO cartdto) {
		// TODO Auto-generated method stub
		return mapper.insertcart(cartdto);
	}

	@Override
	public List<MyLikeDTO> selectMyLike(String member_id) {
		// TODO Auto-generated method stub
		return mapper.selectmylike(member_id);
	}

	@Override
	public List<CartDTO> selectMyCart(String member_id) {
		// TODO Auto-generated method stub
		return mapper.selectmycart(member_id);
	}

	@Override
	public int updatepoint(MemberDTO memberdto) {
		// TODO Auto-generated method stub
		return mapper.updatepoint(memberdto);
	}

	@Override
	public List<CartDTO> has_cart_product(CartDTO cartdto) {
		// TODO Auto-generated method stub
		return mapper.has_cart_product(cartdto);
	}

	@Override
	public List<MyLikeDTO> has_mylike_product(MyLikeDTO likedto) {
		// TODO Auto-generated method stub
		return mapper.has_mylike_product(likedto);
	}

	/*@Override
	public int insertorder_cart(CartDTO cart) {
		// TODO Auto-generated method stub
		return mapper.insertorder_cart(cart);
	}*/

	@Override
	public int deletecart(CartDTO cartdto) {
		// TODO Auto-generated method stub
		return mapper.deletecart(cartdto);
	}

	@Override
	public int insertorder_cart(CartDTO cart,int orderlist_no) {
		// TODO Auto-generated method stub
		//해쉬맵만들어서 맵에 카트 풋하고 no가져와
		//해쉬맵넣기 파라미터에
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("orderlist_no", orderlist_no);//키 . 밸류
		hm.put("product_no", cart.getProduct_no());
		System.out.println("pronum"+cart.getProduct_no());
		hm.put("lesson_no", cart.getLesson_no());
		System.out.println("lesnum"+cart.getLesson_no());
		hm.put("cart_amount", cart.getCart_amount());
		
		return mapper.insertorder_cart(hm);
	}

	@Override
	public int delet_all_cart(String member_id) {
		// TODO Auto-generated method stub
		return mapper.delete_all_cart(member_id);
	}

	@Override
	public List<OrderDetailDTO> selectorderdetail(int orderlist_no) {
		// TODO Auto-generated method stub
		return mapper.selectorderdetail(orderlist_no);
	}

	@Override
	public OrderListDTO selectorderlist(int orderlist_no) {
		// TODO Auto-generated method stub
		return mapper.selectorderlist(orderlist_no);
	}

	@Override
	public int deletecart_lesson(CartDTO cartdto) {
		// TODO Auto-generated method stub
		return mapper.deletecart_lesson(cartdto);
	}

	@Override
	public int deletepro(int product_no) {
		// TODO Auto-generated method stub
		return mapper.deletepro(product_no);
	}

	@Override
	public int updatepro(ProductDTO dto) {
		// TODO Auto-generated method stub
		return mapper.updatepro(dto);
	}

	@Override
	public int updatepro_nothumbnail(ProductDTO dto) {
		// TODO Auto-generated method stub
		return mapper.updatepro_nothumbnail(dto);
	}

	@Override
	public List<PdReviewDTO> selectAllReview() {
		// TODO Auto-generated method stub
		return mapper.selectAllReview();
	}



}
