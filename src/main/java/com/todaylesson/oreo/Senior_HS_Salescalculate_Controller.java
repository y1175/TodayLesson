package com.todaylesson.oreo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.CalculateDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.Senior_HS_Salescalculate_Service;

@Controller
@RequestMapping("/todaylessonsenior/")
public class Senior_HS_Salescalculate_Controller {
	
	@Resource(name="senior_HS_Salescalculate_Service")
	private Senior_HS_Salescalculate_Service salescalculateService;
	
	//매출현황
	@RequestMapping("/senior_sales_list/{senior_no}")
	public String salesList(Authentication authentication
			               ,@PathVariable int senior_no
			               ,@RequestParam(required=false, defaultValue="") String start_date
			               ,@RequestParam(required=false, defaultValue="") String end_date
			               ,@RequestParam(required=false, defaultValue="1") int currPage
			               ,@RequestParam(required=false, defaultValue="") String search
			               ,@RequestParam(required=false, defaultValue="") String searchtxt
			               //,@RequestParam(required=false, defaultValue="freeboard_no") String order
			               , Model model) {
		//시큐리티 멤버아이디
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		int seniorSales_TotalCount=salescalculateService.seniorSales_TotalCount(senior_no,search,searchtxt);
		int pageSize=15;
		int blockSize=5;
		
		
		PageMaker Totalpage = new PageMaker(currPage, seniorSales_TotalCount, pageSize, blockSize);
		
		//매출현황전체리스트
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> salesList=
	         salescalculateService.salesList(senior_no, start_date, end_date, search, searchtxt, Totalpage.getStartRow(), Totalpage.getEndRow()); 
		
		model.addAttribute("salesList", salesList);
		model.addAttribute("Totalpage", Totalpage);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("start_date",start_date);
		model.addAttribute("end_date",end_date);
		model.addAttribute("senior_no",senior_no);
		return "/TodayLesson_SeniorPage/hs_sn_sales_list.sn_main_section";
	}
	
	//정산신청
	@RequestMapping("/senior_calculate_requestlist/{senior_no}")
	public String calculateRequestList( SeniorDTO dto, Model model
			                          , Authentication authentication
			                          , HttpServletRequest request,HttpServletResponse response
			                          ,@PathVariable int senior_no
			                          ) throws Exception {
		
		//시큐리티 멤버아이디
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();

		//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_requestlist
		                          =salescalculateService.calculateRequsetList(senior_no);
		model.addAttribute("cal_requestlist", cal_requestlist);
		
		//정산신청  정산계좌
		/*List<SeniorDTO> cal_SeniorAccount=salescalculateService.cal_SeniorAccount(member_id);
		model.addAttribute("cal_SeniorAccount", cal_SeniorAccount);*/
				
		//정산신청 리스트 결제건수
		List<Integer> cal_paycount=salescalculateService.calPayCount(senior_no);
		model.addAttribute("cal_paycount", cal_paycount);
		
		//정산신청 리스트 레스수익금액
		List<Integer> cal_lessonrevenuecost=salescalculateService.calRevenueCost(senior_no);
		model.addAttribute("cal_lessonrevenuecost", cal_lessonrevenuecost);

		//정산신청 리스트 포인트사용
		List<Integer> cal_usepointsum=salescalculateService.calUsePointSum(senior_no);
		model.addAttribute("cal_usepointsum", cal_usepointsum);
		
		//정산신청 정산수수료 세금계산서 부가세
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_CommSurtax
				                  =salescalculateService.cal_CommSurtax(senior_no);
		model.addAttribute("cal_CommSurtax", cal_CommSurtax);
		
		//정산신청 시니어디테일
		SeniorDTO accountdetalidto=salescalculateService.accountDetailDTO(member_id);
		model.addAttribute("accountdetalidto", accountdetalidto);
		
		//토큰값
		String imp_key 		=	"5422837446408379";
		String imp_secret	=	"FhzhNcakGqAxLiWaXndMLWKpsouBVOQB5pTTC3eitOPe6Mp39CPVyAl1YPCUEtwJTpDvsSOWGEaNqzQz";

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
	
		String token = getToken(request, response, json, "https://api.iamport.kr/users/getToken"); 
		model.addAttribute("token",token);
		
		
		//정산신청가능금액
		Integer calculate_possibilitycost=salescalculateService.calculate_PossibilityCost(senior_no);
		model.addAttribute("calculate_possibilitycost", calculate_possibilitycost);

		
		//정산대기금액
		Integer calculate_waitingcost=salescalculateService.calculate_WaitingCost(senior_no);
		model.addAttribute("calculate_waitingcost", calculate_waitingcost );
		
		//시니어 지급계좌 및 신청정보
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_SeniorInfo
		            =salescalculateService.cal_SeniorInfo(senior_no);
		model.addAttribute("cal_SeniorInfo", cal_SeniorInfo);
		
		return "/TodayLesson_SeniorPage/hs_sn_calculate_requestlist.sn_main_section";
	}
	
	//  아임포트의 토큰 값 받아오기
	public String getToken(HttpServletRequest request,HttpServletResponse response,JSONObject json,String requestURL) throws Exception{
		String _token = "";

		try{

			String requestString = "";
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setInstanceFollowRedirects(false);  
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());
			connection.connect();
			StringBuilder sb = new StringBuilder(); 
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = br.readLine()) != null) { 
					sb.append(line + "\n");  
				}
				br.close();
				requestString = sb.toString();
			}
			os.flush();
			connection.disconnect();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if((Long)jsonObj.get("code")  == 0){
				JSONObject getToken = (JSONObject) jsonObj.get("response");
				System.out.println("getToken==>>"+getToken.get("access_token") );
				_token = (String)getToken.get("access_token");
			}
 
		}catch(Exception e){
			e.printStackTrace();
			_token = "";
		}
		return _token;
	}
	
	//정산신청 계좌정보수정
	@RequestMapping("/senior_calculate_accountupdateresult")
	public String calculateRequestAccountUpdateResult (SeniorDTO dto, Model model)  {
		
		//정산신청 시니어계좌정보수정
		int accountupdatedto=salescalculateService.accountUpdateDTO(dto);
		model.addAttribute("accountupdatedto", accountupdatedto);
		
		return "TodayLesson_SeniorPage/hs_sn_calculate_accountupdateresult";
	}
	
	//정산신청
	@RequestMapping("/senior_calculate_senior_calculate_requestresult")
	public String calculateRequestResult (CalculateDTO dto, OrderListDTO orderdto, Model model
			                             , Authentication authentication
                                         , HttpServletRequest request,HttpServletResponse response)  {
		
		//시큐리티 멤버아이디
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		//정산신청 시니어디테일
		SeniorDTO accountdetalidto=salescalculateService.accountDetailDTO(member_id);
		model.addAttribute("accountdetalidto", accountdetalidto);		
		
		//정산신청 
		int calculateRequestResult=salescalculateService.calculateRequestResult(dto);
		model.addAttribute("calculateRequestResult", calculateRequestResult);
		
		int updateOrderCalculateStatus=salescalculateService.updateOrderCalculateStatus(orderdto);
		
		return "TodayLesson_SeniorPage/hs_sn_calculate_requestresult";
	}

	//정산내역
	@RequestMapping("/senior_calculate_statementlist")
	public String calculateStatementList(Model model,
			                             Authentication authentication) {
		//시큐리티 멤버아이디
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		//정산내역 리스트
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_statementlist
		                          =salescalculateService.calStatementList(member_id);
		model.addAttribute("cal_statementlist", cal_statementlist);
		
		//정산내역 리스트 결제건수
		List<Integer> cal_statement_paycount=salescalculateService.calStatementPayCount(member_id);
		model.addAttribute("cal_statement_paycount", cal_statement_paycount);
				
		//정산내역 리스트 레스수익금액
		List<Integer> cal_statement_lessonrevenuecost=salescalculateService.calStatementRevenueCost(member_id);
		model.addAttribute("cal_statement_lessonrevenuecost", cal_statement_lessonrevenuecost);

		//정산내역 리스트 포인트사용
		List<Integer> cal_statement_usepointsum=salescalculateService.calStatementUsePointSum(member_id);
		model.addAttribute("cal_statement_usepointsum", cal_statement_usepointsum);
		
		return "/TodayLesson_SeniorPage/hs_sn_calculate_statementlist.sn_main_section";
	}
	
}
