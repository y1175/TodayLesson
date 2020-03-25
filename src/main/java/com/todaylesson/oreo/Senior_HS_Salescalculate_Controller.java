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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.Senior_HS_Salescalculate_Service;

@Controller
@RequestMapping("/todaylessonsenior/")
public class Senior_HS_Salescalculate_Controller {
	
	@Resource(name="senior_HS_Salescalculate_Service")
	private Senior_HS_Salescalculate_Service salescalculateService;
	
	@RequestMapping("/senior_sales_list/{member_id}")
	public String salesList(@PathVariable String member_id
	            		   ,@RequestParam(required=false, defaultValue="") String sales_search_startdate
			               ,@RequestParam(required=false, defaultValue="") String sales_search_enddate
			               ,@RequestParam(required=false, defaultValue="") String search
			               ,@RequestParam(required=false, defaultValue="") String searchtxt
			               , Model model) {
		//매출현황전체리스트
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> salesList=
	         salescalculateService.salesList(member_id, sales_search_startdate, sales_search_enddate, search, searchtxt); 
		
		model.addAttribute("salesList", salesList);
		//model.addAttribute("start_date",start_date);
		//model.addAttribute("end_date",end_date);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		return "/TodayLesson_SeniorPage/hs_sn_sales_list.sn_main_section";
	}
	
	@RequestMapping("/senior_calculate_requestlist/{member_id}")
	public String calculateRequestList( @PathVariable String member_id, SeniorDTO dto, Model model) {
		//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> cal_requestlist=salescalculateService.calculateRequsetList(member_id);
		model.addAttribute("cal_requestlist", cal_requestlist);
		
		//정산신청 리스트 결제건수
		List<Integer> cal_paycount=salescalculateService.calPayCount(member_id);
		model.addAttribute("cal_paycount", cal_paycount);
		
		//정산신청 리스트 레스수익금액
		List<Integer> cal_lessonrevenuecost=salescalculateService.calRevenueCost(member_id);
		model.addAttribute("cal_lessonrevenuecost", cal_lessonrevenuecost);

		//정산신청 리스트 포인트사용
		List<Integer> cal_usepointsum=salescalculateService.calUsePointSum(member_id);
		model.addAttribute("cal_usepointsum", cal_usepointsum);
		
		//정산신청 시니어디테일
		SeniorDTO accountdetalidto=salescalculateService.accountDetailDTO(member_id);
		model.addAttribute("accountdetalidto", accountdetalidto);
		
		//정산신청가능금액
		/*int calculate_possibilitycost=salescalculateService.calculate_PossibilityCost(member_id);
		model.addAttribute("calculate_possibilitycost", calculate_possibilitycost);*/

		//정산대기금액
		/*int calculate_waitingcost=salescalculateService.calculate_WaitingCost(member_id);
		model.addAttribute("calculate_waitingcost", calculate_waitingcost );*/
		
		//정산신청 리스트 레스취소금액
		//List<Integer> cal_lseeoncancelcost=salescalculateService.calCancelCost(senior_no);
		//model.addAttribute("cal_lseeoncancelcost", cal_lseeoncancelcost);
	
		//정산신청 리스트 포인트취소
		//List<Integer> cal_cancelpointsum=salescalculateService.calCancelPointSum(senior_no);
		//model.addAttribute("cal_cancelpointsum", cal_cancelpointsum);
		
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
	
	@RequestMapping("/senior_calculate_accountupdateresult")
	public String calculateRequestAccountUpdateResult (SeniorDTO dto, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String imp_key 		=	"5422837446408379";
		String imp_secret	=	"FhzhNcakGqAxLiWaXndMLWKpsouBVOQB5pTTC3eitOPe6Mp39CPVyAl1YPCUEtwJTpDvsSOWGEaNqzQz";

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
	
		String token = getToken(request, response, json, "https://api.iamport.kr/users/getToken"); 
		model.addAttribute("token",token);
		
		//정산신청 시니어계좌정보수정
		int accountupdatedto=salescalculateService.accountUpdateDTO(dto);
		model.addAttribute("accountupdatedto", accountupdatedto);
		
		return "TodayLesson_SeniorPage/hs_sn_calculate_accountupdateresult";
	}

}
