package com.todaylesson.oreo;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.core.conf.ModifiableLongProperty;
import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.LReviewDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.Lesson_qaDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.OrderDetailDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.service.EJ_All_Product_Service;
import com.todaylesson.service.JY_US_TotalLessonService;

@Controller
@RequestMapping("/todaylesson/")
public class JY_US_TotalLessonController {

	@Resource(name = "totallesson_service")
	private JY_US_TotalLessonService ttlesson_service;
	
	@RequestMapping("total_lesson_list")
	public String ttlesson_list(Model model,
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="lesson_no") String order) {

		System.out.println(order);

		
		//총 게시글 수
		int totalCount= ttlesson_service.totalCount(search, searchtxt);
		int pageSize=12;
		int blockSize=5;
		
		
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);


		List<LessonDTO> list = ttlesson_service.ttlesson_list(search, searchtxt,order
				,page.getStartRow()
				,page.getEndRow());

		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("order",order);

		return "TodayLesson_UserPage/jy_us_total_lesson_list.us_main_section";
	}

	@RequestMapping("lesson_detail/{lesson_no}")
	public String ttlesson_detail(Model model, @PathVariable("lesson_no") int lesson_no) {

		AllLessonDTO dto = ttlesson_service.ttlesson_select(lesson_no);
		model.addAttribute("dto", dto);

		int lesson_cat = dto.getLesson_category();
		List<AllLessonDTO> list = ttlesson_service.ttlesson_cat_select(lesson_cat);
		model.addAttribute("list",list);
		
		System.out.println(list.toString());
		System.out.println(dto.toString());
		
		return "TodayLesson_UserPage/jy_us_total_lesson_detail.us_main_section";
	}

	@RequestMapping("lesson_buy/{lesson_no}")
	public String lesson_buy(Model model, @PathVariable int lesson_no,Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		
		MemberDTO mdto = ttlesson_service.select_member_info(member_id);
		
		AllLessonDTO ldto = ttlesson_service.ttlesson_select(lesson_no);
		model.addAttribute("ldto", ldto);
		model.addAttribute("mdto", mdto);

		return "TodayLesson_UserPage/jy_us_lesson_order.us_main_section";
	}

	@ResponseBody
	@RequestMapping("lesson_like")
	public String lesson_like(@RequestParam(value = "lesson_no") int lesson_no,
			@RequestParam(value = "member_id") String member_id) {

		MyLikeDTO dto = new MyLikeDTO();
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		String result;
		List<MyLikeDTO> has_dto = ttlesson_service.has_like_lesson(dto);

		if (has_dto.isEmpty()) {
			ttlesson_service.add_like_lesson(dto);
			result = "success";
		} else {
			result = "false";
		}
		return result;

	}

	@ResponseBody
	@RequestMapping("lesson_cart")
	public String lesson_cart(@RequestParam(value = "lesson_no") int lesson_no,
			@RequestParam(value = "member_id") String member_id) {

		CartDTO dto = new CartDTO();
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		String result;
		List<CartDTO> lesson_in_cart = ttlesson_service.has_cart_lesson(dto);
		if (lesson_in_cart.isEmpty()) {
			ttlesson_service.add_cart_lesson(dto);
			result = "success";
		} else {
			result = "false";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("lesson_detail/{lesson_no}/lesson_reply_insert")
	public String lesson_reply_insert(@PathVariable int lesson_no, @RequestParam String member_id,
			@RequestParam String lesson_qa_reply_secret, @RequestParam String lesson_qa_reply_content,
			@RequestParam String lesson_qa_reply_title) {

		Lesson_qaDTO dto = new Lesson_qaDTO();

		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		dto.setLesson_qa_reply_secret(lesson_qa_reply_secret);
		dto.setLesson_qa_reply_content(lesson_qa_reply_content);
		dto.setLesson_qa_reply_title(lesson_qa_reply_title);

		int result = ttlesson_service.add_lesson_reply(dto);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}

	}

	@ResponseBody
	@RequestMapping(value = "lesson_detail/{lesson_no}/lesson_reply_list", produces = "application/json; charset=utf8")
	public ResponseEntity lesson_reply_list(@PathVariable int lesson_no, @RequestParam String member_id,
			@RequestParam String senior_id) {

		System.out.println(member_id + "        " + senior_id);

		HttpHeaders responseHeaders = new HttpHeaders();

		ArrayList<HashMap> rplist = new ArrayList<HashMap>();

		List<Lesson_qaDTO> lesson_reply_list = ttlesson_service.select_lesson_reply(lesson_no);

		List<Lesson_qaDTO> lesson_reply_answer_list = ttlesson_service.select_lesson_reply_answer(lesson_no);

		if (lesson_reply_list.size() > 0) {
			for (int i = 0; i < lesson_reply_list.size(); i++) {

				HashMap hm = new HashMap<>();

				if (lesson_reply_list.get(i).getLesson_qa_reply_secret().equals("Y")) {

					if (lesson_reply_list.get(i).getMember_id().equals(member_id)) {
						hm.put("lesson_qa_no", lesson_reply_list.get(i).getLesson_qa_no());
						hm.put("lesson_qa_reply_title", lesson_reply_list.get(i).getLesson_qa_reply_title());
						hm.put("lesson_qa_reply_content", lesson_reply_list.get(i).getLesson_qa_reply_content());
						hm.put("lesson_qa_register_date", lesson_reply_list.get(i).getLesson_qa_register_date());
						hm.put("member_id", lesson_reply_list.get(i).getMember_id());
						hm.put("lesson_qa_reply_secret", lesson_reply_list.get(i).getLesson_qa_reply_secret());
						for (int j = 0; j < lesson_reply_answer_list.size(); j++) {
							if (lesson_reply_answer_list.get(j).getLesson_qa_originno() == lesson_reply_list.get(i).getLesson_qa_no()) {
								hm.put("lesson_qa_answer_content",lesson_reply_answer_list.get(j).getLesson_qa_answer_content());
								hm.put("lesson_qa_register_date",lesson_reply_answer_list.get(j).getLesson_qa_register_date());
								hm.put("member_id", lesson_reply_answer_list.get(j).getMember_id());
							}
						}

					} else if (senior_id.equals(member_id)) {
						hm.put("lesson_qa_no", lesson_reply_list.get(i).getLesson_qa_no());
						hm.put("lesson_qa_reply_title", lesson_reply_list.get(i).getLesson_qa_reply_title());
						hm.put("lesson_qa_reply_content", lesson_reply_list.get(i).getLesson_qa_reply_content());
						hm.put("lesson_qa_register_date", lesson_reply_list.get(i).getLesson_qa_register_date());
						hm.put("member_id", lesson_reply_list.get(i).getMember_id());
						hm.put("lesson_qa_reply_secret", lesson_reply_list.get(i).getLesson_qa_reply_secret());
						for (int j = 0; j < lesson_reply_answer_list.size(); j++) {
							if (lesson_reply_answer_list.get(j).getLesson_qa_originno() == lesson_reply_list.get(i).getLesson_qa_no()) {
								hm.put("lesson_qa_answer_content",lesson_reply_answer_list.get(j).getLesson_qa_answer_content());
								hm.put("lesson_qa_register_date",lesson_reply_answer_list.get(j).getLesson_qa_register_date());
								hm.put("member_id", lesson_reply_answer_list.get(j).getMember_id());
							}
						}

					} else {
						hm.put("lesson_qa_no", lesson_reply_list.get(i).getLesson_qa_no());
						hm.put("lesson_qa_reply_title", "비밀 글입니다.");
						hm.put("lesson_qa_reply_content", "작성자와 시니어만 확인할 수 있습니다.");
						hm.put("member_id", "비밀 댓글입니다.");
						hm.put("lesson_qa_register_date", lesson_reply_list.get(i).getLesson_qa_register_date());
						hm.put("lesson_qa_answer_content", lesson_reply_list.get(i).getLesson_qa_answer_content());
						hm.put("lesson_qa_reply_secret", lesson_reply_list.get(i).getLesson_qa_reply_secret());
						for (int j = 0; j < lesson_reply_answer_list.size(); j++) {
							if (lesson_reply_answer_list.get(j).getLesson_qa_originno() == lesson_reply_list.get(i).getLesson_qa_no()) {
								hm.put("lesson_qa_answer_content", "작성자와 시니어만 확인할 수 있습니다.");
								hm.put("member_id", "비밀댓글입니다.");
							}
						}

					}

				} else {
					hm.put("lesson_qa_no", lesson_reply_list.get(i).getLesson_qa_no());
					hm.put("lesson_qa_reply_title", lesson_reply_list.get(i).getLesson_qa_reply_title());
					hm.put("lesson_qa_reply_content", lesson_reply_list.get(i).getLesson_qa_reply_content());
					hm.put("lesson_qa_register_date", lesson_reply_list.get(i).getLesson_qa_register_date());
					hm.put("member_id", lesson_reply_list.get(i).getMember_id());
					hm.put("lesson_qa_reply_secret", lesson_reply_list.get(i).getLesson_qa_reply_secret());
					for (int j = 0; j < lesson_reply_answer_list.size(); j++) {
						if (lesson_reply_answer_list.get(j).getLesson_qa_originno() == lesson_reply_list.get(i).getLesson_qa_no()) {
							hm.put("lesson_qa_answer_content",lesson_reply_answer_list.get(j).getLesson_qa_answer_content());
							hm.put("lesson_qa_register_date",lesson_reply_answer_list.get(j).getLesson_qa_register_date());
							hm.put("member_id", lesson_reply_answer_list.get(j).getMember_id());
						}
					}

				}
				rplist.add(hm);
			}
		}

		JSONArray json = new JSONArray(rplist);

		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);

	}

	@ResponseBody
	@RequestMapping("lesson_detail/{lesson_no}/lesson_answer_insert")
	public String lesson_answer_insert(@PathVariable int lesson_no, @RequestParam int lesson_qa_no,
			@RequestParam String senior_id, @RequestParam String lesson_qa_answer_content,
			@RequestParam String lesson_qa_reply_secret) {

		Lesson_qaDTO dto = new Lesson_qaDTO();

		// 댓글이 있는 레슨번호
		dto.setLesson_no(lesson_no);
		// 내가 답변을 다는 댓글 번호
		dto.setLesson_qa_originno(lesson_qa_no);
		// 답변
		dto.setLesson_qa_answer_content(lesson_qa_answer_content);
		// 답변을 다는 사람은 시니어
		dto.setMember_id(senior_id);
		dto.setLesson_qa_reply_secret(lesson_qa_reply_secret);

		int answer_reply = ttlesson_service.has_answer_reply(dto);
		if (answer_reply > 0) {
			return "has_answer";
		} else {
			int result = ttlesson_service.add_lesson_reply_answer(dto);
			if (result > 0) {
				return "success";
			} else {
				return "false";
			}
		}

	}
	
	
	
	@RequestMapping("/orderlist_detail")
	public String orderlist_detail(OrderDetailDTO oddto, OrderListDTO oldto
			,@RequestParam(value="orderlist_cost", required=false) int orderlist_cost
			, @RequestParam(value="addrselect",required=false) int addrselect
			,@RequestParam(value="roadaddr",required=false) String roadaddr
			,@RequestParam(value="jibunaddr",required=false) String jibunaddr
			, @RequestParam(value="detailaddr",required=false) String detailaddr
			,@RequestParam(value="orderlist_usepoint", required=false) int orderlist_usepoint
			,@RequestParam(value="remainpoint", required=false) int remainpoint
			,@RequestParam(value="member_id") String member_id
			, Model model)
	{
		
		
	if(addrselect>0)
		{
		 String fulladdr= "";	
		 if(addrselect==1) 
				{fulladdr=roadaddr;}
				else if(addrselect==2)
				{fulladdr=jibunaddr;}
		 oldto.setOrderlist_addr(fulladdr+" "+detailaddr);
		}//주소
	
	System.out.println(orderlist_cost);
	
	MemberDTO memberdto=new MemberDTO();
	int updatedpoint=(int) (remainpoint+(0.1*orderlist_cost));
	//remainpoint는 포인트 사용후 남은 금액
	//남은 금액에 결제금액의 10%를 적립해서 update해줌
	memberdto.setMember_id(member_id);
	memberdto.setMember_point(updatedpoint);
	ttlesson_service.updatepoint(memberdto);
	
	//주문번호 생성
		 Calendar cal = Calendar.getInstance();
		 int year1 = cal.get(Calendar.YEAR);
		 String year2=Integer.toString(year1);
		 String year=year2.substring(2, 4);
		 
		 System.out.println("두자릿수년도:"+year);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 System.out.println();
		 System.out.println(ym);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 4; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String orderId =ymd+subNum;
		 System.out.println("오더아이디:"+orderId);
		 System.out.println("데이터타입확인:"+orderId instanceof String);
		int orderlist_no=Integer.parseInt(orderId);
			System.out.println("orderlist_NO:"+orderlist_no);
		oldto.setOrderlist_no(orderlist_no); 
		ttlesson_service.insertorderlist(oldto);
		oddto.setOrderlist_no(orderlist_no);
		ttlesson_service.insertorderdetail(oddto);
		//포인트 차감
		

		OrderListDTO orderlistdto=ttlesson_service.selectorderlist(orderlist_no);//오더정보 받아오기
		List<OrderDetailDTO> list=ttlesson_service.selectorderdetail(orderlist_no);//오더 디테일 정보 받아오기
		model.addAttribute("list",list);
		model.addAttribute("orderlistdto",orderlistdto);
		
		ttlesson_service.add_lesson_junior(oddto.getLesson_no());
		
		return "TodayLesson_UserPage/jy_us_orderlist_detail.us_main_section";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "lesson_detail/{lesson_no}/lesson_lreview_list", produces = "application/json; charset=utf8")
	public ResponseEntity lesson_lreview_list(@PathVariable int lesson_no) {
		
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> lrlist = new ArrayList<HashMap>();

		List<LReviewDTO> lesson_lreview_list = ttlesson_service.select_lesson_lreview(lesson_no);
		
		if (lesson_lreview_list.size() > 0) {
			for (int i = 0; i < lesson_lreview_list.size(); i++) {

				HashMap hm = new HashMap<>();
				
				hm.put("lreview_title", lesson_lreview_list.get(i).getLreview_title());
				hm.put("lreview_content", lesson_lreview_list.get(i).getLreview_content());
				hm.put("lreview_date", lesson_lreview_list.get(i).getLreview_date());
				hm.put("member_id",lesson_lreview_list.get(i).getMember_id());
				
				lrlist.add(hm);
				
			}
		}
		JSONArray json = new JSONArray(lrlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	
	@ResponseBody
	@RequestMapping(value="lesson_detail/{lesson_no}/lesson_review_insert")
	public String lesson_review_insert(@PathVariable int lesson_no, Authentication authentication,
			@RequestParam String lreview_title, @RequestParam String lreview_content) {

		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		LReviewDTO dto = new LReviewDTO();

		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		dto.setLreview_title(lreview_title);
		dto.setLreview_content(lreview_content);

		int result = ttlesson_service.add_lesson_review(dto);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}

	}
}
