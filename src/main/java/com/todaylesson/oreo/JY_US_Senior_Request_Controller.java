package com.todaylesson.oreo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.maven.plugin.descriptor.MojoDescriptor;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.JY_US_SeniorService;

@Controller
public class JY_US_Senior_Request_Controller {

	@Resource(name="senior_service")
	private JY_US_SeniorService seniorservice;
	
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
	
	
	
	// 시니어 지원 버튼 팝업 > 예 누르면 시니어로 전환됨
	@RequestMapping("/todaylesson/senior_request_form")
	public String senior_Request_Button(Authentication authentication, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();
		
		int mem_level=seniorservice.check_senior(member_id);
		
		if (mem_level == 1) {
			// 시니어로 레벨업됨
			seniorservice.new_senior(member_id);
			model.addAttribute("mem_level",mem_level);

		} else {
			model.addAttribute("mem_level",mem_level);
		}


		return "TodayLesson_UserPage/jy_us_senior_form";

	}
	
	// 시니어 지원 버튼 팝업에서 예 누르면 나오는 폼
	@RequestMapping("/todaylessonsenior/senior_switch")
	public String senior_Switch(Model model, Authentication authentication, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();
		
		String imp_key 		=	"5422837446408379";
		String imp_secret	=	"FhzhNcakGqAxLiWaXndMLWKpsouBVOQB5pTTC3eitOPe6Mp39CPVyAl1YPCUEtwJTpDvsSOWGEaNqzQz";

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
	
		String token = getToken(request, response, json, "https://api.iamport.kr/users/getToken"); 
		model.addAttribute("token",token);
		
		return "TodayLesson_SeniorPage/jy_sn_senior_switch.sn_main_section";
	}
	
	// 당신은 이미 시니어 입니다.
	@RequestMapping("/todaylessonsenior/you_are_senior")
	public String you_are_senior() {
		return "TodayLesson_SeniorPage/jy_sn_you_are_senior";
	}
	
	
	// 관련 정보 입력하면 시니어 정보 업데이트
	@RequestMapping("/todaylessonsenior/plus_senior")
	public String plus_senior(SeniorDTO dto, Model model) {
		
		System.out.println(dto.toString());
		int result = seniorservice.plus_senior(dto);
		model.addAttribute("result",result);
		
		return "TodayLesson_SeniorPage/jy_sn_senior_insert_result";
	}
	
	@RequestMapping("/todaylessonsenior/senior_switch_update/{member_id}")
	public String senior_info_update( Authentication authentication, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();
		
		String imp_key 		=	"5422837446408379";
		String imp_secret	=	"FhzhNcakGqAxLiWaXndMLWKpsouBVOQB5pTTC3eitOPe6Mp39CPVyAl1YPCUEtwJTpDvsSOWGEaNqzQz";

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
	
		String token = getToken(request, response, json, "https://api.iamport.kr/users/getToken"); 
		model.addAttribute("token",token);
		
		
		SeniorDTO dto = seniorservice.select_senior(member_id);
		model.addAttribute("dto",dto);
		
		
		return "TodayLesson_SeniorPage/jy_sn_senior_switch_update.sn_main_section";
	}
	
	@RequestMapping("/todaylessonsenior/update_senior_result")
	public String senior_update(SeniorDTO dto, Model model) {
		
		int result = seniorservice.update_senior(dto);
		model.addAttribute("result",result);
		model.addAttribute("member_id",dto.getMember_id());
		
		return "TodayLesson_SeniorPage/jy_sn_update_senior_result";
	}
	

	
	
}
