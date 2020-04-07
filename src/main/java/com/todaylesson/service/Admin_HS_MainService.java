package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.OrderListDTO;

public interface Admin_HS_MainService {

	//관리자 닉네임받기
	public String adminMemberNick(String member_id);
	
	//일일가입자수 집계
	public int memberJoinCount();
	
	//일일 시니어전환자 집계
	public int seniorChangeCount();
	
	//일일게시글수 집계
	public int freeboardWriteCount();

	//일일 판매금액 집계
	public int orderlistCostSum();
	
	//스토어현황
	  //등록된상품
	   public int registrationProductCount();
	  //판매가능상품
	   public int possibilityProductCount();
	  //품절상품
	   public int soldOutProductCount();
  
	//레슨현황
	  //등록된 레슨 
	   public int registrationLessonCount();
	   //오픈레슨
	   public int openLessonCount();
	   //마감레슨
	   public int closeLessonCount();
	   //인원마감레슨
	   public int soldOutLessonCount();
	
	//주문현황
	  //주문완료
	  public int orderCompleteCount();
	  //배송중
	  public int orderDuringShippingCount();
	  //배송완료
	  public int orderShippingCompleteCount();	
	  //주문취소
	  public int orderCancelCount();
	   
	//결제현황
	  //결제완료
	  public int paymentCompleteCount();
	  //환불진행
	  public int refundAcceptCount();
	  //환불완료
	  public int refundCompleteCount();
	   
	//레슨접수현황
	  //레슨신규접수  
	  public int newLessonAcceptCount();
	  //레슨심사중
	  public int newLessonEvaluationCount();	
	  //레슨수락
	  public int newLessonAcceptanceCount();
	  //레슨거절
	  public int newLessonRefuseCount();
	   
	//시니어정산현황
	  //정산대기
	  public int seniorCalculateWaitCount();
	  //정산가능
	  public int seniorCalculatePossibleCount();
	  //정산완료
	  public int seniorCalculateCompleteCount();	
	  
	//1:1문의현황
	  //레슨문의
	  public int questionLessonCount();
	  //시니어문의
	  public int questionSeniorCount();
	  //스토어문의
	  public int questionStoreCount();
	  //주문문의
	  public int questionOrderCount();
	  //기타문의
	  public int questionOtherCount();
	  //답변대기
	  public int questionAnswerWaitCount();
	  //답변완료
	  public int questionAnswerCompleteCount();
	  
	//레슨카테고리
	public int lessonITCount();

	public int lessonCookCount();

	public int lessonHandmadeCount();

	public int lessonSportCount();

	public int lessonEducationCount();

	public int lessonOtherCount();

	//상품카테고리
	public int productITCount();

	public int productCookCount();

	public int productHandmadeCount();

	public int productSportCount();

	public int productEducationCount();

	public int productOtherCount();

	//연령대별 회원현황
	public int memberAge10Sum();

	public int memberAge20Sum();

	public int memberAge30Sum();

	public int memberAge40Sum();

	public int memberAge50Sum();

	public int memberAge60Sum();

	public int memberAge70PlusSum();

	//매출통계(일별, 주별, 월별, 년별)
	public List<OrderListDTO> adMainStatSalesAllChart(String ymd);

	//AmChart
	public List<OrderListDTO> chartOutput();

}
