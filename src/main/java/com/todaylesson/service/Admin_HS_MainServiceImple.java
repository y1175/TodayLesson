package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.Mapper.Admin_HS_MainMapper;

@Service(value="admin_HS_MainService")
public class Admin_HS_MainServiceImple implements Admin_HS_MainService {

	@Resource(name="admin_HS_MainMapper")
	private Admin_HS_MainMapper adminmainMapper;
	
	//관리자 닉네임받기
	@Override
	public String adminMemberNick(String member_id) {
		// TODO Auto-generated method stub
		return adminmainMapper.adminMemberNick(member_id);
	}
	
	//일일가입자수 집계
	@Override
	public int memberJoinCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberJoinCount();
	}
		
	//일일 시니어전환자 집계
	@Override
	public int seniorChangeCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.seniorChangeCount();
	}
	
	//일일게시글수 집계
	@Override
	public int freeboardWriteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.freeboardWriteCount();
	}

	//일일 판매금액 집계
	@Override
	public int orderlistCostSum() {
		// TODO Auto-generated method stub
		return adminmainMapper.orderlistCostSum();
	}

	//스토어현황
	  //등록된상품
	   @Override
	   public int registrationProductCount() {
		   // TODO Auto-generated method stub
		   return adminmainMapper.registrationProductCount();
	   }
	  //판매가능상품
	   @Override
	   public int possibilityProductCount() {
		   // TODO Auto-generated method stub
		   return adminmainMapper.possibilityProductCount();
	   }
	  //품절상품
	   @Override
   	   public int soldOutProductCount() {
		   // TODO Auto-generated method stub
		   return adminmainMapper.soldOutProductCount();
	   }
	
	//레슨현황
	  //등록된 레슨 
	   @Override
		public int registrationLessonCount() {
			// TODO Auto-generated method stub
			return adminmainMapper.registrationLessonCount();
		}

	   //오픈레슨
		@Override
		public int openLessonCount() {
			// TODO Auto-generated method stub
			return adminmainMapper.openLessonCount();
		}
	  //마감레슨
		@Override
		public int closeLessonCount() {
			// TODO Auto-generated method stub
			return adminmainMapper.closeLessonCount();
		}
	  //인원마감레슨
		@Override
		public int soldOutLessonCount() {
			// TODO Auto-generated method stub
			return adminmainMapper.soldOutLessonCount();
		}
		
	//주문현황
	  //주문완료
	  @Override
	  public int orderCompleteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.orderCompleteCount();
	  }
	  //배송중
	  @Override
	  public int orderDuringShippingCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.orderDuringShippingCount();
	  }
	  //배송완료
	  @Override
	  public int orderShippingCompleteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.orderShippingCompleteCount();
	  }
	  //주문취소
	  @Override
	  public int orderCancelCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.orderCancelCount();
	  }
		
	//결제현황
	  //결제완료
	  @Override
	  public int paymentCompleteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.paymentCompleteCount();
	  }
	  //환불진행
	  @Override
	  public int refundAcceptCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.refundAcceptCount();
	  }
	  //환불완료
	  @Override
      public int refundCompleteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.refundCompleteCount();
	  }  
		
	//레슨접수현황
	  //레슨신규접수  
	  @Override
	  public int newLessonAcceptCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.newLessonAcceptCount();
	  }
	  //레슨심사중
	  @Override
	  public int newLessonEvaluationCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.newLessonEvaluationCount();
	  }	
	  //레슨수락
	  @Override
	  public int newLessonAcceptanceCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.newLessonAcceptanceCount();
	  }
	  //레슨거절
	  @Override
	  public int newLessonRefuseCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.newLessonRefuseCount();
	  }
	  
	//시니어정산현황
	  //정산대기
	  @Override
	  public int seniorCalculateWaitCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.seniorCalculateWaitCount();
      }
	  //정산가능
	  @Override
	  public int seniorCalculatePossibleCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.seniorCalculatePossibleCount();
	  }
	  //정산완료
	  @Override
	  public int seniorCalculateCompleteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.seniorCalculateCompleteCount();
	  }
	  
	//1:1문의현황
	  //레슨문의
	  @Override
	  public int questionLessonCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.questionLessonCount();
	  }
	  //시니어문의
	  @Override
	  public int questionSeniorCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.questionSeniorCount();
	  }
	  //스토어문의
	  @Override
	  public int questionStoreCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.questionStoreCount();
	  }
	  //주문문의
	  @Override
	  public int questionOrderCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.questionOrderCount();
	  }
	  //기타문의
	  @Override
	  public int questionOtherCount() {
		// TODO Auto-generated method stub
	 	return adminmainMapper.questionOtherCount();
	  }
	  //답변대기
	  @Override
	  public int questionAnswerWaitCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.questionAnswerWaitCount();
	  }
	  //답변완료
	  @Override
	  public int questionAnswerCompleteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.questionAnswerCompleteCount();
	  }

	//레슨카테고리
	@Override
	public int lessonITCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonITCount();
	}

	@Override
	public int lessonCookCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonCookCount();
	}

	@Override
	public int lessonHandmadeCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonHandmadeCount();
	}

	@Override
	public int lessonSportCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonSportCount();
	}

	@Override
	public int lessonEducationCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonEducationCount();
	}

	@Override
	public int lessonOtherCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonOtherCount();
	}

	//상품카테고리
	@Override
	public int productITCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productITCount();
	}

	@Override
	public int productCookCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productCookCount();
	}

	@Override
	public int productHandmadeCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productHandmadeCount();
	}

	@Override
	public int productSportCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productSportCount();
	}

	@Override
	public int productEducationCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productEducationCount();
	}

	@Override
	public int productOtherCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productOtherCount();
	}

	//연령대별 회원현황
	@Override
	public int memberAge10Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge10Sum();
	}

	@Override
	public int memberAge20Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge20Sum();
	}

	@Override
	public int memberAge30Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge30Sum();
	}

	@Override
	public int memberAge40Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge40Sum();
	}

	@Override
	public int memberAge50Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge50Sum();
	}

	@Override
	public int memberAge60Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge60Sum();
	}

	@Override
	public int memberAge70PlusSum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge70PlusSum();
	}

	//매출통계(일별, 주별, 월별, 년별)
	@Override
	public List<OrderListDTO> adMainStatSalesAllChart(String ymd) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("ymd", ymd);
		
		return adminmainMapper.adMainStatSalesAllChart(hm);
	}

	//AmChart
	@Override
	public List<OrderListDTO> chartOutput() {
		// TODO Auto-generated method stub
		return adminmainMapper.chartOutput();
	}
	
}
