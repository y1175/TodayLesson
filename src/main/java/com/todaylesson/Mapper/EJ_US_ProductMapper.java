package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.PdReviewDTO;
import com.todaylesson.DTO.OptionsDTO;
import com.todaylesson.DTO.OrderDetailDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.ProductDTO;



@Mapper
public interface EJ_US_ProductMapper {

	public List<ProductDTO> allData(HashMap<String, Object> hm);

	public int insertBoard(ProductDTO dto);

	public ProductDTO selectBoard(int product_no);

	public int registReply(PdReviewDTO reply);

	public MemberDTO selectMember(String member_id);

	public List<PdReviewDTO> selectReply(int product_no);

	public int insertOption(OptionsDTO odto);

	public List<OptionsDTO> selectOption(int product_no);

	public int insertorderdetail(OrderDetailDTO oddto);
	
	public int insertorderlist(OrderListDTO oldto);

	public int insertmylike(MyLikeDTO likedto);

	public int insertcart(CartDTO cartdto);

	public List<MyLikeDTO> selectmylike(HashMap<String, Object> hm);

	public List<CartDTO> selectmycart(String member_id);

	public int updatepoint(MemberDTO memberdto);

	public List<CartDTO> has_cart_product(CartDTO cartdto);

	public List<MyLikeDTO> has_mylike_product(MyLikeDTO likedto);

	public int insertorder_cart(HashMap<String, Object> hm);

	public int deletecart(CartDTO cartdto);

	public int delete_all_cart(String member_id);

	public List<OrderDetailDTO> selectorderdetail(int orderlist_no);

	public OrderListDTO selectorderlist(int orderlist_no);

	public int deletecart_lesson(CartDTO cartdto);

	public int deletepro(int product_no);

	public int updatepro(ProductDTO dto);

	public int updatepro_nothumbnail(ProductDTO dto);

	public List<PdReviewDTO> selectAllReview();

	public PdReviewDTO selectpdreview(int product_no);

	public int deletepdreview(int product_no);

	public List<ProductDTO> selectCategory(int product_category);

	public int updatestock(ProductDTO productdto);

	public int selectstock(int product_no);

	public int updateproductlike(int product_no);

	public int selectcategorynum(int product_no);

}
